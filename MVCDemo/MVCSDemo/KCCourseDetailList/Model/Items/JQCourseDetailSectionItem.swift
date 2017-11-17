//
//  JQCourseDetailSectionItem.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/16.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit

class JQCourseDetailSectionItem: JQTableListSectionItem {
    var title: String?
    
    override func viewType() -> JQTableSectionView.Type{
        return JQCourseDetailSectionView.self
    }
}
