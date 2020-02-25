//
//  CreatedLiveCourseCell.swift
//  Demo
//
//  Created by 曾亚智 on 2020/2/25.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

class CreatedLiveClassMonthCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .yellow
        view.textAlignment = .left
        view.textColor = .black
        view.font = 18.f
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
