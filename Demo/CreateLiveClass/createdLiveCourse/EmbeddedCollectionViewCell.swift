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
//        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = false
//        view.alwaysBounceHorizontal = false
        self.contentView.addSubview(view)

//        view.backgroundColor = .white

        view.layer.cornerRadius = 6
        view.layer.backgroundColor = UIColor.white.cgColor

        view.layer.shadowOffset =  CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = "#000000".c.withAlphaComponent(0.12).cgColor
        view.layer.shadowRadius = 6
        view.layer.masksToBounds = false
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
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return layoutAttributes
    }
    
    
}
