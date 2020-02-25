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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.backgroundColor = .orange
        collectionView.frame = contentView.frame
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        print("zyz:prefer \(collectionView.contentSize.height)")
        return layoutAttributes
    }
    
    
}
