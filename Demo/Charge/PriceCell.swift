//
//  Price.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/6.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit

class PriceCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tv = UILabel()
        tv.text = "1000"
//        tv.textColor = UIColor.blue
//        tv.font = UIFont.systemFont(ofSize: 20)
        tv.backgroundColor = UIColor.red
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(tv)
        tv.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(100)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        self.setNeedsLayout()
//        self.layoutIfNeeded()
//        let size = self.contentView.systemLayoutSizeFitting(layoutAttributes.size)
//        var cellFrame = layoutAttributes.frame
//        cellFrame.size.height = size.height
//        layoutAttributes.frame = cellFrame
//        return layoutAttributes
//    }
    
   
}


