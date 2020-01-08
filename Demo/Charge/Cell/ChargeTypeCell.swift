//
//  ChargeTypeCell.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/7.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class ChargeTypeCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let tv = PaddingLabel()
        tv.paddingTop = 15
        tv.paddingLeft = 15
        tv.paddingBottom = 8
        self.contentView.addSubview(tv)
        tv.text = "支付方式"
        tv.textColor = UIColor(hexCode: "#222222")
        tv.font = UIFont.boldSystemFont(ofSize: 16)
        tv.backgroundColor = UIColor(hexCode: "#f7f7f7")
        tv.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
        }
        
        let table = UITableView(frame: .zero)
        self.contentView.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.register(PayTypeCell.classForCoder(), forCellReuseIdentifier: payTypeCell)
        table.separatorInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
//        table.separatorStyle = .none
        table.isScrollEnabled = false
        table.backgroundColor = UIColor.blue
        table.snp.makeConstraints { (make) in
            make.top.equalTo(tv.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(0)
            make.height.equalTo(120)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    let payTypeCell = "PayTypeCell"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: payTypeCell)
        cell?.selectionStyle = .none
        return cell!
    }
    
    
}
