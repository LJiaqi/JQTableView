//
//  JQDemoModel.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQDemoModel: JQTableListModel {
    override func loadItems(_ parameters: [String : Any]?, completion: @escaping ([String : Any]?) -> Void, failure: @escaping (Error) -> Void) {
        
        //self.wrapperItems()
        self.wrapperSectionItems()
        completion(nil)
    }
    
    //只有cell
    func wrapperItems() {
        var cellItems: [JQDemoItem] = []
        for i in 0..<8 {
            let item = JQDemoItem()
            item.title = "title\(i)"
            item.cellHeight = 60
            cellItems.append(item)
        }
        self.items = cellItems
    }
    //有section
    func wrapperSectionItems() {
        var cellItems: [JQDemoItem] = []
        for i in 0..<8 {
            let item = JQDemoItem()
            item.title = "title\(i)"
            item.cellHeight = 60
            cellItems.append(item)
        }
        
        let header = JQDemoSectionHeaderItem(withType: .header)
        header.height = 35
        header.title = "header"
        
        let footer = JQDemoSectionFooterItem(withType: .footer)
        footer.height = 35
        footer.title = "footer"
        
        var section = JQSectionItem()
        section.headerItem = header
        section.items = cellItems
        section.footerItem = footer
        
        self.sectionItems.append(section)
        self.sectionItems.append(section)
    }
    
}
