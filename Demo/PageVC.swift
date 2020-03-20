//
// Created by yazhi on 2020/3/17.
// Copyright (c) 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit
import Parchment

struct CourseToolTopBarItem: PagingItem, Hashable, Comparable {
    static func < (lhs: CourseToolTopBarItem, rhs: CourseToolTopBarItem) -> Bool {
        return lhs.index < rhs.index
    }

    let index: Int
    let title: String

    init(index: Int, title: String) {
        self.index = index
        self.title = title
    }

}

class PageVC: UIViewController {

    private let items = [CourseToolTopBarItem(index: 0, title: "111"), CourseToolTopBarItem(index: 1, title: "222"), CourseToolTopBarItem(index: 2, title: "333")]

    let viewControllers = [
        V1(title: "123"),
        V2(),
        V1(title: "aaa")
    ]

    lazy var testView = TestView(title: "B")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green


        let pagingViewController = PagingViewController()
        pagingViewController.register(CourseToolTopBarCell.self, for: CourseToolTopBarItem.self)
        pagingViewController.borderOptions = .hidden
        pagingViewController.indicatorOptions = .hidden
        pagingViewController.collectionView.isScrollEnabled = false
//        pagingViewController.borderColor = UIColor(white: 0, alpha: 0.1)
        pagingViewController.menuItemSize = .fixed(width: 167/3, height: 58)
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
            $0.width.equalTo(167)
            $0.height.equalTo(250)
        }

        pagingViewController.delegate = self
        pagingViewController.dataSource = self
        pagingViewController.select(pagingItem: items[0])

        testView.backgroundColor = .red
        view.addSubview(testView)
        testView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 100, height: 100))
            $0.center.equalToSuperview()
        }
    }
}

extension PageVC: PagingViewControllerDelegate {

}

extension PageVC: PagingViewControllerDataSource {
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return items[index]
    }

    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        print("pagingViewController \(index)")
        return viewControllers[index]
    }

    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return items.count
    }

}



extension PageVC {
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }

    override public var shouldAutorotate: Bool {
        return true
    }

    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override public var prefersStatusBarHidden: Bool {
        return true
    }
}
