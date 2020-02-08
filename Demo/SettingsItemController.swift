//
//  SettingsItemController.swift
//  Demo
//
//  Created by Lina on 2020/2/8.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit
import UIKit

class SettingsItemController: ListBindingSectionController<Model>, ListBindingSectionControllerDataSource {
    
    override init() {
        super.init()
        dataSource = self
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let object = object as? Model else { fatalError()}
        let results = [object]
        return results
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        let cellClass: UICollectionViewCell.Type
        if viewModel is Model {
            cellClass = LabelCell.self
        }
        guard let cell = collectionContext?.dequeueReusableCell(of: ItemCell.self, for: self, at: index) as? UICollectionViewCell & ListBindable else {
            fatalError()
        }
        return cell
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else { fatalError() }
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }
    
    
}
