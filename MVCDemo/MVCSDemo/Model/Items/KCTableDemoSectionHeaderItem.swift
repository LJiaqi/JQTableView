//
//  KCTableDemoSectionItem.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class KCTableDemoSectionHeaderItem: JQTableListSectionItem {
    
    var title: String?
    
    override func viewType() -> JQSectionView.Type{
        return KCTableDemoSectionHeaderView.self
    }
}
