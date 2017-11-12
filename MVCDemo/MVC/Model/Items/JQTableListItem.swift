//
//  JQTableListItem.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQTableListItem: NSObject {
    var cellHeight: CGFloat = 0

    func cellType() -> JQTableListCell.Type{
        return JQTableListCell.self
    }
}
