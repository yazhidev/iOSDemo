//
//  EmbeddedCollectionViewCell.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit
import UIKit

final class EmbeddedCollectionViewCell: UICollectionViewCell {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = false
        self.contentView.addSubview(view)
        return view
    }()

    lazy var bg: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(bg)
        bg.addSubview(collectionView)
        bg.frame = contentView.frame
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        collectionView.backgroundColor = .orange
//        collectionView.frame = contentView.frame
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        print("zyz:prefer \(collectionView.contentSize.height)")
        return layoutAttributes
    }
    
    
}
