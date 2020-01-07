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
        table.register(ChargeCell.classForCoder(), forCellReuseIdentifier: identifier)
        table.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    let identifier = "TableCell"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        return cell!
    }
    
}
