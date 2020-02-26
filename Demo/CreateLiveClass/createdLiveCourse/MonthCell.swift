//
//  CreatedLiveCourseCell.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit
import XBBaseUIKit

class MonthCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.textColor = "#AAAAAA".c
        view.font = 14.f
        return view
    }()

    lazy var label2: UILabel = {
        let view = UILabel()
        view.textColor = "#222222".c
        view.text = "已创建"
        view.font = 16.f
        return view
    }()

    lazy var numLable: UILabel = {
        let view = UILabel()
        view.textColor = "##FF5E00".c
        view.text = "4"
        view.font = 16.f
        return view
    }()

    lazy var label3: UILabel = {
        let view = UILabel()
        view.textColor = "#222222".c
        view.text = "套课程"
        view.font = 16.f
        return view
    }()

    lazy var createBtn: JYXBGradientButton = {
        let btn = JYXBGradientButton(type: .custom)
        btn.addTarget(self, action: #selector(create), for: .touchUpInside)
        btn.setTitle("创建本月课程", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = 13.f
        btn.layer.cornerRadius = 14
        btn.layer.backgroundColor = UIColor(hex: "#35CBDB").cgColor
        btn.layer.shadowColor = UIColor.init(hex: "#35CBDB").cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 3)
        btn.layer.shadowRadius = 4
        btn.layer.shadowOpacity = 0.56
        return btn
    }()

    @objc func create() {
        print("zyz:create")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.backgroundColor = .yellow
        contentView.addSubview(label)
        contentView.addSubview(label2)
        contentView.addSubview(numLable)
        contentView.addSubview(label3)
        contentView.addSubview(createBtn)


        label.snp.makeConstraints {
            $0.left.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
        }
        label2.snp.makeConstraints {
            $0.left.equalToSuperview().offset(61)
            $0.centerY.equalToSuperview()
        }
        numLable.snp.makeConstraints {
            $0.left.equalTo(label2.snp.right).offset(5)
            $0.centerY.equalToSuperview()
        }
        label3.snp.makeConstraints {
            $0.left.equalTo(numLable.snp.right).offset(5)
            $0.centerY.equalToSuperview()
        }
        createBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-12.5)
            $0.size.equalTo(CGSize(width: 100, height: 28))
        }

    }
//
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//           setNeedsLayout()
//           layoutIfNeeded()
//           let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//        print("zyz:height1 \(size.height)")
//           var newFrame = layoutAttributes.frame
//           // note: don't change the width
//           newFrame.size.height = ceil(size.height)
//           layoutAttributes.frame = newFrame
//           return layoutAttributes
//       }
}
