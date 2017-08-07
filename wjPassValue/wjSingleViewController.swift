//
//  wjSingleViewController.swift
//  wjPassValue
//
//  Created by jerry on 2017/8/4.
//  Copyright © 2017年 wangjun. All rights reserved.
//

import UIKit

class wjSingleViewController: UIViewController {
    var textField : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let tf = UITextField()
        tf.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        tf.borderStyle = .roundedRect
        tf.placeholder = "请输入文字"
        self.view.addSubview(tf)
        self.textField = tf
        
    }
}

extension wjSingleViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let single = wjSingleTon.sharedInstance
        single.text = self.textField.text
        self.dismiss(animated: true, completion: nil)
    }
}
