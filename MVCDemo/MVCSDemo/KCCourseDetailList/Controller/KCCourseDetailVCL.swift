//
//  KCCourseDetailVCL.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class KCCourseDetailVCL: KCTableVCL {

    var currentCourseId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = KCCourseDetailModel()
        self.title = ""
        loadItems()
    }
    
    func addHeaderView() {
        let headerView :KCCouseDetailHeaderView = KCCouseDetailHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 56))
        headerView.title = title
        self.tableView.tableHeaderView = headerView
    }
    
    override func registerCell() {
        super.registerCell()
        KCCourseDetailCell.register(for: self.tableView)
    }
    
    //子类重写，加载数据
    func loadItems() {
        showPageTip()
        
        guard let detailModel = self.model as?KCCourseDetailModel else { return }
        
        detailModel.loadCourseDetail(completion: { [weak self](dic) in
            if let dict = dic{
                if let courseDetail = dict["courseDetail"] as? KCCourseDetailVo {
                    self?.successWithDetail(detailVo: courseDetail)
                }
            }
        }) { (error) in
            self.dealError(error)
        }
    }
    
    func successWithDetail(detailVo:KCCourseDetailVo) {
        self.title = detailVo.title
        addHeaderView()
        
    }
    
    func loadPlayItems() {
        
    }
    
    func loadReplayItems() {
        
    }
}
