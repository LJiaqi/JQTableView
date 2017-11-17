//
//  JQCouseDetailHeaderView.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQCouseDetailHeaderView: UIView {

    var titleLabel :UILabel!
    fileprivate var _title : String?
    var title :String? {
        set{
            _title = newValue
            self.titleLabel.text = _title
        }
        get{
            return _title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews() {
        self.backgroundColor = UIColor.white
        self.titleLabel = UILabel.init(frame: CGRect(x: 20, y: 11, width: self.frame.size.width, height: 22))
        self.titleLabel.textAlignment = .left
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(self.titleLabel)
    }

}
