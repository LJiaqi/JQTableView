//
//  JQSectionHeaderView.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQSectionHeaderView: JQSectionView {
    var titleLabel: UILabel!
    
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
        self.backgroundColor = .blue
        titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 12, y: 0, width: 100, height: 35)
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = .red
        self.addSubview(titleLabel)
    }

    override func setObject(_ obj: JQTableListSectionItem) {
        super.setObject(obj)
        
        if let obj = obj as? JQDemoSectionHeaderItem {
            titleLabel.text = obj.title
        }
    }

}
