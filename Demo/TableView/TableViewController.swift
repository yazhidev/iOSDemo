//
//  AccountAdapter.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/3.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        let table = UITableView(frame: view.bounds)
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.register(AccountCell.classForCoder(), forCellReuseIdentifier: identifier)
        table.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    let identifier = "TableCell"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        return cell!
    }
    
    
}
