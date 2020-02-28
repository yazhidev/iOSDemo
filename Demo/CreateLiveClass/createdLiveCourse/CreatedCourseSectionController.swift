//
//  CreatedLiveClassSectionController.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import Foundation
import IGListKit

class CreatedCourseSectionController: ListSectionController, ListAdapterDataSource {

    private var data: CreatedLiveClassModel?

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var items = [ListDiffable]()
        items.append(data!.year)
        data!.data.map {
            items.append($0)
        }
        return items
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if(object is MonthModel) {
            return MonthSetionController()
        } else {
            return YearSectionController()
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

    var collection: UICollectionView?

    override func sizeForItem(at index: Int) -> CGSize {
        let height = 30 + data!.data.count * 60 + 40 //year + month + padding
        return CGSize(width: collectionContext!.containerSize.width, height: CGFloat(height))
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
    }

}

