//
//  AFWrapper.swift
//  Alamofire+Codeble_demo
//
//  Created by takuyaOhmuro on 2018/08/30.
//  Copyright © 2018年 takuyaOhmuro. All rights reserved.
//

import UIKit
import Alamofire

class AFWrapper:NSObject {
    class func requestGETURL(_ strURL:String,sucess:@escaping([String:Any]) -> Void,filure:@escaping(Error) -> Void) {
        Alamofire.request(strURL).responseJSON{ (responseObject) -> Void in
            print(responseObject)
            
            if responseObject.result.isSuccess {
                sucess(responseObject.result.value! as! [String:Any])
            }
            if responseObject.result.isFailure {
                let error :Error = responseObject.result.error!
                print(error)
            }
        }
    }
}
