//
//  View2.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/6.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit

class View2: UIViewController {
    override func viewDidLoad() {
        self.title = "Demo"
        self.edgesForExtendedLayout = []
        
        let btn = UIButton(type: .custom)
        btn.setTitle("按钮", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc func btnClick() {
        print("click-----")
    }
}
