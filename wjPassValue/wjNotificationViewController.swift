//
//  wjNotificationViewController.swift
//  wjPassValue
//
//  Created by jerry on 2017/8/4.
//  Copyright © 2017年 wangjun. All rights reserved.
//

import UIKit

class wjNotificationViewController: UIViewController {

    var label : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 100, height: 30))
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.cyan
        self.view.addSubview(label)
        self.label = label
        
        // 1.注册通知
        let wjNotificationName = Notification.Name.init(rawValue: "notificationTest")
        NotificationCenter.default.addObserver(self, selector: #selector(receiverNotification(_:)), name: wjNotificationName, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    // 移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension wjNotificationViewController {
    func receiverNotification(_ notification : Notification) {
        let dict = notification.userInfo as! [String : String]
        self.label.text = dict["text"]
    }
    
}


extension wjNotificationViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}
