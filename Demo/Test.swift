//
//  Test.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/27.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import Foundation
import UIKit
import XBBaseUIKit

public class CreateHQLiveCourseSucViewController: XBViewController {
    
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = "#E1E1E1".c
        return line
    }()
    
    lazy var icon: UIImageView = {
        //        let ig = UIImageView.init(image: UIImage.init(imageNameForTeaiPhoneBundle: "createCourseSuccess"))
        let ig = UIImageView()
        return ig
    }()
    
    lazy var titleLable: UILabel = {
        let tv = UILabel()
        tv.text = "精品直播课创建成功"
        tv.font = 18.bf
        tv.textColor = "#222222".c
        return tv
    }()
    
    lazy var contentLable: UILabel = {
        let tv = UILabel()
        tv.numberOfLines = 0
        tv.textAlignment = .center
        tv.attributedText = "恭喜，您的精品直播课创建成功，本次课程的最低开课人数为10人，为了达到开课要求，每周开设2次以上的免费公开课，对直播课进行全力的招生宣传，是确保直播课能够顺利开课的重要前提哦~".hw_toAttribute().hw_addLineSpace(7)
        tv.font = 14.f
        tv.textColor = "#666666".c
        
        return tv
    }()
    
    lazy var gotoCourseDetailBtn: JYXBGradientButton = {
        let btn = JYXBGradientButton(type: .custom)
        btn.addTarget(self, action: #selector(gotoCourseDetail), for: .touchUpInside)
        btn.setTitle("查看课程", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = 16.f
        
        btn.layer.cornerRadius = 20
        
        btn.gradientLayer.colors = [UIColor.init(hex: "#16D9D3").cgColor,UIColor.init(hex: "#35CBDB").cgColor]
        btn.gradientLayer.locations = [0,1]
        btn.gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        btn.gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        btn.layer.shadowColor = UIColor.init(hex: "#35CBDB").cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 3)
        btn.layer.shadowRadius = 4
        btn.layer.shadowOpacity = 0.56
        
        return btn
    }()
    
    
    @objc func gotoCourseDetail() {
        
    }
    
    lazy var shareBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(share), for: .touchUpInside)
        btn.setTitle("微信转发", for: .normal)
        btn.setTitleColor("#35CBDB".c, for: .normal)
        btn.titleLabel?.font = 16.f
        btn.layer.cornerRadius = 20
        btn.layer.backgroundColor = UIColor.white.cgColor
        btn.layer.borderColor = "#35CBDB".c.cgColor
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
    @objc func share() {
        
    }
    
    lazy var createPublicCourseBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(share), for: .touchUpInside)
        btn.setTitle("创建免费公开课", for: .normal)
        btn.setTitleColor("#35CBDB".c, for: .normal)
        btn.titleLabel?.font = 16.f
        btn.layer.cornerRadius = 20
        btn.layer.backgroundColor = UIColor.white.cgColor
        btn.layer.borderColor = "#35CBDB".c.cgColor
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
    @objc func createPublicCourse() {
        
    }
    
    lazy var sweetTip: UIView = {
       let bg = UIView()
        bg.backgroundColor = "#F7F7F7".c
        
        let container = UIStackView()
        container.distribution = .fill
        container.axis = .horizontal
        container.spacing = 5

        let icon = UIImageView()
        icon.backgroundColor = .red
        
        let title = UILabel()
        title.text = "温馨提示"
        title.font = 16.bf
        title.textColor = "#222222".c
        
        container.addArrangedSubview(icon)
        container.addArrangedSubview(title)
        
        icon.backgroundColor = .red
        icon.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 16, height: 16))
        }
        
        let content = UILabel()
        content.attributedText = "家有学霸平台所有直播课最低开课人数为10人，开课前三天，报名人数如果低于10人，课程将会自动取消，所有学费将会100%自动返还给学生，请老师务必保证课程的报名人数超过10人。".hw_toAttribute().hw_addLineSpace(5)
               content.font = 13.bf
               content.textColor = "#898989".c
        content.numberOfLines = 0
        
        bg.addSubview(container)
        bg.addSubview(content)
        
        let edge = UIEdgeInsets(top: 15, left: 27, bottom: 22, right: 27)
        
        container.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(edge)
        }
        content.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(edge)
            $0.top.equalTo(container.snp.bottom).offset(6.5)
        }
        return bg
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        isStatusBarWhite = false
        navigationBar?.backgroundColor = .white
        navigationBar?.navigationItem?.title = ""
        navigationBar?.navigationItem?.backBarButtonItem = XBNavigationBarBtnItem.buildBackBarBtn(.arrowAndText("返回首页", tintWhite: false), target: self)
        
        if let bar = navigationBar
        {
            self.view.bringSubviewToFront(bar)
        }
        
        view.backgroundColor = .white
        view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(navigationBar!.snp.bottom)
            make.height.equalTo(0.5)
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(view.snp.width)
        }
        
        contentView.addSubview(icon)
        contentView.addSubview(titleLable)
        contentView.addSubview(contentLable)
        contentView.addSubview(gotoCourseDetailBtn)
        contentView.addSubview(shareBtn)
        contentView.addSubview(createPublicCourseBtn)
        contentView.addSubview(sweetTip)
        
        let edge = UIEdgeInsets(top: 0, left: 32.5, bottom: 0, right: 32.5)
        
        icon.backgroundColor = .red
        icon.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 112, height: 104))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(30.5)
        }
        titleLable.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(icon.snp.bottom).offset(13.5)
        }
        contentLable.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(edge)
            $0.top.equalTo(titleLable.snp.bottom).offset(9)
        }
        gotoCourseDetailBtn.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 244, height: 40))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(contentLable.snp.bottom).offset(20)
        }
        shareBtn.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 244, height: 40))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(gotoCourseDetailBtn.snp.bottom).offset(18)
        }
        createPublicCourseBtn.snp.makeConstraints {
            $0.size.equalTo(shareBtn.snp.size)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(shareBtn.snp.bottom).offset(15)
//            $0.bottom.equalToSuperview()
        }
        sweetTip.snp.makeConstraints {
            $0.top.equalTo(createPublicCourseBtn.snp.bottom).offset(27)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            
            $0.bottom.equalToSuperview()
        }
        
        
    }
}
