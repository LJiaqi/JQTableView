//
//  JQUtils.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQUtils: NSObject {
    class func dateFormatFromTimeStamp(timeStamp :TimeInterval) -> String {
        
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeInterval)
        
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        let timeStr = dateformatter.string(from: date)
        return timeStr
        
    }
}
