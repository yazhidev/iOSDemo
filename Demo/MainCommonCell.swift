//
//  SettingsCommonCell.swift
//  JYXBMineModule-swift
//
//  Created by yazhi on 2020/2/9.
//

import UIKit
import IGListKit
import SnapKit

class MainCommonCell: UICollectionViewCell {
    
    let separator: CALayer = {
        let layer = CALayer()
        return layer
    }()
    
    lazy private var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.textAlignment = .left
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 15)
        return view
    }()
    
    lazy private var desLable: UILabel = {
           let view = UILabel()
           view.backgroundColor = .white
        view.textColor = .black
           view.font = UIFont.systemFont(ofSize: 14)
           return view
       }()
    
    lazy var arrow: UIImageView = {
        let image = UIImageView.init()
//        image.image = UIImage("arrow")
        return image
    }()
    
    var config: MainItemConfigModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        contentView.backgroundColor = .white
        contentView.layer.addSublayer(separator)
        
        contentView.addSubview(desLable)
        desLable.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-33.5)
        }
        
        contentView.addSubview(arrow)
        arrow.snp.makeConstraints { (make) in
            make.width.equalTo(6.5)
            make.height.equalTo(12.5)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateUI()
    }
    
    private func updateUI() {
        let bounds = contentView.bounds
        var height: CGFloat = 0.5
        var left: CGFloat = 10
        if let config = config {
            label.text = config.title
            desLable.text = config.des
            if(config.marginBottom == 0) {
                separator.backgroundColor = UIColor.gray.cgColor
                separator.frame = CGRect(x: 15, y: bounds.height - height, width: bounds.width - left, height: height)
            } else {
                height = config.marginBottom
                separator.backgroundColor = UIColor.gray.cgColor
                separator.frame = CGRect(x: 0, y: bounds.height - height, width: bounds.width, height: height)
                label.snp.makeConstraints { (make) in
                    make.bottom.equalToSuperview().offset(-config.marginBottom)
                }
            }
            
            if(config.style == .center) {
                label.textAlignment = .center
                arrow.isHidden = true
            }
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func config(_ info: MainItemConfigModel) {
        config = info
    }
    
}



