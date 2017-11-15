//
//  UIColorExtension.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/15.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    public class func color(withHex hexColor:Int, alpha: CGFloat = 1) -> UIColor {
        let red = CGFloat( (hexColor & 0xFF0000) >> 16 ) / 255.0;
        let green = CGFloat( (hexColor & 0xFF00) >> 8 ) / 255.0;
        let blue = CGFloat( (hexColor & 0xFF) ) / 255.0;
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha);
    }
}
