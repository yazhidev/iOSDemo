//
//  BottomCell.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/8.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class BottomCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tv = UILabel()
        tv.font = UIFont.systemFont(ofSize: 13)
        tv.text = "我已同意《家有学霸充值用户协议》"
        
        let mutableStr = NSMutableAttributedString(string: tv.text!)
        mutableStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexCode: "#aaaaaa"), range: NSRange(location: 0, length: 4))
        mutableStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexCode: "#03B1FF"), range: NSRange(location: 4, length: mutableStr.length - 4))
        tv.attributedText = mutableStr
        
        self.contentView.addSubview(tv)
        self.contentView.backgroundColor = UIColor(hexCode: "#F7F7F7")
        tv.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
        tv.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(click))
        tv.addGestureRecognizer(tap)
        
    }
    
    @objc func click() {
        print("click agree")
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
