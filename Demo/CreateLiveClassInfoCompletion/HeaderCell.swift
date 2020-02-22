//
//  HeadCell.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

class HeaderCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class HeaderTitleCell: UICollectionViewCell {
    
    lazy var title: UIView = {
        let bg = UIView()
        bg.backgroundColor = .red
        
        let iconL = UILabel()
        iconL.text = "---"
        
        let iconR = UILabel()
        iconR.text = "---"
        
        let tv = UILabel()
        tv.text = "直播课基本信息"
        tv.textColor = "#222222".c
        tv.font = 18.f
        
        let stack = UIStackView()
        stack.spacing = 10
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.addArrangedSubview(iconL)
        stack.addArrangedSubview(tv)
        stack.addArrangedSubview(iconR)
        
        bg.addSubview(stack)
        stack.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        iconL.snp.makeConstraints{
            $0.centerY.equalToSuperview()
        }
        tv.snp.makeConstraints{
            $0.centerY.equalToSuperview()
        }
        iconR.snp.makeConstraints{
            $0.centerY.equalToSuperview()
        }
        
        return bg
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(title)
        title.backgroundColor = .white
        title.snp.makeConstraints{
            $0.edges.equalToSuperview()
            //            $0.left.right.equalToSuperview()
            //            $0.top.equalToSuperview().offset(100)
            //            $0.centerY.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension HeaderTitleCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        print("")
    }
}


class HeaderInfoCell: UICollectionViewCell {
    
    lazy var titleLable: UILabel = {
        let tv = UILabel()
        tv.text = "直播课基本信息"
        tv.textColor = "#898989".c
        tv.font = 14.f
        return tv
    }()
    
    lazy var valueLable: UILabel = {
        let tv = UILabel()
        tv.text = "直播课"
        tv.textColor = "#222222".c
        tv.font = 14.f
        return tv
    }()
    
    lazy var stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(titleLable)
        contentView.addSubview(valueLable)
        
        
        let edge = UIEdgeInsets(top: 5, left: 25, bottom: 5, right: 25)
        titleLable.snp.makeConstraints{
            $0.left.top.equalToSuperview().inset(edge)
        }
        valueLable.snp.makeConstraints {
            $0.right.top.equalToSuperview().inset(edge)
            $0.left.equalTo(titleLable.snp.right).offset(10)
        }
        //        valueLable.snp.
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension HeaderInfoCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        print("")
    }
}
