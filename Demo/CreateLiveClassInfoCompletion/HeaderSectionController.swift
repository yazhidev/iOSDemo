//
//  HeadSectionController.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit

class HeaderSectionController : ListBindingSectionController<ListDiffable>, ListBindingSectionControllerDataSource {
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        var data = [HeadInfoModel]()
        data.append(HeadInfoModel())
        data.append(HeadInfoModel(title: "标题", value: "值"))
        data.append(HeadInfoModel(title: "标题", value: "值22"))
        return data
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        print("---\(viewModel)")
        let cellClass: UICollectionViewCell.Type
        if(viewModel is HeadInfoModel) {
            let model = viewModel as! HeadInfoModel
            if(model.value.isEmpty) {
                cellClass = HeaderTitleCell.self
            } else {
                cellClass = HeaderInfoCell.self
            }
        } else {
            cellClass = HeaderCell.self
        }
        print(cellClass)
        guard let cell = collectionContext?.dequeueReusableCell(of: cellClass, for: self, at: index) as? UICollectionViewCell & ListBindable else {
            fatalError()
        }
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
    
    
}
