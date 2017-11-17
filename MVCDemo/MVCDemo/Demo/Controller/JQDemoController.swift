//
//  JQDemoController.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQDemoController: JQTableListController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = JQDemoModel()
        loadItems()
    }
    
    override func registerCell(){
        super.registerCell()
        JQDemoCell.register(for: self.tableView)
    }

    func loadItems() {
        self.model.loadItems(nil, completion: { [weak self](success) in
            self?.reloadData()
        }) { (error) in
            
        }
    }
    
    func reloadData() {
        let ds = JQTableListDataSource()
        if self.model.items.count > 0{
            ds.items = self.model.items
        }else if self.model.sectionItems.count > 0{
            ds.sectionItems = self.model.sectionItems
        }
        self.dataSource = ds
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcl = JQCourseListVCL()
        self.navigationController?.pushViewController(vcl, animated: true)
    }
}
