//
//  JQTableListController.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQTableListController: UIViewController{

    lazy var tableView: UITableView = {
        return createTable()
    }()
    
    fileprivate var _dataSource: JQTableListDataSource?
    var dataSource: JQTableListDataSource?{
        set{
            _dataSource = newValue
            if _dataSource != nil {
                self.tableView.dataSource = _dataSource
                self.tableView.reloadData()
            }
        }
        get{
            return _dataSource
        }
    }
    
    var model: JQTableListModel = JQTableListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    //override
    func registerCell(){
        JQTableListCell.register(for: self.tableView)
    }

    func createTable() -> UITableView{
        var frame = self.view.bounds
        frame.size.height = self.view.bounds.height - 64
        let tableView = UITableView(frame:frame)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        self.view.addSubview(tableView)
        return tableView
    }
}

extension JQTableListController: UITableViewDelegate{
    //MARK: - 返回高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let dataSource = tableView.dataSource as? JQTableListDataSource else{
            return 0
        }
        //1.根据 indexpath 获取 item
        //2.根据 item 获取 cellType
        //3.cellTpye 返回高度
        if let obj = dataSource.tableView(tableView, itemForRowAt: indexPath){
            let cellType = dataSource.tableView(tableView, cellClassForObject: obj)
            return cellType.tableView(tableView, heightForCell: obj)
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        guard let dataSource = tableView.dataSource as? JQTableListDataSource else{
            return 0
        }
        if let obj = dataSource.tableView(tableView, itemForSectionHeaderAt: section){
            let cellType = dataSource.tableView(tableView, sectionViewClassForObject: obj)
            return cellType.tableView(tableView, heightForSectionView: obj)
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        guard let dataSource = tableView.dataSource as? JQTableListDataSource else{
            return 0
        }
        if let obj = dataSource.tableView(tableView, itemForSectionFooterAt: section){
            let cellType = dataSource.tableView(tableView, sectionViewClassForObject: obj)
            return cellType.tableView(tableView, heightForSectionView: obj)
        }
        return 0
    }
    
    //MARK: - 返回sectionHeader||sectionFooter
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let dataSource = tableView.dataSource as? JQTableListDataSource else{
            return nil
        }
        if let obj = dataSource.tableView(tableView, itemForSectionHeaderAt: section){
            let cellType = dataSource.tableView(tableView, sectionViewClassForObject: obj)
            let view = cellType.init()
            view.setObject(obj)
            return view
        }
        return nil
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        guard let dataSource = tableView.dataSource as? JQTableListDataSource else{
            return nil
        }
        if let obj = dataSource.tableView(tableView, itemForSectionFooterAt: section){
            let cellType = dataSource.tableView(tableView, sectionViewClassForObject: obj)
            let view = cellType.init()
            view.setObject(obj)
            return view
        }
        return nil
    }
}







