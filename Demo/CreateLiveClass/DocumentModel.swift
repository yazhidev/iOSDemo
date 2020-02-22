//
//  DocumentModel.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit

class DocumentModel {
    let id:String
    
    init(id: String) {
        self.id = id
    }
}


extension DocumentModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return id == id
    }
    
}
