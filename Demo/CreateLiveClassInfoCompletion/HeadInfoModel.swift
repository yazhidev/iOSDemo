//
//  HeadInfoModel.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import IGListKit

class HeadInfoModel {
    var title: String
    var value: String
    
    init(title :String = "", value: String = "") {
        self.title = title
        self.value = value
    }
}

extension HeadInfoModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return value as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return value == value && title == title
    }
    
}
