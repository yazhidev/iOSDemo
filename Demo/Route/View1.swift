//
//  View1.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/6.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit

class View1: UIViewController {
    override func viewDidLoad() {
        self.title = "Demo"
        self.view.backgroundColor = UIColor.white
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.edgesForExtendedLayout = []
        
        let gotoAccount = UIButton()
        gotoAccount.setTitle("账单列表", for: .normal)
        gotoAccount.backgroundColor = AppBlue
        gotoAccount.addTarget(self, action: #selector(gotoAccountList), for: .touchUpInside)
        self.view.addSubview(gotoAccount)
        gotoAccount.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.top.equalTo(30)
        }
        
        let gotoChargeBtn = UIButton()
        gotoChargeBtn.setTitle("充值", for: .normal)
        gotoChargeBtn.backgroundColor = AppBlue
        gotoChargeBtn.addTarget(self, action: #selector(gotoCharge), for: .touchUpInside)
        gotoChargeBtn.layer.masksToBounds = true
        
        gotoChargeBtn.layer.borderColor = AppBlue.cgColor
        self.view.addSubview(gotoChargeBtn)
        gotoChargeBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.top.equalTo(gotoAccount.snp.bottom).offset(30)
        }
        
    }
    
    @objc func gotoCharge() {
        self.navigationController?.pushViewController(Charge(), animated: true)
    }
    
    @objc func gotoAccountList() {
        self.navigationController?.pushViewController(TableViewController(), animated: true)
    }
}
