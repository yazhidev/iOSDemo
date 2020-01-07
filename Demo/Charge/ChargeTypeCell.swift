//
//  ChargeTypeCell.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/7.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class ChargeTypeCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let tv = PaddingLabel()
        tv.paddingTop = 15
        tv.paddingLeft = 15
        tv.paddingBottom = 4
        self.contentView.addSubview(tv)
        tv.text = "支付方式"
        tv.textColor = UIColor(hexCode: "#222222")
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.backgroundColor = UIColor(hexCode: "#f7f7f7")
        tv.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            //                make.bottom.equalTo(0)
        }
        
        let h = ChargeHeader()
        print("----add 2 sub")
        self.contentView.addSubview(h)
        
        h.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(tv.snp.bottom)
            make.bottom.equalTo(0)
            make.height.equalTo(100)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
