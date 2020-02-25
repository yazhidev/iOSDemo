//
//  CreatedLiveCourseCell.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

class MonthCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .yellow
        view.textAlignment = .left
        view.textColor = .black
        view.font = 18.f
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
//                .inset(UIEdgeInsets(top: 5, left: 20, bottom: 30, right: 4))
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
           setNeedsLayout()
           layoutIfNeeded()
           let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        print("zyz:height1 \(size.height)")
           var newFrame = layoutAttributes.frame
           // note: don't change the width
           newFrame.size.height = ceil(size.height)
           layoutAttributes.frame = newFrame
           return layoutAttributes
       }
}
