//
//  CreatedLiveClassSectionController.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import Foundation
import IGListKit

class YearSectionController: ListSectionController, ListAdapterDataSource, ListDisplayDelegate {
    
    private var data: CreatedLiveClassModel?
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data?.data ?? []
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return MonthSetionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    var collection: UICollectionView?
    
    override func sizeForItem(at index: Int) -> CGSize {
        print("zyz:sizeForItem")
        return CGSize(width: collectionContext!.containerSize.width, height: 320)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(
            of: EmbeddedCollectionViewCell.self,
            for: self,
            at: index
            ) as! EmbeddedCollectionViewCell
        adapter.collectionView = cell.collectionView
        collection = cell.collectionView
//        let height = cell.collectionView.contentSize.height
        print("zyz:赋值")
        return cell
    }
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override func didUpdate(to object: Any) {
        data = object as? CreatedLiveClassModel
        let height = collection?.contentSize.height
        print("zyz:realH: \(height ?? 999)")
    }
    
    override init() {
           super.init()
           displayDelegate = self
           inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right:10)
       }
    
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController) {
        print("zyz:Will display section \(self.section)")
    }

    func listAdapter(_ listAdapter: ListAdapter,
                     willDisplay sectionController: ListSectionController,
                     cell: UICollectionViewCell,
                     at index: Int) {
                       print("zyz:Did will display cell \(index) in section \(self.section)")
    }

    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController) {
        print("zyz:Did end displaying section \(self.section)")
    }

    func listAdapter(_ listAdapter: ListAdapter,
                     didEndDisplaying sectionController: ListSectionController,
                     cell: UICollectionViewCell,
                     at index: Int) {
                       print("zyz:Did end displaying cell \(index) in section \(self.section)")
    }
    
}

