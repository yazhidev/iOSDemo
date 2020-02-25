//
//  SettingsViewController.swift
//  JYXBMineModule-swift
//
//  Created by yazhi on 2020/2/9.
//

import UIKit
import IGListKit
import JYXBUIComponent_swift

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
        MainItemConfigModel(title: "精品课信息填写", click: {() -> () in
            self.navigationController?.pushViewController(CreateLiveClassInfoCompletionViewController(), animated: true)
        }),
        MainItemConfigModel(title: "创建成功", click: {() -> () in
            self.navigationController?.pushViewController(CreateLiveClassSucViewController(), animated: true)
        }),
        MainItemConfigModel(title: "创建精品课", click: {() -> () in
            self.navigationController?.pushViewController(CreateLiveClassViewController(), animated: true)
//            self.navigationController?.pushViewController(SelfSizingCellsViewController(), animated: true)
        }),
        MainItemConfigModel(title: "选择课程性质", click: {() -> () in
            let courseCounts = [Int](1...10)
            var courseCountItems: [JYXBPickerItem] = []
            for i in courseCounts {
                courseCountItems.append(JYXBPickerItem.init(description: "\(i)"))
            }
            let popView = JYXBPickerPopView.init(items: courseCountItems, originIndex: 1, title: "课时总数")
            popView.selecteHandle = { [weak self] index in
                print("select \(index)")
            }
            JYXBPopViewManager.default.pop(view: popView)
        }),
    ]
    
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
