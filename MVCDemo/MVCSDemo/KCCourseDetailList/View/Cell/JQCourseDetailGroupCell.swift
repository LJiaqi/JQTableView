//
//  JQCourseDetailGroupCell.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQCourseDetailGroupCell: JQTableCell {
    typealias GroupSelectedBlock = () -> Void
    
    var titleLabel: UILabel!
    var selectedBlock: GroupSelectedBlock?
    
    open override class func cellIdentifier() -> String{
        return "JQCourseDetailGroupCell"
    }
    
    override func setObject(_ obj: JQTableListItem) {
        super.setObject(obj)
        
        if let item = obj as? JQCourseDetailGroupItem {
            titleLabel.text = item.titleStr
        }
    }
    
    @objc func selectedAction() -> Void {
        if let item = self.item as? JQCourseDetailGroupItem{
            item.isclose = !item.isclose
            if let selectedBlock = self.selectedBlock {
                selectedBlock()
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let item = self.item as?JQCourseDetailGroupItem else { return }
        let viewWidth = self.bounds.size.width
        
        var titleFrame = CGRect.zero
        titleFrame.origin.x = 20
        titleFrame.size.width = viewWidth - 20*2
        titleFrame.size.height = 17
        self.titleLabel.frame = titleFrame
        self.titleLabel.center.y = item.cellHeight/2
    }
    
    override func createViews() {
        super.createViews()
        let title1 = addLabel()
        self.contentView.addSubview(title1)
        titleLabel = title1
        titleLabel.textColor = UIColor.init(red: 56/255.0, green: 54/255.0, blue: 50/255.0, alpha: 1.0)
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textAlignment = .left
        
        let btn = UIButton.init(frame: self.bounds)
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectedAction), for: .touchUpInside)
        
        self.contentView.addSubview(btn)
    }
}
