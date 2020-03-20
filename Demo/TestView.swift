//
// Created by yazhi on 2020/3/20.
// Copyright (c) 2020 zengyazhi. All rights reserved.
//

import UIKit

class TestView: UIView {

    var title = ""

    init(title: String) {
        self.title = title
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("=== \(title) removeFromSuperview")
    }

    override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        print("=== \(title) willRemoveSubview")
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        print("=== \(title) willMove toWindow \(newWindow)")
    }

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("=== \(title)  willMove toSuperview \(newSuperview)")
    }
}