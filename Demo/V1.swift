//
// Created by yazhi on 2020/3/17.
// Copyright (c) 2020 zengyazhi. All rights reserved.
//

import UIKit

class V1: UIViewController {

    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        print("V1 init")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

    }
}