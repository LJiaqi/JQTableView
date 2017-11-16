//
//  KCMyCourseDetailVo.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit
import ObjectMapper

class KCCourseDetailVo: Mappable{
    var courseBegin:Int64?
    var courseFinish:Int64?
    var courseId:Int!
    var learningProgress:LearningProgress?
    
    var stime:NSNumber?
    var expirationDate:Int64?
    var goodsNo:String?
    var orderNo:String?
    var pic:String?
    var picSquare:String?
    var qqGroup:Int?
    var title:String?
    var type:Int?
    var vipCourseType:Int? //0全部。1 vip 2公开课
    var nextLesson:NextLesson?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        courseBegin <- map["courseBegin"]
        courseFinish <- map["courseFinish"]
        courseId <- map["courseId"]
        learningProgress <- map["learningProgress"]
        stime <- map["stime"]
        expirationDate <- map["expirationDate"]
        goodsNo <- map["goodsNo"]
        orderNo <- map["orderNo"]
        pic <- map["pic"]
        picSquare <- map["picSquare"]
        qqGroup <- map["qqGroup"]
        title <- map["title"]
        type <- map["type"]
        vipCourseType <- map["vipCourseType"]
        nextLesson <- map["nextLesson"]
    }
}

class LearningProgress:Mappable{
    var classAvgRate:NSNumber?
    var learnedRate:NSNumber?
    var taughtRate:NSNumber?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        classAvgRate <- map["classAvgRate"]
        learnedRate <- map["learnedRate"]
        taughtRate <- map["taughtRate"]
    }
}

