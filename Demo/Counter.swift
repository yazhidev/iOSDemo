//
//  Counter.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/2.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class Counter: UIViewController {
    override func viewDidLoad() {
//        addImg()
//        addUILable()
        
    }
    
    func addImg() {
        let img = UIImage(named: "img")
        let imgView = UIImageView(image: img)
        imgView.contentMode = .center
        self.view.addSubview(imgView)
    }
    
    func addUILable() {
        let tv = UILabel(frame: CGRect(x: 10.0, y: 120, width: 100, height: 200))
        tv.text = "ggg"
        tv.adjustsFontSizeToFitWidth = true
        tv.backgroundColor = UIColor.green
        tv.textColor = UIColor.red
        tv.font = UIFont.systemFont(ofSize: 18)
        self.view.addSubview(tv)
    }
    
    func addUITableView() {
        
    }
}

