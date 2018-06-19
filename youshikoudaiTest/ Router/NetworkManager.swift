//
//  NetworkManager.swift
//  LJSecondhandPlatform
//
//  Created by iOS110 on 2018/6/4.
//  Copyright © 2018年 iOS110. All rights reserved.
//

import Foundation
import Alamofire

let BaseURL = "http://139.196.192.80:28234/fish-web"

private var isReachable: Bool {
    get{
        return NetworkReachabilityManager.init()?.isReachable ?? false
    }
    set{
     }
}

class DLNewWork: NSObject {
    
    class func request(url:String,method:HTTPMethod,parameters:[String:Any]?,succeed:((_ result:Any)->Void)?,failure:((_ error:String)->Void)?){
    
        if !isReachable {
            failure?("当前网络不可用，请监测网络情况后重新打开")
            return
        }
    
        let urlShit = BaseURL + url

        Alamofire.request(urlShit, method:method, parameters:parameters).responseJSON { (response) in
            switch response.result {
            case .success:
                if let jsonValue = response.result.value {
                    print("********************************************\n\(String(describing: response.request?.url))\n\\n\(jsonValue)\n*************************************************")
//                    let json = JSON(jsonValue)
//                    if json["state"].int == 200 {
//                        succeed?(json.dictionaryObject ?? [:])
//                    }else{
//                        failure?(json["message"].stringValue)
//                    }
                }
                break
            case .failure(let error):
                print("\(String(describing: response.request?.url))\(error)")
                failure?(error.localizedDescription)
                break
            }
        }
    }
    

}

