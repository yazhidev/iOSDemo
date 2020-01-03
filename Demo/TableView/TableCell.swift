//
//  TableCell.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/3.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit

class AccountCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let title = UILabel()
        title.text = "测试代码测试测试代码测试测试代码测试测试代码测试测试代码测试"
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = UIColor(hexCode: "#222222")
        title.numberOfLines = 1
        contentView.addSubview(title)
        title.snp.makeConstraints{(make) -> Void in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        
        let gotoDetail = UILabel()
        gotoDetail.text = "查看详情"
        gotoDetail.font = UIFont.systemFont(ofSize: 14)
        gotoDetail.textColor = UIColor(hexCode: "#03B1FF")
        contentView.addSubview(gotoDetail)
        gotoDetail.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalTo(title.snp.centerY)
            make.left.equalTo(title.snp.right).offset(10)
        }
        
        let info = UILabel()
        info.text = "商品购买"
        info.font = UIFont.systemFont(ofSize: 13)
        info.textColor = UIColor(hexCode: "#AAAAAA")
        contentView.addSubview(info)
        info.snp.makeConstraints { (make) in
            make.left.equalTo(title.snp.left)
            make.top.equalTo(title.snp.bottom).offset(8)
        }
        
        let time = UILabel()
        time.text = "2020年1月1日"
        time.font = UIFont.systemFont(ofSize: 13)
        time.textColor = UIColor(hexCode: "#666666")
        contentView.addSubview(time)
        time.snp.makeConstraints { (make) in
            make.left.equalTo(title.snp.left)
            make.top.equalTo(info.snp.bottom).offset(8)
        }
     
        let price = UILabel()
        price.text = "+3000元"
        price.font = UIFont.systemFont(ofSize: 20)
        price.textColor = UIColor(hexCode: "#00CC99")
        contentView.addSubview(price)
        price.snp.makeConstraints { (make) in
           make.right.equalTo(gotoDetail.snp.right)
           make.centerY.equalTo(time.snp.centerY)
        }
        
        let line = UILabel()
        line.backgroundColor = UIColor(hexCode: "#ececec")
        contentView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.equalTo(price.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalTo(0)
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
