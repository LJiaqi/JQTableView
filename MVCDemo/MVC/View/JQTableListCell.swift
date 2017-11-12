//
//  JQTableListCell.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQTableListCell: UITableViewCell {    
    final var _object: JQTableListItem?
    
    final public var item:JQTableListItem? {
        get {
            return _object
        }
    }
    
    //override
    open func setObject (_ obj:JQTableListItem) -> Void {
        _object = obj
    }
    
    //override
    open class func JQIdentifier() -> String{
        return "\(self)"
    }
    
    //override
    open class func tableView (_ tableView: UITableView, heightForCell object: JQTableListItem) -> CGFloat {
        return object.cellHeight
    }
    
    open class func register(for tableView:UITableView)  {
        tableView.register(self, forCellReuseIdentifier: self.JQIdentifier())
    }

}
