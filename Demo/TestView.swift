//
//  TestView.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/28.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

enum HQLiveCourseInfoType {
    case name
    case provice
    case forCity
    case subject
    case count
    case minStu
}

class TestVie: UIView {
    
    let infomationTitleLabel: UILabel = {
        let view = UILabel()
        view.font = .bf18
        view.textColor = .c222222
        view.text = "直播课基本信息"
        return view
    }()
    
    let infomationLeftImage: UIImageView = {
        //        UIImageView(image: UIImage(imageNameForTeaiPhoneBundle: "infomationTitle_left"))
        let v = UIImageView()
        v.backgroundColor = .red
        return v
    }()
    
    let infomationRightImage: UIImageView = {
        //        UIImageView(image: UIImage(imageNameForTeaiPhoneBundle: "infomationTitle_right"))
        let v = UIImageView()
        v.backgroundColor = .red
        return v
    }()
    
    
    let items = [(HQLiveCourseInfoType.name,"授课老师姓名："),
                 (HQLiveCourseInfoType.provice,"老师所在省份："),
                 (HQLiveCourseInfoType.forCity,"课程主要针对城市："),
                 (HQLiveCourseInfoType.subject,"教学科目："),
                 (HQLiveCourseInfoType.count,"课程总次数："),
                 (HQLiveCourseInfoType.minStu,"最低开课人数：")]
    
    var views = [HQLiveCourseInfoType:UILabel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(infomationTitleLabel)
        addSubview(infomationLeftImage)
        addSubview(infomationRightImage)
        
        infomationTitleLabel.snp_makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
        }
        
        infomationLeftImage.snp_makeConstraints { (make) in
            make.centerY.equalTo(infomationTitleLabel)
            make.right.equalTo(infomationTitleLabel.snp.left).offset(-10)
        }
        
        infomationRightImage.snp_makeConstraints { (make) in
            make.centerY.equalTo(infomationTitleLabel)
            make.left.equalTo(infomationTitleLabel.snp.right).offset(10)
        }
        
        var last: UIView?
        
        for (index, value) in items.enumerated() {
            let tv = UILabel()
            tv.textColor = "#898989".c
            tv.font = 14.f
            tv.text = value.1
            
            addSubview(tv)
            
            if let last = last {
                tv.snp_makeConstraints {
                    $0.top.equalTo(last.snp.bottom).offset(10)
                    $0.left.equalToSuperview().offset(25)
                }
            } else {
                tv.snp_makeConstraints {
                    $0.top.equalTo(infomationTitleLabel.snp.bottom).offset(25)
                    $0.left.equalToSuperview().offset(25)
                }
            }
            
            let showTv = UILabel()
            showTv.textColor = "#222222".c
            showTv.font = 14.bf
            
            addSubview(showTv)
            showTv.snp_makeConstraints {
                $0.centerY.equalTo(tv.snp.centerY)
                $0.left.equalTo(tv.snp.right).offset(5)
            }
            
            views[value.0] = showTv
            
            last = tv
        }
        
        last?.snp_makeConstraints {
            $0.bottom.equalToSuperview().offset(-15)
        }
    }
    
    func config(name: String, provice: String, forCity: String, subject: String, count: Int, minStu: Int) {
        views[HQLiveCourseInfoType.name]?.text = name
        views[HQLiveCourseInfoType.provice]?.text = provice
        views[HQLiveCourseInfoType.forCity]?.text = forCity
        views[HQLiveCourseInfoType.subject]?.text = subject
        views[HQLiveCourseInfoType.count]?.text = "\(count)节课"
        views[HQLiveCourseInfoType.minStu]?.text = "\(minStu)人"
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
