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
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hexCode: "#03B1FF").cgColor
        
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowOpacity = 0.8
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowRadius = 3
        
        let price = UILabel()
        price.textColor = UIColor(hexCode: "#03B1FF")
        price.text = "2000元"
        price.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(price)
        price.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }

        let now = UILabel()
        now.textColor = UIColor(hexCode: "#03B1FF")
        now.text = "售价1000元"
        now.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(now)
        now.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(price.snp.bottom).offset(5)
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


