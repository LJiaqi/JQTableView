//
//  JQCourseDetailItem.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class JQCourseDetailItem: JQTableListItem {
    
    var numStr :String?
    var titleStr :String?
    var subTitleStr :String?
    var timeStr :String?
    var commentStr :String?
    
    init(with lesson:Lesson) {
        super.init()

        titleStr = lesson.title
        subTitleStr = lesson.teacherName
        if let index  = lesson.index {
            numStr = "\(index)"
        }
        if let commentCount  = lesson.commentCount {
            commentStr = "评价\(commentCount)"
        }
        
        timeStr = JQUtils.dateFormatFromTimeStamp(timeStamp: TimeInterval(exactly: lesson.begin!/1000)!)
    }
    
    override func cellType() -> JQTableListCell.Type{
        return JQCourseDetailCell.self
    }
}
