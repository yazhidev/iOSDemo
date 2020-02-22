//
//  DocumentCell.swift
//  Demo
//
//  Created by Lina on 2020/2/22.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import UIKit
import IGListKit

class DocumentCell: UICollectionViewCell {
    lazy private var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.textAlignment = .left
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 15)
        view.text = "afdaf"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
//        label.backgroundColor = .red
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           updateUI()
       }
    
    private func updateUI() {
    let bounds = contentView.bounds
    var height: CGFloat = 0.5
        
    }
    
    required init?(coder: NSCoder) {
          super.init(coder: coder)
      }

    
//    func config(_ info: SettingsItemConfigModel) {
//           config = info
//       }
}


extension DocumentCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        print("")
    }
}
