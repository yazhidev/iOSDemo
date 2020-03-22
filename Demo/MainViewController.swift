//
//  SettingsViewController.swift
//  JYXBMineModule-swift
//
//  Created by yazhi on 2020/2/9.
//

import UIKit
import IGListKit

class MainViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    
    lazy var items: [MainItemConfigModel] = [
        MainItemConfigModel(title: "item1", click: {() -> () in
            self.navigationController?.pushViewController(PageVC(), animated: true)
        }),
        MainItemConfigModel(title: "item2", click: {() -> () in
            self.testView.removeFromSuperview()
        })
    ]

    lazy var testView = TestView(title: "A")
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { ( make ) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(line.snp.bottom)
        }
        adapter.collectionView = collectionView
        adapter.dataSource = self

        testView.backgroundColor = .red
        view.addSubview(testView)
        testView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 100, height: 100))
            $0.center.equalToSuperview()
        }
    }
    
  
}

extension MainViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is MainItemConfigModel {
            return MainSectionController()
        }
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension MainViewController {
    override public var shouldAutorotate: Bool {
        return false
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
