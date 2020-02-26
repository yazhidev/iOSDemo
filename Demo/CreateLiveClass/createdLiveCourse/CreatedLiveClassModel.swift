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
    let year: YearModel
    let data: [MonthModel]
    
    init(year: YearModel, data: [MonthModel]) {
        self.year = year
        self.data = data
    }
}

extension CreatedLiveClassModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return year.year as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? CreatedLiveClassModel else { return false }
        return year == object.year && data == object.data
    }
    
}


class YearModel : Equatable {
    static func == (lhs: YearModel, rhs: YearModel) -> Bool {
        return lhs.year == rhs.year
    }

    let year: String
    init(year: String) {
        self.year = year
    }

}



class MonthModel : Equatable {
    
    static func == (lhs: MonthModel, rhs: MonthModel) -> Bool {
        return lhs.month == rhs.month
    }
    
    let month: String
    let num: String
    init(month: String, num: String = "2") {
        self.month = month
        self.num = num
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

extension YearModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return year as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? YearModel else { return false }
        return year == object.year
    }
}

