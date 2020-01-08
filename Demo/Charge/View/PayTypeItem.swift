//
//  PayTypeItem.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/8.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class PayTypeItem: UIView {
    
    private let title: UILabel = {
           let tv = PaddingLabel()
           tv.paddingLeft = 20
           tv.font = UIFont.systemFont(ofSize: 15)
           tv.textColor = UIColor(hexCode: "#666666")
           tv.text = "支付宝支付"
           return tv
       }()
       
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
