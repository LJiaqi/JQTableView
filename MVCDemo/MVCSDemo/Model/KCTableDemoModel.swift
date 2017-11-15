//
//  KCTableDemoModel.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit


class KCTableDemoModel: KCTableModel {
    let service = KCNetworkService()
    
    override func loadItems(_ parameters: [String : Any]?, completion: @escaping ([String : Any]?) -> Void, failure: @escaping (Error) -> Void) {
        service.request(completionHandler: { [weak self](response:KCNetResponse<ClassDetailResults>) in
            self?.wrapperItems(response: response)
            completion(nil)
        }) { (error) in
            failure(error)
        }
    }
    
    func wrapperItems(response:KCNetResponse<ClassDetailResults>){
        
        if let courseList = response.results?.courseSystem{
            var cellItems: [KCTableDemoItem] = []
            for respose in courseList {
                let item = KCTableDemoItem(with: respose)
                cellItems.append(item)
            }
            
            let sectionHeaderItem = KCTableDemoSectionHeaderItem(withType: .header)
            sectionHeaderItem.title = "课程体系"
            sectionHeaderItem.height = 62
            
            var section = JQSectionItem()
            section.headerItem = sectionHeaderItem
            section.items = cellItems
            
            self.sectionItems.append(section)
        }
    }
}
