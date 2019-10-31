//
//  CollectionCell.swift
//  CompositionalLayoutsSample
//
//  Created by 伊藤凌也 on 2019/11/01.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    static let reuseIdentifier = "collectionCell"

    var collectionView: SectionCollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.collectionView = SectionCollectionView(frame: self.bounds, collectionViewLayout: .init())
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        self.collectionView.backgroundColor = .white
    }
}
