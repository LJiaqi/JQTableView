//
//  JQTableItem.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQCourseListItem: JQTableListItem {

    
    var titleStr: String?
    var dateStr: String = "最近直播"
    var progress: Float = 0
    var subTitleStr :String = ""
    var courseId :Int = 0
    
    init(with courseSystem:CourseSystem) {
        super.init()
        
        if let courId = courseSystem.courseId {
            courseId = courId
        }
        cellHeight = 155
        titleStr = courseSystem.title
        
        if let nextLesson = courseSystem.nextLesson,
            let beginTime = nextLesson.begin,
            let taughtNum  = courseSystem.taughtNum,
            let lessonCount = courseSystem.lessonCount{
            
            dateStr = "最近直播：\(JQUtils.dateFormatFromTimeStamp(timeStamp: TimeInterval(beginTime/1000)))"
            progress = Float(taughtNum)/Float(lessonCount)
            if let title = nextLesson.title{
                subTitleStr = title
            }
        }
    }

    override func cellType() -> JQTableListCell.Type{
        return JQCourseListCell.self
    }


}


