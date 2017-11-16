//
//  MyExpressResponse.swift
//  KaoChong
//
//  Created by kai zhou on 23/02/2017.
//  Copyright © 2017 com.KaoChong. All rights reserved.
//

import Foundation
import ObjectMapper

class KCNetResponse<T>: Mappable where T:Mappable{
    var requestId:String?
    var errorCode:NSNumber?
    var errorMsg:String?
    var stime:NSNumber?
    var results:T?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        requestId <- map["requestId"]
        errorCode <- map["errorCode"]
        errorMsg <- map["errorMsg"]
        stime <- map["stime"]
        results <- map["results"]
    }
    
}

class KCPage:Mappable{
    var pageCount:NSNumber = 0 //总页数
    var pageSize:NSNumber = 30 //查询每页的数量
    var totalCount:NSNumber = 0 //总数量
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        pageCount <- map["pageCount"]
        pageSize <- map["pageSize"]
        totalCount <- map["totalCount"]
    }
    
    
    var pageNum:NSNumber = 0 //请求传的，返回没有
    
    func updatePage(p:KCPage){
        pageCount = p.pageCount
        totalCount = p.totalCount
        pageSize = p.pageSize
        
        pageNum = NSNumber(value:pageNum.intValue + 1)
    }
    
    var nextPageNum:NSNumber{
        get{
            return NSNumber(value:pageNum.intValue + 1)
        }
    }
    
    var hasNextPage:Bool{
        get{
            return pageNum.intValue*pageNum.intValue < pageCount.intValue
        }
    }
    
}

