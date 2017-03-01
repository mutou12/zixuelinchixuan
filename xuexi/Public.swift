//
//  Public.swift
//  xuexi
//
//  Created by 赫凯 on 2017/2/28.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit

let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

let serverUrl = "https://proxy.linchixuan.com"

let smsappKey = "1a21efadac96b"
let smsappSecret = "566aa52f28ec37d1edda276922626881"

let UmengAppkey = "583fdd7df5ade4536900072e"

let WXAppkey = "wx71f09405bb53606d"
let WxAppSecret = "be11135439884313baf6a0ba43c0e7bc"
let QQId = "1105859060"
let QQKey = "SAFBuaifvqQrN9Bd"

let nsAppId = "1181796879"


extension UIView {
    
    func x () -> Float
    {
        return Float(self.frame.origin.x)
    }
    
    func y () -> Float
    {
        return Float(self.frame.origin.y)
    }
    
    func w () -> Float
    {
        return Float(self.frame.width)
    }
    
    func h () -> Float
    {
        return Float(self.frame.height)
    }
    
    func xw () -> Float
    {
        return self.x() + self.w()
    }
    
    func yh () -> Float
    {
        return self.y() + self.h()
    }
    
    
}

class Public: NSObject {
 
}


