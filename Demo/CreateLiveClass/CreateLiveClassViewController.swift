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
        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.831_372_549, green: 0.945_098_039, blue: 0.964_705_882, alpha: 1)
        return collectionView
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "#E1E1E1")
        return line
    }()
    
    
    lazy var items: [ListDiffable] = {
        let yearModel = CreatedLiveClassModel(year: 2020, data: [MonthModel(month: "2月"), MonthModel(month: "3月")])
        return [DocumentModel(type: .explain), yearModel]
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
            return DocumentSectionController()
            //            return SelfSizingCellsViewController()
        } else if object is CreatedLiveClassModel {
            return CreatedLiveClassSectionController()
        }
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}


final class SelfSizingCellsViewController: UIViewController, ListAdapterDataSource {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.831_372_549, green: 0.945_098_039, blue: 0.964_705_882, alpha: 1)
        return collectionView
    }()
    
    let data = [
        SelectionModel(options: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum.",
                                 "Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere consectetur est at lobortis. Cras justo odio, dapibus ac facilisis in, egestas eget quam.",
                                 "Sed posuere consectetur est at lobortis. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum."], type: .fullWidth)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return SelfSizingSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
    
}


enum SelectionModelType: Int {
    case none, fullWidth, nib
}

final class SelectionModel: NSObject {
    
    let options: [String]
    let type: SelectionModelType
    
    init(options: [String], type: SelectionModelType = .none) {
        self.options = options
        self.type = type
    }
    
}

extension SelectionModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}


final class SelfSizingSectionController: ListSectionController {
    
    private var model: SelectionModel!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        minimumLineSpacing = 4
        minimumInteritemSpacing = 4
    }
    
    override func numberOfItems() -> Int {
        return model.options.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 10)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let text = model.options[index]
        let manualCell = collectionContext!.dequeueReusableCell(
            of: FullWidthSelfSizingCell.self,
            for: self,
            at: index
            ) as! FullWidthSelfSizingCell
        return manualCell
    }
    
    override func didUpdate(to object: Any) {
        self.model = object as? SelectionModel
    }
    
}


final class ManuallySelfSizingCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green.withAlphaComponent(0.1)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(label)
        
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 15).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 15).isActive = true
        NSLayoutConstraint(item: contentView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: label,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 15).isActive = true
        NSLayoutConstraint(item: contentView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: label,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 15).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.width = ceil(size.width)
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
    
}


final class FullWidthSelfSizingCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(label)
        label.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        //
        //        NSLayoutConstraint(item: label,
        //                           attribute: .top,
        //                           relatedBy: .equal,
        //                           toItem: contentView,
        //                           attribute: .top,
        //                           multiplier: 1,
        //                           constant: 15).isActive = true
        //        NSLayoutConstraint(item: label,
        //                           attribute: .leading,
        //                           relatedBy: .equal,
        //                           toItem: contentView,
        //                           attribute: .leading,
        //                           multiplier: 1,
        //                           constant: 15).isActive = true
        //        NSLayoutConstraint(item: contentView,
        //                           attribute: .bottom,
        //                           relatedBy: .equal,
        //                           toItem: label,
        //                           attribute: .bottom,
        //                           multiplier: 1,
        //                           constant: 15).isActive = true
        //        NSLayoutConstraint(item: contentView,
        //                           attribute: .trailing,
        //                           relatedBy: .equal,
        //                           toItem: label,
        //                           attribute: .trailing,
        //                           multiplier: 1,
        //                           constant: 15).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        print("preferredLayoutAttributesFitting\(label.text)")
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
    
}

extension FullWidthSelfSizingCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        print("")
    }
    
    
}
