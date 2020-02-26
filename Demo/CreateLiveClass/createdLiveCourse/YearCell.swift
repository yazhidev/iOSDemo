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
import XBBaseUIKit

class YearCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.textColor = "#666666".c
        view.font = 14.f
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(label)

        label.snp.makeConstraints {
            $0.left.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
        }

    }
//
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//           setNeedsLayout()
//           layoutIfNeeded()
//           let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//        print("zyz:height1 \(size.height)")
//           var newFrame = layoutAttributes.frame
//           // note: don't change the width
//           newFrame.size.height = ceil(size.height)
//           layoutAttributes.frame = newFrame
//           return layoutAttributes
//       }
}
