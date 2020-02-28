//
//  XBCommonDialog.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import XBBaseUIKit

typealias ClickBlock = () -> Void

class XBCommonDialog: UIViewController {
    
    private var leftBtn: BtnConfig?
    private var rightBtn: BtnConfig?
    private var centerBtn: BtnConfig?
    private var titleStr:String
    private var contentStr:String
    
    init(title: String = "", content: String = "", leftBtn: BtnConfig? = nil, rightBtn: BtnConfig? = nil) {
        titleStr = title
        self.contentStr = content
        self.leftBtn = leftBtn
        self.rightBtn = rightBtn
        if(leftBtn == nil && rightBtn != nil) {
            centerBtn = rightBtn
        } else if(leftBtn != nil && rightBtn == nil) {
            centerBtn = leftBtn
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
    
    private lazy var leftButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(leftBtn?.text, for: .normal)
        btn.setTitleColor(UIColor(hex:"#35CBDB"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var rightButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(rightBtn?.text, for: .normal)
        btn.setTitleColor(UIColor(hex:"#35CBDB"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(rightBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    
    private lazy var centerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(centerBtn?.text, for: .normal)
        btn.setTitleColor(UIColor(hex:"#35CBDB"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)
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
        btn.titleLabel?.font = 18.bf
        return btn
    }()
    
    private lazy var content: UILabel = {
        let tv = UILabel()
        tv.numberOfLines = 0
        tv.attributedText = contentStr.hw_toAttribute().hw_addLineSpace(5)
        tv.textColor = "#333333".c
        tv.font = 15.f
        tv.textAlignment = .center
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        
    }
    
    
    
    func makeUI () {
        //
        view.addSubview(bg)
        bg.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(270)
            make.top.bottom.equalToSuperview()
        }
        
        bg.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-51)
            make.height.equalTo(0.5)
        }
        
        if(centerBtn == nil) {
            bg.addSubview(leftButton)
            leftButton.snp.makeConstraints { (make) in
                make.left.bottom.equalToSuperview()
                make.top.equalTo(line.snp.bottom)
            }
            bg.addSubview(rightButton)
            rightButton.snp.makeConstraints { (make) in
                make.left.equalTo(leftButton.snp.right)
                make.width.equalTo(leftButton)
                make.top.equalTo(line.snp.bottom)
                make.right.bottom.equalToSuperview()
            }
        } else {
            bg.addSubview(centerButton)
            centerButton.snp.makeConstraints { (make) in
                make.left.right.bottom.equalToSuperview()
                make.top.equalTo(line.snp.bottom)
            }
        }
        
        bg.addSubview(content)
        
        let edge = UIEdgeInsets(top: 25, left: 25, bottom: 15, right: 25)
        
        if(!titleStr.isEmpty) {
            let container = UIStackView()
            container.spacing = 14
            container.axis = .vertical
            container.distribution = .fill
            container.addArrangedSubview(titleLable)
            container.addArrangedSubview(content)
            bg.addSubview(container)
            container.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(edge)
                $0.top.equalTo(bg.snp.top).offset(25)
                $0.bottom.equalTo(line.snp.top).offset(-25)
            }
            titleLable.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
            }
        } else {
            content.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview().inset(edge)
                make.top.equalTo(bg.snp.top).offset(25)
                make.bottom.equalTo(line.snp.top).offset(-15)
            }
        }
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        let newSize = view.systemLayoutSizeFitting(size)
        print("\(newSize.width)")
        view.frame.size = newSize
        //        let size = .systemLayoutSizeFitting(layoutAttributes.size)
        //        var newFrame = layoutAttributes.frame
        // note: don't change the width
        //        newFrame.size.height = ceil(size.height)
        //        layoutAttributes.frame = newFrame
        //        return layoutAttributes
        
    }
    
    let size = CGSize.init(width: 100, height: 100)
    
    @objc func rightBtnTapped() {
        if let config = rightBtn {
            config.click?()
            if(config.dismissOnTap) {
                    dismiss(animated: true)
            }
            
        }
       
    }
    
    @objc func leftButtonTapped() {
        if let config = leftBtn {
            config.click?()
            if(config.dismissOnTap) {
                    dismiss(animated: true)
            }
            
        }
    }
    
    @objc func centerButtonTapped() {
        if let config = centerBtn {
            config.click?()
            if(config.dismissOnTap) {
                    dismiss(animated: true)
            }
            
        }
    }
}

extension UILabel {
    func lineSpacing(_ spacing: Float) {
        let paragraphStye = NSMutableParagraphStyle()
        //调整行间距
        paragraphStye.lineSpacing = 30.0
        //        paragraphStye.lineSpacing = CGFloat(spacing) - font.lineHeight/4
        paragraphStye.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStye.alignment = textAlignment
        let attributedString = NSMutableAttributedString.init(string: text ?? "", attributes: [NSAttributedString.Key.paragraphStyle:paragraphStye])
        attributedText = attributedString
    }
}

struct BtnConfig {
    var text: String
    var click: ClickBlock?
    var dismissOnTap: Bool
    
    init(text: String, click: ClickBlock? = nil, dismissOnTap: Bool = true) {
        self.text = text
        self.click = click
        self.dismissOnTap = dismissOnTap
    }
}
