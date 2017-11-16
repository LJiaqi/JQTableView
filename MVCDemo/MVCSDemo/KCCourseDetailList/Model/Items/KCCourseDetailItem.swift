//
//  KCCourseDetailItem.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class KCCourseDetailItem: JQTableListItem {
    
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
        
        timeStr = KCUtils.dateFormatFromTimeStamp(timeStamp: TimeInterval(exactly: lesson.begin!)!)
    }
    
    override func cellType() -> JQTableListCell.Type{
        return KCCourseDetailCell.self
    }
}
