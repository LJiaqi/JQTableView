//
//  JQCourseLessonsVo.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit
import ObjectMapper

class JQCourseLessonsVo: Mappable {
    var stime :NSNumber?
    var list :[Group] = [Group]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        stime <- map["stime"]
        list <- map["list"]
    }
    
}

class Group :Mappable{
    var groupIndex :Int?
    var groupName :String?
    var lessons :[Lesson] = [Lesson]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        groupIndex <- map["groupIndex"]
        groupName <- map["groupName"]
        lessons <- map["lessons"]
    }
}

class Lesson :Mappable{
    var begin :Int?
    var classId :String?
    var commentCount :Int?
    
    var courseId :Int?
    var finish :Int?
    var index :Int?
    var learned :Int?
    var lessonId :Int?
    
    var lessonUrl :String?
    var regFreeFlag :String?
    var teacherName :String?
    var title :String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        begin <- map["begin"]
        classId <- map["classId"]
        commentCount <- map["commentCount"]
        courseId <- map["courseId"]
        finish <- map["finish"]
        index <- map["index"]
        learned <- map["learned"]
        lessonId <- map["lessonId"]
        lessonUrl <- map["lessonUrl"]
        regFreeFlag <- map["regFreeFlag"]
        teacherName <- map["teacherName"]
        title <- map["title"]
        
    }
}
