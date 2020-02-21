//
//  XBCommonDialog.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class XBCommonDialog: UIViewController {
    
    typealias ConfirmBlock = () -> Void
    
    var confirmBlock: ConfirmBlock?
    
    var titleStr:String
    var contentStr:String
    var leftBtnText:String
    var rightBtnText:String
    var centerBtnText: String = ""
    
    let size = CGSize.init(width: 270, height: 403)
    
    init(title: String = "", content: String = "", leftBtnText: String = "", rightBtnText: String = "") {
        titleStr = title
        self.contentStr = content
        self.leftBtnText = leftBtnText
        self.rightBtnText = rightBtnText
        if(leftBtnText.isEmpty && !rightBtnText.isEmpty ) {
            centerBtnText = rightBtnText
        } else if(!leftBtnText.isEmpty && rightBtnText.isEmpty ) {
            centerBtnText = leftBtnText
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var bg: UIView = {
        let bg = UIView()
        bg.backgroundColor = .white
        bg.layer.cornerRadius = 12
        bg.layer.masksToBounds = true
        return bg
    }()
    
    private lazy var cancel: UIButton = {
        let btn = UIButton()
        btn.setTitle(leftBtnText, for: .normal)
        btn.setTitleColor(UIColor(hex:"#35CBDB"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var confirm: UIButton = {
        let btn = UIButton()
        btn.setTitle(rightBtnText, for: .normal)
        btn.setTitleColor(UIColor(hex:"#35CBDB"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(confirmBtnTapped), for: .touchUpInside)
        return btn
    }()

    
    private lazy var centerBtn: UIButton = {
           let btn = UIButton()
           btn.setTitle(centerBtnText, for: .normal)
           btn.setTitleColor(UIColor(hex:"#35CBDB"), for: .normal)
           btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
           btn.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
           return btn
       }()
    
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "#EEEEEE")
        return line
    }()
    
    private lazy var titleLable: UIButton = {
        let btn = UIButton()
        btn.setTitle(titleStr, for: .normal)
        btn.setTitleColor("#222222".c, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return btn
    }()
    
    private lazy var content: UILabel = {
        let tv = UILabel()
        tv.numberOfLines = 0
        tv.text = contentStr
        tv.textColor = "#333333".c
        tv.font = 15.f
        
        let lineHeight = CGFloat(10.0)
        
        let paragraphStye = NSMutableParagraphStyle()
         //调整行间距
        paragraphStye.lineSpacing = 9.0 - tv.font.lineHeight/4
         paragraphStye.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStye.alignment = .center
        let attributedString = NSMutableAttributedString.init(string: contentStr, attributes: [NSAttributedString.Key.paragraphStyle:paragraphStye])
         tv.attributedText = attributedString
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        
    }
    
    
    
    func makeUI () {
        
        view.snp.makeConstraints { (make) in
            make.size.equalTo(size)
        }
        
        view.addSubview(bg)
        bg.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(size)
        }
        
        bg.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-51)
            make.height.equalTo(0.5)
        }
        
        if(centerBtnText.isEmpty) {
            bg.addSubview(cancel)
            cancel.snp.makeConstraints { (make) in
                make.left.bottom.equalToSuperview()
                make.top.equalTo(line.snp.bottom)
            }
            bg.addSubview(confirm)
            confirm.snp.makeConstraints { (make) in
                make.left.equalTo(cancel.snp.right)
                make.width.equalTo(cancel)
                make.top.equalTo(line.snp.bottom)
                make.right.bottom.equalToSuperview()
            }
        } else {
            bg.addSubview(centerBtn)
            centerBtn.snp.makeConstraints { (make) in
                make.left.right.bottom.equalToSuperview()
                make.top.equalTo(line.snp.bottom)
            }
        }
        
        bg.addSubview(content)
        
        if(!titleStr.isEmpty) {
            bg.addSubview(titleLable)
            
            titleLable.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(25)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(content.snp.top)
            }
        }
        
//        bg.addSubview(content)
        content.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
//            make.top.equalTo(titleLable.snp.bottom)
            make.top.equalTo(titleStr.isEmpty ? bg.snp.top : titleLable.snp.bottom)
            
            make.bottom.equalTo(line.snp.top)
        }
        
       
    }
    
    @objc func confirmBtnTapped() {
        if let block = confirmBlock {
            block()
        }
        self.dismiss(animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}
