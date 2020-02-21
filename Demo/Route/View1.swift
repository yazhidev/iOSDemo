//
//  View1.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/6.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit
import JYXBConfigCenter_swift

class View1: UIViewController {
    override func viewDidLoad() {
        self.title = "Demo"
        self.view.backgroundColor = UIColor.white
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.edgesForExtendedLayout = []
        
        let gotoAccount = UIButton()
        var title = ""
        #if DEBUG
        title = "DEBUG"
        #else
        title = "RELEASE"
        #endif
        
        gotoAccount.setTitle(title, for: .normal)
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

        ServiceConfigCenter.instance.getTeacherBannerConfig({(result) in
            print(result)
        }, {(err) in
            print(err)
        })
    }

    
    @objc func gotoCharge() {
        self.navigationController?.pushViewController(Charge(), animated: true)
    }
    
    @objc func gotoAccountList() {
        self.navigationController?.pushViewController(TableViewController(), animated: true)
    }

}

public protocol MyPro {
    var str: String { get }
}

class Pro1: MyPro {
    var str: String = "111"
}

class Pro2: MyPro {
    var str: String = "222"
}

@available(iOS 13.0.0, *)
func test(_ type: Bool) -> some MyPro {
    if(type) {
        return Pro1()
    } else {
        return Pro1()
    }
}
