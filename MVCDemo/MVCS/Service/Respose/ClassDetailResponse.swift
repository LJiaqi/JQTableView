//
//  ClassDetailResponse.swift
//  VipKaoChong
//
//  Created by yuhan on 30/10/2017.
//  Copyright © 2017 com.KaoChong. All rights reserved.
//

import Foundation
import ObjectMapper


class ClassDetailResults:Mappable{
    
    var courseBegin:Int64?
    var courseFinish:Int64?
    var courseId:Int!
    var courseSystem:[CourseSystem] = [CourseSystem]()
   
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
        courseSystem <- map["courseSystem"]
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

class CourseSystem:Mappable{
    var courseId:Int?
    var index:Int?
    var lessonCount:Int?
    var name:String?
    var period:Int?
    var title:String?
    var type:Int?
    var weight:Int?
    var taughtNum:Int? //已授课数量
    var nextLesson:NextLesson?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        courseId <- map["courseId"]
        index <- map["index"]
        lessonCount <- map["lessonCount"]
        name <- map["name"]
        period <- map["period"]
        title <- map["title"]
        type <- map["type"]
        weight <- map["weight"]
        taughtNum <- map["taughtNum"]
        nextLesson <- map["nextLesson"]
    }
}

class NextLesson:Mappable{
    var begin:Int64?
    var courseId:Int?
    var finish:Int64?
    var id:Int?
    var index:Int?
    var title:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        begin <- map["begin"]
        courseId <- map["courseId"]
        finish <- map["finish"]
        id <- map["id"]
        index <- map["index"]
        title <- map["title"]
    }
}
