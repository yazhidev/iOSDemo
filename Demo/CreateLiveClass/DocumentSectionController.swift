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
        viewModels.append(DocumentModel(id: "1"))
        if(expanded) {
            viewModels.append(DocumentModel(id: "2"))
        }
        
        return viewModels
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        let cell = collectionContext!.dequeueReusableCell(of: HeaderTitleCell.self, for: self, at: index) as! HeaderTitleCell
        return cell
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        let height = CGFloat(50.0)
        let wi = collectionContext!.containerSize.width
        print("height \(height)")
        return CGSize(width: wi, height: height)
    }
    
    override init() {
        super.init()
        dataSource = self
    }
    
    var expanded = true
    
    override func didSelectItem(at index: Int) {
        expanded = !expanded
        update(animated: true)
        //        data?.click?()
    }
    
}
