//
//  TestViewController.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/28.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {
    
    lazy var tv: UILabel = {
       let tv = UILabel()
        tv.numberOfLines = 0
        let text = "test".hw_toAttribute().hw_color("#333eee".c)
        text.append("测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试\n\n一一一".hw_toAttribute().hw_color("#333333".c))
        tv.attributedText = text
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let v = TestVie()
        view.addSubview(v)
        v.snp.makeConstraints {
//            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30))
            $0.top.left.right.equalToSuperview()
        }
        
        v.config(name: "123", provice: "123", forCity: "312", subject: "afd", count: 1, minStu: 3)
    }
}
