//
//  ConfirnClearCacheView.swift
//  JYXBMineModule-swift
//
//  Created by yazhi on 2020/2/12.
//

import UIKit
import SnapKit
import XBBaseUIKit

class ConfirnClearCacheView: UIViewController {
    
    typealias ConfirmBlock = () -> Void
    
    var confirmBlock: ConfirmBlock?
    
    private lazy var bg: UIView = {
        let bg = UIView()
        bg.backgroundColor = .white
        bg.layer.cornerRadius = 12
        bg.layer.masksToBounds = true
        return bg
    }()
    
    private lazy var cancel: UIButton = {
        let btn = UIButton()
        btn.setTitle("取消", for: .normal)
        btn.setTitleColor(UIColor(hex:"#35CBDB"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var confirm: UIButton = {
        let btn = UIButton()
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor(UIColor(hex:"#35CBDB"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(confirmBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(hex: "#EEEEEE")
        return line
    }()
    
    private lazy var content: UILabel = {
        let tv = UILabel()
        tv.text = "您要清除缓存吗？"
        tv.textColor = UIColor(hex: "#666666")
        tv.textAlignment = .center
        tv.font = UIFont.systemFont(ofSize: 16)
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        
    }
    
    let size = CGSize.init(width: 270, height: 140)
    
    
    
    func makeUI () {
        
        view.snp.makeConstraints { (make) in
            make.size.equalTo(size)
        }
        
        view.addSubview(bg)
        bg.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(size)
        }
        
        bg.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-51)
            make.height.equalTo(0.5)
        }
        
        bg.addSubview(cancel)
        cancel.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(line.snp.bottom)
        }
        bg.addSubview(confirm)
        confirm.snp.makeConstraints { (make) in
            make.left.equalTo(cancel.snp.right)
            make.width.equalTo(cancel)
            make.top.equalTo(line.snp.bottom)
            make.right.bottom.equalToSuperview()
        }
        
        bg.addSubview(content)
        content.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(line.snp.top)
        }
    }
    
    @objc func confirmBtnTapped() {
        if let block = confirmBlock {
            block()
        }
        self.dismiss(animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}
