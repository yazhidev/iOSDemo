//
//  SingleItemController.swift
//  Demo
//
//  Created by Lina on 2020/2/8.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit

class SingleItemController: ListSectionController {
    
    var data: Model?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: ItemCell.self, for: self, at: index) as! ItemCell
        
        if let data = data {
            cell.updateWith(data)
        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let model = object as? Model else {
            return
        }
        data = model
    }
 
    
    override func didSelectItem(at index: Int) {
        print("click")
        data?.click()
    }
}
