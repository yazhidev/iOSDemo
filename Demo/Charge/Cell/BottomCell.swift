//
//  BottomCell.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/8.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class BottomCell: UITableViewCell {
    
    private let agreementTv: UILabel = {
        let tv = UILabel()
        tv.font = UIFont.systemFont(ofSize: 13)
        tv.text = "我已同意《家有学霸充值用户协议》"
        let mutableStr = NSMutableAttributedString(string: tv.text!)
        mutableStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexCode: "#aaaaaa"), range: NSRange(location: 0, length: 4))
        mutableStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexCode: "#03B1FF"), range: NSRange(location: 4, length: mutableStr.length - 4))
        tv.attributedText = mutableStr
        tv.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(click))
        tv.addGestureRecognizer(tap)
        return tv
    }()
    
    private let parentPayBtn: UILabel = {
        let btn = PaddingLabel()
        btn.paddingTop = 10
        btn.paddingBottom = 10
        btn.text = "家长代付"
        btn.textColor = AppBlue
        btn.font = UIFont.systemFont(ofSize: 18)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = btn.bounds.size.height/2
        btn.layer.borderWidth = 1
        btn.textAlignment = .center
        btn.layer.borderColor = AppBlue.cgColor
        return btn
    }()
    
    private let payNowBtn: UILabel = {
        let btn = PaddingLabel()
        btn.paddingTop = 10
        btn.paddingBottom = 10
        btn.text = "立即代付"
        btn.textColor = UIColor.white
        btn.textAlignment = .center
        btn.font = UIFont.systemFont(ofSize: 18)
        
        btn.layer.backgroundColor = AppBlue.cgColor
        btn.layer.shadowOffset =  CGSize(width: 0, height: 5)
        btn.layer.shadowOpacity = 0.8
        btn.layer.shadowColor = UIColor(hexCode: "#7CD6F9").cgColor
        btn.layer.shadowRadius = 6
        return btn
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor(hexCode: "#F7F7F7")
        
        self.contentView.addSubview(agreementTv)
        self.contentView.addSubview(parentPayBtn)
        self.contentView.addSubview(payNowBtn)
        
        DispatchQueue.main.async {
            self.parentPayBtn.layer.cornerRadius = self.parentPayBtn.bounds.height/2
            self.payNowBtn.layer.cornerRadius = self.payNowBtn.bounds.height/2
        }
        
        agreementTv.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
        }
        
        parentPayBtn.snp.makeConstraints { (make) in
            make.top.equalTo(agreementTv.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(45)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        payNowBtn.snp.makeConstraints { (make) in
            make.width.equalTo(parentPayBtn.snp.width)
            make.top.equalTo(parentPayBtn.snp.top)
            make.left.equalTo(parentPayBtn.snp.right).offset(45)
            make.right.equalToSuperview().offset(-45)
        }
        
        
    }
    
    @objc func click() {
        print("click agree")
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
