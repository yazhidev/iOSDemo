//
// Created by yazhi on 2020/3/17.
// Copyright (c) 2020 zengyazhi. All rights reserved.
//

import Parchment

class CourseToolTopBarCell: PagingCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        backgroundColor = selected ? .green : .gray
    }

}