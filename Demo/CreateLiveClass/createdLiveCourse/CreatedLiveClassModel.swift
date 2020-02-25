//
//  CreatedLiveClassModel.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import Foundation
import IGListKit

class CreatedLiveClassModel {
    let year: Int
    let data: [MonthModel]
    
    init(year: Int, data: [MonthModel]) {
        self.year = year
        self.data = data
    }
}

extension CreatedLiveClassModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return year as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? CreatedLiveClassModel else { return false }
        return year == object.year && data == object.data
    }
    
}

class MonthModel : Equatable {
    
    static func == (lhs: MonthModel, rhs: MonthModel) -> Bool {
        return lhs.month == rhs.month
    }
    
    let month: String
    init(month: String) {
        self.month = month
    }
    
}

extension MonthModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return month as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? MonthModel else { return false }
        return month == object.month
    }
    
}


