//
//  JQCourseDetailVCL.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQCourseDetailVCL: JQTableVCL {

    var currentCourseId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = JQCourseDetailModel()
        self.title = ""
        loadItems()
    }
    
    func addHeaderView() {
        let headerView :JQCouseDetailHeaderView = JQCouseDetailHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 56))
        headerView.title = title
        self.tableView.tableHeaderView = headerView
    }
    
    override func registerCell() {
        super.registerCell()
        JQCourseDetailCell.register(for: self.tableView)
        JQCourseDetailGroupCell.register(for: self.tableView)
    }
    
    //子类重写，加载数据
    func loadItems() {
        showPageTip()
        
        guard let detailModel = self.model as?JQCourseDetailModel else { return }
        
        detailModel.loadCourseDetail(completion: { [weak self](dic) in
            if let dict = dic{
                if let courseDetail = dict["courseDetail"] as? JQCourseDetailVo {
                    self?.successWithDetail(detailVo: courseDetail)
                }
            }
        }) { [weak self](error) in
            self?.dealError(error)
        }
    }
    
    func successWithDetail(detailVo:JQCourseDetailVo) {
        self.title = detailVo.title
        addHeaderView()
        loadReplayItems()
    }
    
    func loadReplayItems() {
        guard let detailModel = self.model as?JQCourseDetailModel else { return }
        detailModel.loadReplayDetail(completion: {[weak self] (dic) in
            self?.reloadData()
        }) { (error) in
            
        }
    }
    
    func groupCellSelected(){
        guard let detailModel = self.model as?JQCourseDetailModel else { return }
        detailModel.resetItems()
        self.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let groupCell = cell as?JQCourseDetailGroupCell {
            weak var instance = self
            groupCell.selectedBlock = {
                instance?.groupCellSelected()
            }
        }
    }
}

