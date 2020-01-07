//
//  ChargeHeader.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/7.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit

class ChargeHeader: UIView {
    
    private let title: UILabel = {
        let tv = PaddingLabel()
        tv.paddingTop = 58
        tv.paddingLeft = 20
        tv.paddingBottom = 10
        tv.font = UIFont.boldSystemFont(ofSize: 30)
        tv.textColor = UIColor.white
        tv.text = "平台通用余额充值"
        return tv
    }()
    
    private let bg: UIImageView = {
        let bg = UIImageView(image: UIImage(named: "bg"))
        return bg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error")
    }
    
    func setUp() {
        self.addSubview(bg)
        self.addSubview(title)
        self.backgroundColor = UIColor.blue
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        title.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
        }
        bg.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(title.snp.bottom)
        }
        
    }
    
    
}
