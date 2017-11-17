//
//  JQCourseDetailGroupItem.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQCourseDetailGroupItem: JQTableListItem {
    
    var titleStr :String?
    var index :Int?
    var lessonItems = [JQCourseDetailItem]()
    var isclose :Bool = false //展开、收起
    init(with group:Group) {
        super.init()
        titleStr = group.groupName
        index = group.groupIndex
        cellHeight = 60
        var items :[JQCourseDetailItem] = []
        for lesson in group.lessons {
            let item = JQCourseDetailItem.init(with: lesson)
            item.cellHeight = 120
            items.append(item)
        }
        lessonItems = items
    }
    
    override func cellType() -> JQTableListCell.Type{
        return JQCourseDetailGroupCell.self
    }
}
