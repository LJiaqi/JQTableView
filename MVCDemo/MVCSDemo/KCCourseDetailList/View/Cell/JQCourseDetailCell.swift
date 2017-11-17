//
//  JQCourseDetailCell.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQCourseDetailCell: JQTableCell {

    var numLabel: UILabel!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var dateLabel: UILabel!
    var commentLabel: UILabel!

    open override class func cellIdentifier() -> String{
        return "JQCourseDetailCell"
    }
    
    override func setObject(_ obj: JQTableListItem) {
        super.setObject(obj)
        
        if let item = obj as? JQCourseDetailItem {
            titleLabel.text = item.titleStr
            dateLabel.text = item.timeStr
            subTitleLabel.text = item.subTitleStr
            commentLabel.text = item.commentStr
            numLabel.text = item.numStr
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let item = self.item as? JQCourseDetailItem else { return }
        let viewWidth = self.bounds.size.width
        var numFrame = CGRect.zero
        numFrame.origin.x = 20
        numFrame.origin.y = 30
        numFrame.size.width = 20
        numFrame.size.height = 17
        self.numLabel.frame = numFrame
        
        var titleFrame = CGRect.zero
        titleFrame.origin.x = 50
        titleFrame.origin.y = 30
        titleFrame.size.width = viewWidth - 80
        titleFrame.size.height = 17
        self.titleLabel.frame = titleFrame
        
        var subTitleFrame = subTitleLabel.frame
        subTitleFrame.origin.x = 50
        subTitleFrame.origin.y = titleFrame.size.height + titleFrame.origin.y + 8
        subTitleFrame.size.width = viewWidth - 80
        subTitleFrame.size.height = 17
        self.subTitleLabel.frame = subTitleFrame
        
        var dateFrame = CGRect.zero
        dateFrame.origin.x = 50
        dateFrame.origin.y = subTitleFrame.size.height + subTitleFrame.origin.y + 14
        dateFrame.size.width = viewWidth - 80
        dateFrame.size.height = 12
        self.dateLabel.frame = dateFrame

        var commentFrame = CGRect.zero
        commentFrame.origin.x = viewWidth - 97
        commentFrame.origin.y = dateFrame.origin.y
        commentFrame.size.width = 70
        commentFrame.size.height = 20
        self.commentLabel.frame = commentFrame
    }
    
    override func createViews() {
        super.createViews()
        
        let title1 = addLabel()
        let title2 = addLabel()
        let title3 = addLabel()
        let title4 = addLabel()
        let title5 = addLabel()
        
        self.contentView.addSubview(title1)
        self.contentView.addSubview(title2)
        self.contentView.addSubview(title3)
        self.contentView.addSubview(title4)
        self.contentView.addSubview(title5)
        
        titleLabel = title1
        titleLabel.textColor = UIColor.init(red: 56/255.0, green: 54/255.0, blue: 50/255.0, alpha: 1.0)
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        
        dateLabel = title2
        subTitleLabel = title3
        numLabel = title4
        commentLabel = title5
        commentLabel.textAlignment = .center
        
    }

}
