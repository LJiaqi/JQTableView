//
//  KCTableDemoHeaderView.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class KCTableDemoHeaderView: UIView {

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
        self.titleLabel.textColor = UIColor.black//UIColor.init(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(self.titleLabel)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
