//
//  JQDemoCell.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQDemoCell: JQTableListCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var reuseIdentifier: String?{
        return "JQTableListCell"
    }
    
    override func setObject(_ obj: JQTableListItem) {
        super.setObject(obj)
        
        if let obj = obj as? JQDemoItem {
            self.textLabel!.text = obj.title
        }
    }
}
