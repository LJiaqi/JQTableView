//
//  JQSectionView.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQSectionView: UIView {

    final var _object: JQTableListSectionItem?
    
    final public var item:JQTableListSectionItem? {
        get {
            return _object
        }
    }
    
    //override
    open func setObject (_ obj:JQTableListSectionItem) {
        _object = obj
    }
    
    //override
    open class func tableView (_ tableView: UITableView, heightForSectionView object: JQTableListSectionItem) -> CGFloat {
        return object.height
    }


}
