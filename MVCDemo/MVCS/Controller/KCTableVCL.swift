//
//  KCTableVCL.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/14.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class KCTableVCL: JQTableListController {

    var titleStr: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
    }

    
    func reloadData() {
        hideAllPageTip()
        
        let ds = JQTableListDataSource()
        if self.model.items.count > 0{
            ds.items = self.model.items
        }else if self.model.sectionItems.count > 0{
            ds.sectionItems = self.model.sectionItems
        }
        self.dataSource = ds
    }
    
    func dealError(_ error :Error) {
        
    }
    
    func hideAllPageTip() {
        
    }
    
    func showPageTip() {
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 38 {
            self.navigationItem.title = title
        }else{
            self.navigationItem.title = nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
