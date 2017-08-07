//
//  wjSingleTon.swift
//  wjPassValue
//
//  Created by jerry on 2017/8/4.
//  Copyright © 2017年 wangjun. All rights reserved.
//

import UIKit


// MARK:- 单例类
final class wjSingleTon: NSObject {
    static let sharedInstance = wjSingleTon()
    var text : String!
    
    override init() {}
}
