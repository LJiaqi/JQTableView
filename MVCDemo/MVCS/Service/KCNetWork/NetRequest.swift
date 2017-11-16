//
//  ShrimpRequest.swift
//  ShrimpHttp
//
//  Created by Rafael on 12/28/15.
//  Copyright © 2015 Rafael. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

open class NetRequest:NSObject {

    //MARK: - property
    fileprivate var url:String!
    fileprivate var method:HTTPMethod = .get
    fileprivate var params:Parameters = Parameters()
    fileprivate var headers:HTTPHeaders = HTTPHeaders()
    fileprivate var encoding:ParameterEncoding = URLEncoding.default

    //MARK: - init
    convenience init(
        _ method: HTTPMethod,
        url: String,
        params: [String: Any]? = nil,
        headers: [String: String]? = nil,
        encoding:ParameterEncoding = URLEncoding.default) {
        
        self.init()
        
        build(method, url: url, params: params, headers: headers, encoding: encoding)
        
        
    }
    
    
    //MARK: - Build
    func request(
                _ method: HTTPMethod,
                url: String,
                params: [String: Any]? = nil,
                headers: [String: String]? = nil,
                encoding:ParameterEncoding = URLEncoding.default)
        -> Self
    {
        
        
        return build(method, url: url, params: params, headers: headers, encoding: encoding)
        
    }
    
    func build(_ method:HTTPMethod,
                           url:String,
                           params: [String: Any]? = nil,
                           headers: [String: String]? = nil,
                           encoding:ParameterEncoding = URLEncoding.default)->Self{
        
        buildURL(url: url)
        buildMethod(method: method)
        buildParams(params: params)
        buildHeader(headers: headers)
        buildEncoding(encoding: encoding)
        
        return self
    }
    
    fileprivate func buildURL(url:String){
        self.url = url
    
    }
    
    fileprivate func buildParams(params:[String: Any]? = nil){
    
        self.params = defaultParams()
        addParams(params: params)
    }
    
    func defaultParams()->Parameters{
        return Parameters()
    }
    
    func addParams(params:[String: Any]? = nil){
        
        if params != nil {
            for (key,value) in params! {
                self.addParam(key: key, value: value)
            }
        }
    }
    
    func addParam(key:String,value:Any){
        self.params[key] = value
    }
    
    func getParams() -> Parameters{
        return params
    }
    
    fileprivate func buildHeader(headers: [String: String]? = nil) {
        
        if headers != nil {
            for (key,value) in headers! {
                self.headers[key] = value
            }
        }
    }
    
    func addHeaders(headers:[String: String]? = nil){
        
        if headers != nil {
            for (key,value) in headers! {
                self.addHeader(key: key, value: value)
            }
        }
    }
    
    func addHeader(key:String,value:String){
        self.headers[key] = value
    }
    
    
    fileprivate func buildMethod(method:HTTPMethod){
        self.method = method
    }
    
    fileprivate func buildEncoding(encoding:ParameterEncoding){
        self.encoding = encoding
    }

    //MARK: - ObjectMapper Response
    func responseObject<T: BaseMappable>(queue: DispatchQueue? = nil,
                               keyPath: String? = nil,
                               mapToObject object: T? = nil,
                               completionHandler: @escaping (DataResponse<T>) -> Void) {
   
        Alamofire.request(url, method: method, parameters: params, encoding: encoding , headers: headers)
            .responseObject(queue: queue, keyPath: keyPath, mapToObject: object) { (dataResponse:DataResponse<T>) in
            completionHandler(dataResponse)
        }
        
    }
    
    public func responseArray<T: BaseMappable>(queue: DispatchQueue? = nil,
                              keyPath: String? = nil,
                              completionHandler: @escaping (DataResponse<[T]>) -> Void) {
        
        Alamofire.request(url, method: method, parameters: params, encoding: encoding , headers: headers)
            .responseArray(queue: queue, keyPath: keyPath) { (dataResponse:DataResponse<[T]>) in
            completionHandler(dataResponse)
        }

    }
    
}


//MARK: - httpStatusCode and noNetwork
extension NetRequest{
    
    //MARK: - ObjectMapper Result
    func responseResult<T: Mappable>(queue: DispatchQueue? = nil,
                        keyPath: String? = nil,
                        mapToObject object: T? = nil,
                        completionHandler: @escaping (T) -> Void,
                        errorHandler: @escaping (_ error:NSError)->Void) -> Void {
        
        responseObject(queue: queue, keyPath: keyPath, mapToObject: object) { (response:DataResponse<T>) in
            
            switch response.result{
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                //无网络
                if let error = error as? NSError {
                    if let e = error.userInfo[NSUnderlyingErrorKey] as? NSError {
                        errorHandler(e)
                    }
                }
                
            }

        }
        
    }

}
