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
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
        collectionView.dataSource = self
        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.additionalSafeAreaInsets.top).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: self.additionalSafeAreaInsets.bottom).isActive = true
     }

    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height * 0.3)
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }
}

extension LegacyViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionCell.reuseIdentifier,
            for: indexPath) as? CollectionCell else { fatalError("Cannot create new cell") }
        // Return the cell.
        cell.contentView.backgroundColor = .white
        return cell
    }
}

class SectionCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.collectionViewLayout = createLayout()
        self.register(TextCell.self, forCellWithReuseIdentifier: TextCell.reuseIdentifier)
        self.contentInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        self.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.frame.width / 2, height: self.bounds.height - 40)
        return layout
    }
}

extension SectionCollectionView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
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
