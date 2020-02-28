//
//  SettingsViewController.swift
//  JYXBMineModule-swift
//
//  Created by yazhi on 2020/2/9.
//

import UIKit
import IGListKit
import JYXBUIComponent_swift
import XBBaseUIKit

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
        
        MainItemConfigModel(title: "测试", click: {() -> () in
            self.navigationController?.pushViewController(TestViewController(), animated: true)
        }),
        MainItemConfigModel(title: "郑重提示弹窗", click: {() -> () in
            let vc = XBCommonDialog(title: "标题", content: "家有学霸作为国内最大的名师创业平台，我们的核心逻辑是帮助老师在平台创业成功，因为，所有在平台开设直播课的老师，在课程创建完成后，必须配合平台工作人员，依靠自身的资源，至少组建一个50人以上的微信家长群作为后期课程宣传的大本营，家长群人数越多越好，没有自己的宣传阵地，将大大降低老师创业的成功率～", leftBtn: BtnConfig(text: "确认", click: {() in
                print("确认")
            }))
            let popup = PopupDialog(viewController: vc,
                                    buttonAlignment: .horizontal,
                                    transitionStyle: .fadeIn,
                                    tapGestureDismissal: true,
                                    panGestureDismissal: false)
            popup.view.backgroundColor = .clear
            self.present(popup, animated: true, completion: nil)
        }),
        MainItemConfigModel(title: "无标题单按钮弹窗", click: {() -> () in
            let vc = XBCommonDialog(content: "本月剩余时间已不满足课程宣传期，请选择靠后的月份创建课程", leftBtn: BtnConfig(text: "确认"))
            let popup = PopupDialog(viewController: vc,
                                    buttonAlignment: .horizontal,
                                    transitionStyle: .fadeIn,
                                    tapGestureDismissal: true,
                                    panGestureDismissal: false)
            popup.view.backgroundColor = .clear
            self.present(popup, animated: true, completion: nil)
        }),
        MainItemConfigModel(title: "无标题双按钮弹窗", click: {() -> () in
            let vc = XBCommonDialog(content: "本月剩余时间已不满足课程宣传期，请选择靠后的月份创建课程", leftBtn: BtnConfig(text: "取消", click: {() in
                print("取消")
            }), rightBtn: BtnConfig(text: "确认", click: {() in
                print("确认")
            }))
            let popup = PopupDialog(viewController: vc,
                                    buttonAlignment: .horizontal,
                                    transitionStyle: .fadeIn,
                                    tapGestureDismissal: true,
                                    panGestureDismissal: false)
            popup.view.backgroundColor = .clear
            self.present(popup, animated: true, completion: nil)
        }),
        MainItemConfigModel(title: "精品课信息填写", click: {() -> () in
            self.navigationController?.pushViewController(CreateLiveClassInfoCompletionViewController(), animated: true)
        }),
        MainItemConfigModel(title: "创建成功", click: {() -> () in
            self.navigationController?.pushViewController(CreateHQLiveCourseSucViewController(), animated: true)
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
