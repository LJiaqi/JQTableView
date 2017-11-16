//
//  KCCourseDetailGroupCell.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class KCCourseDetailGroupCell: KCTableCell {

    var titleLabel: UILabel!
    var dateLabel: UILabel!
    var subTitleLabel: UILabel!
    var progressView: UIProgressView!
    var imageIcon: UIImageView!
    
    open override class func cellIdentifier() -> String{
        return "KCCourseListCell"
    }
    
    override func setObject(_ obj: JQTableListItem) {
        super.setObject(obj)
        
        if let item = obj as? KCCourseListItem {
            titleLabel.text = item.titleStr
            dateLabel.text = item.dateStr
            subTitleLabel.text = item.subTitleStr
            progressView.progress = item.progress
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let viewWidth = self.bounds.size.width
        
        var titleFrame = CGRect.zero
        titleFrame.origin.x = 20
        titleFrame.origin.y = 30
        titleFrame.size.width = viewWidth - 20*2
        titleFrame.size.height = 17
        self.titleLabel.frame = titleFrame
        
        var imageFrame = imageIcon.frame
        imageFrame.origin.x = 22
        imageFrame.origin.y = titleFrame.size.height + titleFrame.origin.y + 16
        self.imageIcon.frame = imageFrame
        
        var dateFrame = CGRect.zero
        dateFrame.origin.x = imageFrame.origin.x + imageFrame.size.width + 8
        dateFrame.origin.y = titleFrame.size.height + titleFrame.origin.y + 14
        dateFrame.size.width = viewWidth - 20 - dateFrame.origin.x
        dateFrame.size.height = 12
        self.dateLabel.frame = dateFrame
        
        var subtitleFrame = CGRect.zero
        subtitleFrame.origin.x = dateFrame.origin.x
        subtitleFrame.origin.y = dateFrame.origin.y + dateFrame.size.height + 8
        subtitleFrame.size.width = viewWidth - 20 - dateFrame.origin.x
        subtitleFrame.size.height = 12
        self.subTitleLabel.frame = subtitleFrame
        
        var progressFrame = CGRect.zero
        progressFrame.origin.x = dateFrame.origin.x
        progressFrame.origin.y = subtitleFrame.origin.y + subtitleFrame.size.height + 25
        progressFrame.size.width = 235
        progressFrame.size.height = 2.5
        self.progressView.frame = progressFrame
    }
    
    override func createViews() {
        super.createViews()
        
        let title1 = addLabel()
        let title2 = addLabel()
        let title3 = addLabel()
        let progress = addProgressView()
        let image = addImageView()
        
        self.contentView.addSubview(title1)
        self.contentView.addSubview(title2)
        self.contentView.addSubview(title3)
        self.contentView.addSubview(progress)
        self.contentView.addSubview(image)
        
        titleLabel = title1
        dateLabel = title2
        subTitleLabel = title3
        progressView = progress
        imageIcon = image
        imageIcon.image = UIImage.init(named: "ic_mycourse_live")
        imageIcon.frame = CGRect(x: 0, y: 0, width: 12, height: 8)
        
        titleLabel.textColor = UIColor.init(red: 56/255.0, green: 54/255.0, blue: 50/255.0, alpha: 1.0)
        titleLabel.font = UIFont.systemFont(ofSize: 17)
    }
}
