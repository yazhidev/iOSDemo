//
//  PayTypeCell.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/8.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit

class PayTypeCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let item = PayTypeItem()
        self.contentView.addSubview(item)
        item.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(60)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
