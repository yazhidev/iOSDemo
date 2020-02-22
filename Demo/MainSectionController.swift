//
//  SettingsSectionController.swift
//  JYXBMineModule-swift
//
//  Created by yazhi on 2020/2/9.
//

import IGListKit

class MainSectionController: ListSectionController {
    
    var data: MainItemConfigModel?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let height = 50 + (data?.marginBottom ?? 0)
        return CGSize(width: collectionContext!.containerSize.width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: MainCommonCell.self, for: self, at: index) as! MainCommonCell
        
        if let data = data {
            cell.config(data)
        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let model = object as? MainItemConfigModel else {
            return
        }
        data = model
    }
    
    override func didSelectItem(at index: Int) {
        print("click")
        data?.click?()
    }
    
    
}
