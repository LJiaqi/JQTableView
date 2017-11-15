//
//  KCTableDemoVCL.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class KCTableDemoVCL: KCTableVCL {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = KCTableDemoModel()
        self.title = "课程列表"
        addHeaderView()
        
        loadItems()
    }
    
    func addHeaderView() {
        let headerView :KCTableDemoHeaderView = KCTableDemoHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 56))
        headerView.title = title
        self.tableView.tableHeaderView = headerView
    }

    override func registerCell() {
        super.registerCell()
        KCTableDemoCell.register(for: self.tableView)
    }
    
    //子类重写，加载数据
    func loadItems() {
        showPageTip()
        self.model.loadItems(completion: { [weak self] (dic) in
            self?.reloadData()
        }) { (error) in
            self.dealError(error)
        }
    }
}
