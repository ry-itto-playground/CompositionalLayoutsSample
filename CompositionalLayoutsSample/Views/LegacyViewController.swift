//
//  LegacyViewController.swift
//  CompositionalLayoutsSample
//
//  Created by 伊藤凌也 on 2019/11/01.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

class LegacyViewController: UIViewController {

    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
    }

    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        view.addSubview(collectionView)
     }

    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width - 40, height: view.bounds.height * 0.3)
        return layout
    }
}

extension LegacyViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TextCell.reuseIdentifier,
            for: indexPath) as? TextCell else { fatalError("Cannot create new cell") }

        // Populate the cell with our item description.
        cell.label.text = "\(indexPath.section), \(indexPath.item)"
        cell.contentView.backgroundColor = .green
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 8
        cell.label.textAlignment = .center
        cell.label.font = UIFont.preferredFont(forTextStyle: .title1)

        // Return the cell.
        return cell
    }
}
