//
//  HeaderCell.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/8.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class HeaderCell : UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let h = ChargeHeader()
        self.contentView.addSubview(h)
        h.layoutIfNeeded()
        h.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(0)
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
