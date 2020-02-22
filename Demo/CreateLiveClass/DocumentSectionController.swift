//
//  DocumentSectionController.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit

class DocumentSectionController: ListSectionController {
    var data: DocumentModel?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let height = CGFloat(50.0)
        let wi = collectionContext!.containerSize.width
        return CGSize(width: wi, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        print("index \(index)")
        let cell = collectionContext!.dequeueReusableCell(of: DocumentCell.self, for: self, at: index) as! DocumentCell
        
//        if let data = data {
//            cell.config(data)
//        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let model = object as? DocumentModel else {
            return
        }
        data = model
    }
    
    override func didSelectItem(at index: Int) {
        print("click")
//        data?.click?()
    }

}
