//
//  CreatedMonthSetionController.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import Foundation
import IGListKit

class YearSectionController: ListSectionController {
    var data: Int?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: YearCell.self, for: self, at: index) as! MonthCell
        cell.label.text = "\(data)"
        return cell
    }
    
    override func didUpdate(to object: Any) {
        print(object)
        data = object as? Int
    }
    
}
