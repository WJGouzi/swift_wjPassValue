//
//  wjPropertyViewController.swift
//  wjPassValue
//
//  Created by jerry on 2017/8/4.
//  Copyright © 2017年 wangjun. All rights reserved.
//

import UIKit

class wjPropertyViewController: UIViewController {

    var passValue : String?    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 100, height: 30))
        label.backgroundColor = UIColor.cyan
        self.view.addSubview(label)
        
        if let value = passValue {
            label.text = value
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
