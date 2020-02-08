//
//  Model.swift
//  Demo
//
//  Created by Lina on 2020/2/8.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit

final class Model: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let object = object as? Model {
          return title == object.title
        }
        return false
    }
    
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
}
