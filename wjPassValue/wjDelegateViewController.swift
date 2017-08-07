//
//  wjDelegateViewController.swift
//  wjPassValue
//
//  Created by jerry on 2017/8/4.
//  Copyright © 2017年 wangjun. All rights reserved.
//

import UIKit

protocol wjSecondDelegate {
    func wjTextFiledPassTextToLabel(_ text : String)
}


class wjDelegateViewController: UIViewController {

    var textField : UITextField!
    var delegate : wjSecondDelegate?
    
    
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


extension wjDelegateViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        print(self.textField.text ?? "并没有输入任何文字")
        self.delegate?.wjTextFiledPassTextToLabel(self.textField.text ?? "并没有输入任何文字")
        self.dismiss(animated: true, completion: nil)
    }
}
