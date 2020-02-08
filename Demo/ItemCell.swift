//
//  ItemCell.swift
//  Demo
//
//  Created by Lina on 2020/2/8.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import IGListKit

class ItemCell: UICollectionViewCell{
    
    fileprivate static let insets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
    fileprivate static let font = UIFont.systemFont(ofSize: 17)
    
    lazy private var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.textAlignment = .center
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 18)
        self.contentView.addSubview(view)
        return view
    }()
    
    let separator: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor(red: 200 / 255.0, green: 199 / 255.0, blue: 204 / 255.0, alpha: 1).cgColor
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.layer.addSublayer(separator)
        contentView.backgroundColor = .white
//        self.accessoryType = .disclosureIndicator
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //        label.frame = contentView.bounds
        let bounds = contentView.bounds
        label.frame = bounds.inset(by: ItemCell.insets)
        let height: CGFloat = 0.5
        let left = ItemCell.insets.left
        separator.frame = CGRect(x: left, y: bounds.height - height, width: bounds.width - left, height: height)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateWith(_ info: Model) {
        label.text = info.title
    }
    
}
