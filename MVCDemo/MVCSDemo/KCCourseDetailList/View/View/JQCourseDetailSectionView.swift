//
//  JQCourseDetailSetionView.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQCourseDetailSectionView: JQTableSectionView {

    var titleLabel: UILabel!
    var lineView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        createViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews() {
        self.backgroundColor = .white
        titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 0, y: 0, width: 62, height: 15)
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.color(withHex: 0xcfb074)
        self.addSubview(titleLabel)
        
        lineView = UIView.init(frame: CGRect(x: 0, y: 0, width: 24, height: 4))
        lineView.backgroundColor = titleLabel.textColor
        self.addSubview(lineView)
    }
    
    override func setObject(_ obj: JQTableListSectionItem) {
        super.setObject(obj)
        
        if let obj = obj as? JQCourseDetailSectionItem {
            titleLabel.text = obj.title
        }
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let obj = self.item as? JQCourseDetailSectionItem {
            var titleFrame = self.titleLabel.frame
            titleFrame.origin.x = 20
            self.titleLabel.frame = titleFrame
            self.titleLabel.center.y = obj.height/2
            
            var lineFrame = self.lineView.frame
            lineFrame.origin.y = self.titleLabel.frame.size.height + self.titleLabel.frame.origin.y + 7
            self.lineView.frame = lineFrame
            self.lineView.center.x = self.titleLabel.center.x
        }
    }
}
