//
//  KCCourseListModel.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit


class KCCourseListModel: KCTableModel {
    let service = KCNetworkService()
    
    override func loadItems(_ parameters: [String : Any]?, completion: @escaping ([String : Any]?) -> Void, failure: @escaping (Error) -> Void) {
        
        let urlStr1 = "https://mobileviptest.kaochong.com/api/mycourse/class/detail?apiVer=2&ca=%E6%9C%AA%E7%9F%A5%E8%BF%90%E8%90%A5%E5%95%86&cl=appstore&classId=793&duid=CDB7DA2A85EA64DC8B7B350422786153C9B5465F4D1FC63D5DDC270C01F420C3256DFE8FDEC58316BFAFF740F00DEF27&dv=iPhoneSimulator&nt=wifi&odv=x86_64&ov=11.1&rosType=ios&sh=1334&sw=750&token=A87E52EEE124B0C571D4D782DF768C14C2D0EDC25C0BD2D4E7021031532BE4AD&ver=1.0.0"
        
        service.request(parameters: nil, urlStr: urlStr1, completionHandler: { [weak self](response:KCNetResponse<ClassDetailResults>) in
            self?.wrapperItems(response: response)
            completion(nil)
        }) { (error) in
            failure(error)
        }
    }
    
    func wrapperItems(response:KCNetResponse<ClassDetailResults>){
        
        if let courseList = response.results?.courseSystem{
            var cellItems: [KCCourseListItem] = []
            for respose in courseList {
                let item = KCCourseListItem(with: respose)
                cellItems.append(item)
            }
            
            let sectionHeaderItem = KCCourseListSectionHeaderItem(withType: .header)
            sectionHeaderItem.title = "课程体系"
            sectionHeaderItem.height = 62
            
            var section = JQSectionItem()
            section.headerItem = sectionHeaderItem
            section.items = cellItems
            
            self.sectionItems.append(section)
        }
    }
}
