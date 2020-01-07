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
        return 6
    }
    
    let PRICE_CELL_ID = "priceCell"
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: PRICE_CELL_ID, for: indexPath)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        let layout = UICollectionViewFlowLayout()
        let layout = ColumnFlowLayout(count: 3, heightScale: 0.66, minimumInteritemSpacing: 38, minimumLineSpacing: 20, sectionInset: UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15))
        layout.scrollDirection = .vertical
        
        let table = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        let table = UICollectionView(frame: self.contentView.bounds, collectionViewLayout: layout)
        
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = false
        table.register(PriceCell.self, forCellWithReuseIdentifier: PRICE_CELL_ID)
        table.backgroundColor = UIColor.white
        
        let tv = PaddingLabel()
        tv.paddingTop = 15
        tv.paddingLeft = 15
        tv.paddingBottom = 4
        self.contentView.addSubview(tv)
        tv.text = "请选择充值金额"
        tv.textColor = UIColor(hexCode: "#222222")
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.backgroundColor = UIColor(hexCode: "#f7f7f7")
        tv.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
        }
        
        self.contentView.addSubview(table)
        table.snp.makeConstraints { (make) in
            make.top.equalTo(tv.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(0)
            make.height.equalTo(68 * 2 + 40 + 10)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
