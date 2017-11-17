//
//  JQNetRequest.swift
//  KaoChong
//
//  Created by kai zhou on 22/02/2017.
//  Copyright © 2017 com.KaoChong. All rights reserved.
//

import Foundation
import Alamofire

@objc class JQNetRequest: NetRequest {
    
    override func defaultParams() -> [String: Any] {
        
        return JQNetRequest.publicRequestParamsDict()
        
    }
    
    class func publicRequestParamsDict()->[String:Any]{
        
        
        
        var params = [String: Any]()
        params["ver"] =  Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        params["ov"] = UIDevice.current.systemVersion
        
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        
        params["sh"] = String.init(format: "%ld", screenHeight*UIScreen.main.scale )
        params["sw"] = String.init(format: "%ld", screenWidth*UIScreen.main.scale )
        params["cl"] = "appstore"
        
        params["apiVer"] = "2"
        params["rosType"] = "ios"
    
        
        return params
    }
    
}
