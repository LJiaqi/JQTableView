//
//  JQTableListDataSource.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

struct JQSectionItem {
    var headerItem: JQTableListSectionItem?
    var items: [JQTableListItem] = []
    var footerItem: JQTableListSectionItem?
}

class JQTableListDataSource: NSObject {
    
    var items: [JQTableListItem] = []
    var sectionItems: [JQSectionItem] = []
    
    // 获取item
    func tableView(_ tableView: UITableView, itemForRowAt indexPath: IndexPath) -> JQTableListItem?{
        if sectionItems.isEmpty {
            if indexPath.row < items.count{
                return items[indexPath.row]
            }
        }else{
            if indexPath.section < sectionItems.count{
                return sectionItems[indexPath.section].items[indexPath.row]
            }
        }
        return nil
    }
    
    // 获取section 的 headerItem
    func tableView(_ tableView: UITableView, itemForSectionHeaderAt section: Int) -> JQTableListSectionItem?{
        if sectionItems.isEmpty, section >= sectionItems.count{
           return nil
        }
        let sectionItem = sectionItems[section]
        return sectionItem.headerItem
    }
    
    // 获取section 的 FooterItem
    func tableView(_ tableView: UITableView, itemForSectionFooterAt section: Int) -> JQTableListSectionItem?{
        if sectionItems.isEmpty, section >= sectionItems.count{
            return nil
        }
        let sectionItem = sectionItems[section]
        return sectionItem.footerItem
    }
    
    //Section 的 View Type
    func tableView(_ tableView: UITableView, sectionViewClassForObject object: JQTableListSectionItem) -> JQTableSectionView.Type {
        return object.viewType()
    }
    
    //Cell 的 View Type
    func tableView(_ tableView: UITableView, cellClassForObject object: JQTableListItem) -> JQTableListCell.Type {
        return object.cellType()
    }
}

extension JQTableListDataSource: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if sectionItems.isEmpty {
            //无section的情况
            return items.count
        }else{
            //有section的情况
            if section < sectionItems.count{
                return sectionItems[section].items.count
            }
        }
        return 0
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        if sectionItems.isEmpty {
            return 1
        }else{
            return sectionItems.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let object = self.tableView(tableView, itemForRowAt: indexPath) else{
            return UITableViewCell()
        }
        
        let cellType = self.tableView(tableView, cellClassForObject: object)
        
        let identifier = cellType.cellIdentifier()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let JQCell = cell as? JQTableListCell {
            JQCell.setObject(object)
        }
        return cell
    }

}







