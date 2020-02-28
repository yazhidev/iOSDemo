//
//  CreatedLiveClassSectionController.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import Foundation
import IGListKit

class WithHeaderFooterSectionController: ListSectionController, ListAdapterDataSource, ListSupplementaryViewSource {

    override init() {
        super.init()
        supplementaryViewSource = self
    }

    func supportedElementKinds() -> [String] {
        return [
            UICollectionView.elementKindSectionHeader,
                UICollectionView.elementKindSectionFooter]
    }

    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        switch elementKind {
        case UICollectionView.elementKindSectionHeader:
            return userHeaderView(atIndex: index)
        case UICollectionView.elementKindSectionFooter:
            return userFooterView(atIndex: index)
        default:
            fatalError()
        }
    }

    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 100)
    }

    private func userHeaderView(atIndex index: Int) -> UICollectionReusableView {
        guard let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                for: self,
                class: CreatedHeaderCell.self,
                at: index) as? CreatedHeaderCell else {
            print("zyz:userFooterView nil")
            fatalError()
        }
        print("zyz:userFooterView \(view)")
        return view
//        view.commentsCount = "\(feedItem.comments.count)"
//        return view
    }

    private func userFooterView(atIndex index: Int) -> UICollectionReusableView {
        guard let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                for: self,
                class: FooterCell.self,
                at: index) as? FooterCell else {
            print("zyz:userFooterView nil")
            fatalError()
        }
        print("zyz:userFooterView \(view)")
        return view
    }

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

