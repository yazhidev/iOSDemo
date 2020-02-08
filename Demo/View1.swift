//
//  View1.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/6.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

class View1: UIViewController {
    
    var data = [Model]()
    
    lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        self.title = "Demo"
        self.view.backgroundColor = UIColor.white
        //        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.edgesForExtendedLayout = []
        
        data.append(Model("修改密码"))
        data.append(Model("地址管理"))
        
        
        
        
        collectionView.backgroundColor = .white
        self.view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        
        
        let btn = UIButton()
        btn.setTitle("test", for: .normal)
        btn.backgroundColor = AppBlue
        btn.addTarget(self, action:#selector(updateData), for: .touchUpInside)
        self.view.addSubview(btn)
        
        btn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
            
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    @objc func updateData() {
        print("updateData")
        
        data.append(Model("网络设置"))
        data.append(Model("音频模式设置"))
        data.append(Model("清除缓存"))
        data.append(Model("平台使用指南"))
        data.append(Model("关于家有学霸"))
        data.append(Model("联系我们"))
        data.append(Model("退出登录"))
        
        adapter.performUpdates(animated: true)
    }
}

extension View1: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is Model {
            return SingleItemController()
        }
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
