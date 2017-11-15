//
//  KCNetworkService.swift
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

class KCNetworkService: NSObject {
    
    open func request<T: Mappable>(parameters : [String:Any]? = nil, urlStr : String? = "",
                        completionHandler: @escaping (T) -> Void,
                        errorHandler: @escaping (_ error:NSError)->Void) -> Void{
       
        let urlStr1 = "https://mobileviptest.kaochong.com/api/mycourse/class/detail?apiVer=2&ca=%E6%9C%AA%E7%9F%A5%E8%BF%90%E8%90%A5%E5%95%86&cl=appstore&classId=793&duid=CDB7DA2A85EA64DC8B7B350422786153C9B5465F4D1FC63D5DDC270C01F420C3256DFE8FDEC58316BFAFF740F00DEF27&dv=iPhoneSimulator&nt=wifi&odv=x86_64&ov=11.1&rosType=ios&sh=1334&sw=750&token=A87E52EEE124B0C571D4D782DF768C14C2D0EDC25C0BD2D4E7021031532BE4AD&ver=1.0.0"
        
        let request = KCNetRequest(.get, url:urlStr1)
        //request.addParams(params: parameters)
        
        request.responseResult(completionHandler: { (response:T) in
            completionHandler(response)
        }) { (error) in
            errorHandler(error)
        }
    }
    
}
