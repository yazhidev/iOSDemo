//
//  CreatedLiveClassSectionController.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import Foundation
import IGListKit

class CreatedLiveClassSectionController: ListSectionController, ListAdapterDataSource {
    
    private var data: CreatedLiveClassModel?
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        print("---size: \(data?.data)")
        return data?.data ?? []
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CreatedMonthSetionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 80)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(
            of: EmbeddedCollectionViewCell.self,
            for: self,
            at: index
            ) as! EmbeddedCollectionViewCell
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override func didUpdate(to object: Any) {
        print("-----\(object)")
        data = object as? CreatedLiveClassModel
    }
}

