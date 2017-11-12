//
//  JQTableListSectionItem.swift
//  MVCDemo
//
//  Created by lijiaqi on 2017/11/12.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

enum JQSectionType {
    case header
    case footer
}

class JQTableListSectionItem: NSObject {
    
    let type: JQSectionType
    
    var height: CGFloat = 0
    
    init(withType type: JQSectionType) {
        self.type = type
    }
    
    func viewType() -> JQSectionView.Type{
        return JQSectionView.self
    }
    
}
