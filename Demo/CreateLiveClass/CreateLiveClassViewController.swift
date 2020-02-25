//
//  CreateLiveClassView.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import XBBaseUIKit
import IGListKit
//import IGListSwiftKit

class CreateLiveClassViewController: XBViewController {
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "#E1E1E1")
        return line
    }()
    
    
    lazy var items: [ListDiffable] = {
        let yearModel = CreatedLiveClassModel(year: 2020, data: [MonthModel(month: "2月"), MonthModel(month: "3月")])
        return [DocumentModel(type: .explain), DocumentModel(type: .OnSaleTitle), yearModel]
//        return [DocumentModel(type: .explain)]
    }()
    
    override func viewDidLoad() {
        self.isStatusBarWhite = false
        self.navigationBar?.backgroundColor = .white
        self.navigationBar?.navigationItem?.title = "设置".hw_toAttribute().hw_font(18.bf).hw_color("#222222".c)
        self.navigationBar?.navigationItem?.backBarButtonItem = XBNavigationBarBtnItem.buildBackBarBtn(.arrowAndText("返回", tintWhite: false), target: self)
        
        if let bar = self.navigationBar
        {
            self.view.bringSubviewToFront(bar)
        }
        
        view.backgroundColor = .white
        view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            //            make.top.equalTo(self.navigationBar!.snp.bottom)
            make.height.equalTo(0.5)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { ( make ) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(line.snp.bottom)
        }
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
    }
    
}

extension CreateLiveClassViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is DocumentModel {
            let model = object as! DocumentModel
            switch model.type {
            case .ShowDetail:
                print("zyz:ShowDetail")
                let c = ShowController()
                c.click = {() in
                    print("zyz:click")
                    self.items[0] = DocumentModel(type: .explain)
                    self.adapter.performUpdates(animated: false, completion: nil)
                }
                return c
            case .explain:
                let c = OpenClassTipDetailController()
                c.click = {() in
                    print("zyz:click")
                    self.items[0] = DocumentModel(type: .ShowDetail)
                    self.adapter.performUpdates(animated: false, completion: nil)
                }
                return c
            case .OnSaleTitle:
                let c = TipController()
                return c
            default:
                return DocumentSectionController()
            }
        } else if object is CreatedLiveClassModel {
            return YearSectionController()
        }
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
