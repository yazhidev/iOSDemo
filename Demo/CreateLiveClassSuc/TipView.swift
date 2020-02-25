//
//  TipView.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import XBBaseUIKit

class TipTitleView: UIView {
    
    lazy var title: UILabel = {
        let title = UILabel()
               title.text = "温馨提示"
               title.textColor = "#222222".c
               title.font = 14.f
        
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
    }
    
    override func layoutSubviews() {
        title.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


class TipContentView: UIView {
    
    lazy var content: UILabel = {
        let content = UILabel()
        content.numberOfLines = 0
        return content
        
    }()
    
    init(frame: CGRect, title: String, textColor: UIColor = "#898989".c, font: UIFont = 13.f) {
        super.init(frame: frame)
        content.attributedText = title.hw_toAttribute().hw_addLineSpace(5)
        content.textColor = textColor
        content.font = font
        addSubview(content)
    }
    
    override func layoutSubviews() {
        content.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
