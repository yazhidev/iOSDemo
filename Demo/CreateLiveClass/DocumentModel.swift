//
//  DocumentModel.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit

enum HeadCellType {
    case ShowDetail //查看开课说明按钮
    case explain //开课说明显示中
    case OnSaleTitle
    case Tip
}

class DocumentModel {
    let type: HeadCellType
    
    init(type: HeadCellType) {
        self.type = type
    }
}

extension DocumentModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return type.hashValue as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return type == type
    }
    
}
