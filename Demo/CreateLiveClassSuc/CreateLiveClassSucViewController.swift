//
//  CreateLiveClassSucViewController.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import XBBaseUIKit

class CreateLiveClassSucViewController: XBViewController {
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "#E1E1E1")
        return line
    }()
    
    let edge = UIEdgeInsets(top: 0, left: 27, bottom: 28, right: 27)
    
    lazy var tipView: UIView = {
        let view = UIView()
        view.backgroundColor = "#F7F7F7".c
        let title = TipTitleView()
        let content = TipContentView(frame: CGRect.zero, title: "家有学霸平台所有直播课程最低开课人数一律为10人，开课前三天，报名人数如果低于10人，课程将会自动取消，所有学费将会100%自动返还给学生，请老师务必在报名截止时间以前保证课程的报名人数超过10人。")
        view.addSubview(title)
        view.addSubview(content)
        title.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(edge)
            $0.top.equalToSuperview().offset(21)
        }
        content.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(edge)
            $0.top.equalTo(title.snp.bottom).offset(8)
        }
        return view
    }()
    
    override func viewDidLoad() {
        self.isStatusBarWhite = false
        self.navigationBar?.backgroundColor = .white
        self.navigationBar?.navigationItem?.backBarButtonItem = XBNavigationBarBtnItem.buildBackBarBtn(.arrowAndText("返回首页", tintWhite: false), target: self)
        
        if let bar = self.navigationBar
        {
            self.view.bringSubviewToFront(bar)
        }
        
        view.backgroundColor = .white
        view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        view.addSubview(tipView)
        tipView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
        }
    }
}

