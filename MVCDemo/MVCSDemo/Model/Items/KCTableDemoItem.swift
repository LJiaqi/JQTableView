//
//  KCTableItem.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class KCTableDemoItem: JQTableListItem {

    
    var titleStr: String?
    var dateStr: String = "最近直播"
    var progress: Float = 0
    var subTitleStr :String = ""
    
    init(with courseSystem:CourseSystem) {
        super.init()
        cellHeight = 155
        titleStr = courseSystem.title
        if let nextLesson = courseSystem.nextLesson,
            nextLesson.begin != nil,
            courseSystem.taughtNum != nil,
            courseSystem.lessonCount != nil{
                dateStr = "最近直播：\(dateFormatFromTimeStamp(timeStamp: TimeInterval(nextLesson.begin!/1000)))"
                progress = Float(courseSystem.taughtNum!)/Float(courseSystem.lessonCount!)
                if let title = nextLesson.title{
                    subTitleStr = title
            }
        }
    }

    override func cellType() -> JQTableListCell.Type{
        return KCTableDemoCell.self
    }
    
    func dateFormatFromTimeStamp(timeStamp :TimeInterval) -> String {
     
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeInterval)
        
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let timeStr = dateformatter.string(from: date)
        return timeStr

    }

}


