//
//  ChargeCell.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/7.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit

class ChargeCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    let PRICE_CELL_ID = "priceCell"
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: PRICE_CELL_ID, for: indexPath)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 100, height: 100)
        
        let table = UICollectionView(frame: self.contentView.bounds, collectionViewLayout: layout)
        
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = true
        table.register(PriceCell.self, forCellWithReuseIdentifier: PRICE_CELL_ID)
        table.backgroundColor = UIColor.blue
        
        let tv = UILabel()
        self.contentView.addSubview(tv)
        tv.text = "hahaha"
        tv.backgroundColor = UIColor.green
        tv.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(30)
        }
        
        self.contentView.addSubview(table)
        table.snp.makeConstraints { (make) in
            make.top.equalTo(tv.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
            make.bottom.equalTo(0)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
