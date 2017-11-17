//
//  JQNetworkService.swift
//  MVCDemo
//
//  Created by 李佳琪 on 2017/11/14.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class JQNetworkService: NSObject {
    
    open func request<T: Mappable>(parameters : [String:Any]? = nil, urlStr : String? = "",
                        completionHandler: @escaping (T) -> Void,
                        errorHandler: @escaping (_ error:NSError)->Void) -> Void{
    
        
        let request = JQNetRequest(.get, url:urlStr!)
        //request.addParams(params: parameters)
        
        request.responseResult(completionHandler: { (response:T) in
            completionHandler(response)
        }) { (error) in
            errorHandler(error)
        }
    }
    
}
