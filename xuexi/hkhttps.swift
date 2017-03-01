//
//  HKhttps.swift
//  xuexi
//
//  Created by 赫凯 on 2017/2/28.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class hkhttps: NSObject {
    static let share = hkhttps();
    
    func getRequest(urlstr:String,params:[String:Any],finished:@escaping(_ resposen:[String:AnyObject]?,_ error:NSError?)->()){
        Alamofire.request(urlstr, method: .get, parameters: params)
            .responseJSON { (response) in
                
                switch response.result {
                case .success(let value):
                    print("Value:\(value)")
                    print("------")
                    let swiftyJsonVar = JSON(value)
                    if swiftyJsonVar["dat"]["status"] == 1
                    {
                        finished(response.result.value as? [String : AnyObject],nil)
                    }
                    else
                    {
                        finished(nil,response.result.error as NSError?)
                    }
                    
                    
                    print(swiftyJsonVar)
                case .failure:
                    finished(nil,response.result.error as NSError?)
                }
                
                
                
                
                if response.result.isSuccess{
                    
                    finished(response.result.value as? [String : AnyObject],nil)
                }else{
                    
                    finished(nil,response.result.error as NSError?)
                    
                }
        }
    }
    
    func postRequest(urlString: String, params : [String : Any], finished : @escaping (_ response : [String : AnyObject]?,_ error: NSError?)->()) {
        
        
        Alamofire.request(urlString, method: .post, parameters: params)
            .responseJSON { (response) in
                
                if response.result.isSuccess{
                    
                    finished(response.result.value as? [String : AnyObject],nil)
                }else{
                    
                    finished(nil,response.result.error as NSError?)
                    
                }
        }
    }


}


