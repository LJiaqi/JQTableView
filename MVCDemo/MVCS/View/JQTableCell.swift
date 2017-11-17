//
//  JQTableCell.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQTableCell: JQTableListCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews() {
        self.selectionStyle = .none
    }
    
    func addLabel() -> UILabel {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.init(red: 149/255.0, green: 149/255.0, blue: 148/255.0, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        
        return label
    }
    
    func addProgressView() -> UIProgressView {
        let progress = UIProgressView.init()
        progress.progressTintColor = UIColor.init(red: 207/255.0, green: 176/255.0, blue: 116/255.0, alpha: 1.0)
        progress.trackTintColor = UIColor.init(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        return progress
    }

    func addImageView() -> UIImageView {
        let imageView = UIImageView.init()
        return imageView
    }
}
