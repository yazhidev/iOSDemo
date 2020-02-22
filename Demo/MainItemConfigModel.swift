//
//  JYXB_SettingsItemConfig.swift
//  JYXBMineModule-swift
//
//  Created by yazhi on 2020/2/9.
//

import IGListKit

typealias Click = () -> Void

public enum ItemStyle {
    // 文字居左，右边带箭头
    case normal
    // 文字居中
    case center
}

class MainItemConfigModel {
    let title: String
    let des: String
    let marginBottom: CGFloat
    let click: Click?
    let style: ItemStyle
    
    init(title: String, style: ItemStyle = .normal, des: String = "", marginBottom: CGFloat = 0, click: Click? = nil) {
        self.style = style
        self.title = title
        self.des = des
        self.marginBottom = marginBottom
        self.click = click
    }
}

extension MainItemConfigModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return "\(title)\(des)" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return title == title && des == des
    }
    
}
