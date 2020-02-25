//
//  DocumentCell.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import IGListKit

typealias DocumentClick = () -> Void

protocol DocumentCell: ListBindable {
    var callback: DocumentClick?  {get set}
}

class ShowDocumentCell: UICollectionViewCell, DocumentCell, ListBindable {
    
    var callback: DocumentClick?
    
    func bindViewModel(_ viewModel: Any) {}
    
    lazy private var label: UIButton = {
        let view = UIButton()
        view.setTitle("查看开课说明", for: .normal)
        view.setTitleColor("#FF5E00".c, for: .normal)
        view.titleLabel?.font = 14.bf
        view.addTarget(self, action: #selector(click), for: .touchUpInside)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor  = "#FFF0E7".c
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 35)
    }
    
    @objc func click() {
        callback?()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}


class DocumentDetailCell: UICollectionViewCell, DocumentCell, ListBindable {
    
    var callback: DocumentClick?
    
    func bindViewModel(_ viewModel: Any) {}
    
    lazy private var title: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.textColor = "#222222".c
        view.font = 16.f
        view.text = "开课说明"
        return view
    }()
    
    lazy private var label1: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.textColor = .black
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 15)
        view.text = "家有学霸的免费公开课，是老师在平台开设的免费的一次性大班直播课程，课程的主要目的是帮助老师批量招生，尤其是帮助老师开设的精品直播课招生，从而让老师在平台有更多的机会来展示自己。"
        return view
    }()
    
    lazy private var label2: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.textColor = .black
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 15)
        view.text = "      通过免费公开课提高知名度，是老师在平台获得海量生源的最有效的渠道。虽然免费公开课不收费，但学生可以在上课过程中给老师发现金红包，以此来提高老师在免费公开课上的收入。"
        return view
    }()
    
    lazy private var hideBtn: UIButton = {
        let view = UIButton()
        view.setTitle("收起", for: .normal)
        view.setTitleColor("#FF8000".c, for: .normal)
        view.titleLabel?.font = 14.f
        view.addTarget(self, action: #selector(click), for: .touchUpInside)
        return view
    }()
    
    @objc func click() {
        callback?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = "#FFF0E7".c
        contentView.addSubview(title)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(hideBtn)
        let edge = UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 21)
        title.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(11)
        }
        label1.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(edge)
            $0.top.equalTo(title.snp.bottom).offset(8)
        }
        label2.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(edge)
            $0.top.equalTo(label1.snp.bottom).offset(10)
        }
        hideBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label2.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}

