//
//  KCTableItem.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class KCCourseListItem: JQTableListItem {

    
    var titleStr: String?
    var dateStr: String = "最近直播"
    var progress: Float = 0
    var subTitleStr :String = ""
    
    init(with courseSystem:CourseSystem) {
        super.init()
        cellHeight = 155
        titleStr = courseSystem.title
        if let nextLesson = courseSystem.nextLesson,
            let beginTime = nextLesson.begin,
            let taughtNum  = courseSystem.taughtNum,
            let lessonCount = courseSystem.lessonCount{
            
            dateStr = "最近直播：\(KCUtils.dateFormatFromTimeStamp(timeStamp: TimeInterval(beginTime/1000)))"
            progress = Float(taughtNum)/Float(lessonCount)
            if let title = nextLesson.title{
                subTitleStr = title
            }
        }
    }

    override func cellType() -> JQTableListCell.Type{
        return KCCourseListCell.self
    }


}


