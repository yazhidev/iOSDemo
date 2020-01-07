//
//  PriceGrid.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/6.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit

class PriceGrid: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    let HHH = "cellId"
    let SCREEN_WIDTH = UIScreen.main.bounds.width
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: HHH, for: indexPath)
    }
    
    var collectionViewHeightConstraint: Constraint?
    
    override func viewDidLoad() {
        self.edgesForExtendedLayout = []
        
//        let layout = ColumnFlowLayout(count: 3, heightScale: 0.66, minimumInteritemSpacing: 37.5, minimumLineSpacing: 20, sectionInset: UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15))
        
        
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 10, height: 10)
        
        let table = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = true
        table.register(PriceCell.self, forCellWithReuseIdentifier: HHH)
        table.backgroundColor = UIColor.blue
        
        self.view.addSubview(table)
        
        table.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
//            make.height.equalTo(50)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute:  {
            print("------ later \(table.contentSize.height)")
            table.snp.updateConstraints { (make) in
                make.height.equalTo(table.contentSize.height)
            }
        })
    }
    
    
    
}
