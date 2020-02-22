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
    
    lazy var tip: UIView = {
        let bg = UIView()
        bg.backgroundColor = "#F7F7F7".c
        let icon = UIImageView.init(image: UIImage(named: "create_live_class_suc_icon"))
        
       let title = UILabel()
        title.text = "温馨提示"
        title.textColor = "#222222".c
        title.font = 14.f
        
        let content = UILabel()
        content.text = "家有学霸平台所有直播课程最低开课人数一律为10人，开课前三天，报名人数如果低于10人，课程将会自动取消，所有学费将会100%自动返还给学生，请老师务必在报名截止时间以前保证课程的报名人数超过10人。"
        content.textColor = "#898989".c
        content.font = 13.f
        content.numberOfLines = 0
        content.lineSpacing(5.5)
        
        let edge = UIEdgeInsets(top: 21, left: 27, bottom: 27, right: 28)
        
        bg.addSubview(icon)
        bg.addSubview(title)
        bg.addSubview(content)
        icon.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.left.top.equalToSuperview().inset(edge)
        }
        
        title.snp.makeConstraints {
            $0.left.equalTo(icon.snp.right).offset(3)
            $0.right.top.equalToSuperview().inset(edge)
        }
        
        content.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(edge)
            make.top.equalTo(title.snp.bottom).offset(10)
        }
        
        return bg
    
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
        //            make.top.equalTo(self.navigationBar!.snp.bottom)
                    make.height.equalTo(0.5)
                }
        
        view.addSubview(tip)
        tip.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(145)
        }
    }
}

