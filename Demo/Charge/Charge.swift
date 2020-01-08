//
//  Charge.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/6.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit

class Charge: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        self.title = "充值"
        let table = UITableView(frame: view.bounds)
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.register(ChargeCell.classForCoder(), forCellReuseIdentifier: priceCell)
        table.register(ChargeTypeCell.classForCoder(), forCellReuseIdentifier: chargeTypeCell)
        table.register(HeaderCell.classForCoder(), forCellReuseIdentifier: headerCell)
        table.register(BottomCell.classForCoder(), forCellReuseIdentifier: bottomCell)
        table.separatorStyle = .none
        table.backgroundColor = UIColor(hexCode: "#F7F7F7")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    let priceCell = "priceCell"
    let chargeTypeCell = "chargeTypeCell"
    let headerCell = "headerCell"
    let bottomCell = "bottomCell"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: headerCell)!
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: priceCell)!
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: chargeTypeCell)!
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: bottomCell)!
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: bottomCell)!
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}
