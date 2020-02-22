//
//  View1.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/6.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit
import XBBaseUIKit

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
        
        let AppBlue = "#03B1FF".c
        
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
        
        //                viewController = CreateLiveClassInfoCompletionViewController()
        //        viewController = CreateLiveClassSucViewController()
    }
    
    
    @objc func gotoCharge() {
        let vc = XBCommonDialog(title: "郑重提示", content: "家有学霸作为国内最大的名师创业平台，我们的核心逻辑是帮助老师在平台创业成功，因为，所有在平台开设直播课的老师，在课程创建完成后，必须配合平台工作人员，依靠自身的资源，至少组建一个50人以上的微信家长群作为后期课程宣传的大本营，家长群人数越多越好，没有自己的宣传阵地，将大大降低老师创业的成功率～", leftBtnText: "取消", rightBtnText: "确认")
        vc.confirmBlock = {self.gotoAccountList()}
        let popup = PopupDialog(viewController: vc,
                                buttonAlignment: .horizontal,
                                transitionStyle: .fadeIn,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        popup.view.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.present(popup, animated: true, completion: nil)
        //        self.navigationController?.pushViewController(Charge(), animated: true)
    }
    
    @objc func gotoAccountList() {
//        let vc = XBCommonDialog(title: "标题2", leftBtnText: "确认")
//        vc.confirmBlock = {self.gotoAccountList()}
//        let popup = PopupDialog(viewController: vc,
//                                buttonAlignment: .horizontal,
//                                transitionStyle: .fadeIn,
//                                tapGestureDismissal: true,
//                                panGestureDismissal: false)
//        popup.view.backgroundColor = UIColor.white.withAlphaComponent(0)
//        self.present(popup, animated: true, completion: nil)
                self.navigationController?.pushViewController(CreateLiveClassViewController(), animated: true)
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
