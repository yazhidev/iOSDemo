//
//  OnSaleCell.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/24.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit

class FooterCell: UICollectionReusableView{
    
    func bindViewModel(_ viewModel: Any) {}
    
    lazy private var title: UIView = {
        let bg = UIView()
        let view = UILabel()
        view.textColor = "#222222".c
        view.font = 18.bf
        view.text = "footer"
        bg.addSubview(view)
        view.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 25, left: 21, bottom: 14, right: 0))
        }
        return bg
    }()
    
    let edge = UIEdgeInsets(top: 0, left: 21, bottom: 15, right: 21)
    
    lazy var tipView: UIView = {
        let view = UIView()
        view.backgroundColor = "#F7F7F7".c
        let title = TipTitleView()
        let content1 = TipContentView(frame: CGRect.zero, title: "      为了保证课程的宣传效果，也为了提高老师在平台的竞争力，平台要求，所有开设精品直播课的老师，尽量保证在平台同时拥有至少3套以上在售精品直播课程。", textColor: "#666666".c, font: 14.f)
        let content2 = TipContentView(frame: CGRect.zero, title: "      最低开课人数：10人，家有学霸平台所有直播课程最低开课人数一律为10人，开课前三天，报名人数如果低于10人，课程将会自动取消，所有学费将会100%自动返还给学生，请老师务必在报名截止时间以前保证课程的报名人数超过10人", textColor: "#666666".c, font: 14.f)
        view.addSubview(title)
        view.addSubview(content1)
        view.addSubview(content2)
        title.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(edge)
            $0.top.equalToSuperview().offset(21)
        }
        content1.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(edge)
            $0.top.equalTo(title.snp.bottom).offset(8)
        }
        content2.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(edge)
            $0.top.equalTo(content1.snp.bottom).offset(8)
        }
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        addSubview(title)
        title.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
