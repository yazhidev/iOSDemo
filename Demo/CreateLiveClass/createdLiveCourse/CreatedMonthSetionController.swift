//
//  CreatedMonthSetionController.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import Foundation
import IGListKit

class CreatedMonthSetionController: ListSectionController {
    var data: MonthModel?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        
        return CGSize(width: collectionContext!.containerSize.width, height: 30)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CreatedLiveClassMonthCell.self, for: self, at: index) as! CreatedLiveClassMonthCell
        cell.label.text = data?.month
        return cell
    }
    
    override func didUpdate(to object: Any) {
        print("--didUpdate")
        print(object)
        data = object as? MonthModel
    }
    
    
    
}