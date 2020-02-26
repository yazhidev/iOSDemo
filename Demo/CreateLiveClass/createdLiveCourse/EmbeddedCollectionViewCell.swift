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
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = false
        self.contentView.addSubview(view)

        view.backgroundColor = .clear
//        layer.shadowOffset =  CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = "#7CD6F9".c.cgColor
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
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
//        collectionView.frame = contentView.frame
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        print("zyz:prefer \(collectionView.contentSize.height)")
        return layoutAttributes
    }
    
    
}
