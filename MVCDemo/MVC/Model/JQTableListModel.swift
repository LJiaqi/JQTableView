//
//  JQModel.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQTableListModel: NSObject {
    var items: [JQTableListItem] = []
    var sectionItems: [JQSectionItem] = []
    
    open func loadItems(_ parameters : [String:Any]? = nil,
                        completion : @escaping ([String:Any]?)->Void ,
                        failure : @escaping (Error)->Void){
        
    }
}
