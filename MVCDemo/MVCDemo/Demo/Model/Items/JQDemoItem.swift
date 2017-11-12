//
//  JQDemoItem.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQDemoItem: JQTableListItem {
    var title: String?
    override func cellType() -> JQTableListCell.Type {
        return JQDemoCell.self
    }
}
