//
//  DocumentSectionController.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit

class DocumentSectionController: ListBindingSectionController<ListDiffable>, ListBindingSectionControllerDataSource {
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        var viewModels = [ListDiffable]()
        if(expanded) {
            viewModels.append(DocumentModel(type: .explain))
        } else {
            viewModels.append(DocumentModel(type: .ShowDetail))
        }
        viewModels.append(DocumentModel(type: .OnSaleTitle))
//        viewModels.append(DocumentModel(type: .Tip))
        return viewModels
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        let model = viewModel as! DocumentModel
        let cell: UICollectionViewCell & ListBindable
        switch model.type {
        case .explain:
            cell = collectionContext!.dequeueReusableCell(of: ShowDocumentCell.self, for: self, at: index) as! UICollectionViewCell & ListBindable
            print("is DocumentCell?\( cell as? DocumentCell)")
            if let canClick = cell as? DocumentCell {
                print("canClick")
                canClick.callback = { [weak self]() in
                    self?.expanded = false
                    self?.update(animated: false)
                }
            }
        case .ShowDetail:
            cell = collectionContext!.dequeueReusableCell(of: DocumentDetailCell.self, for: self, at: index) as! UICollectionViewCell & ListBindable
            print("is DocumentCell?\( cell as? DocumentCell)")
            if let canClick = cell as? DocumentCell {
                print("canClick")
                canClick.callback = { [weak self]() in
                    self?.expanded = true
                    self?.update(animated: false)
                }
            }
        case .OnSaleTitle:
            cell = collectionContext!.dequeueReusableCell(of: OnSaleTitleCell.self, for: self, at: index) as! UICollectionViewCell & ListBindable
        case .Tip:
            cell = collectionContext!.dequeueReusableCell(of: MonthCell.self, for: self, at: index) as! UICollectionViewCell & ListBindable
        }
        return cell
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        let height = CGFloat(65.0)
        let wi = collectionContext!.containerSize.width
        return CGSize(width: wi, height: height)
    }
    
    override init() {
        super.init()
        dataSource = self
    }
    
    var expanded = false
    
    override func didSelectItem(at index: Int) {
        //        expanded = !expanded
        //        update(animated: true)
        //        data?.click?()
    }
    
}
