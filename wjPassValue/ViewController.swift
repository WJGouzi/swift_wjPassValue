//
//  ViewController.swift
//  wjPassValue
//
//  Created by jerry on 2017/8/4.
//  Copyright © 2017年 wangjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView : UITableView!
    lazy var datas : Array<String>! = {
        let arr = NSArray(contentsOfFile: Bundle.main.path(forResource: "passValueCatagory", ofType: "plist")!)
        return arr as! Array
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.wjUISetUp()
    }
    
    func wjUISetUp() {
        self.view.backgroundColor = UIColor.white
        let rect = CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: self.view.frame.size.height - 20)
        let tableView = UITableView(frame: rect, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView = tableView
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // 单例传值
        let singleTon = wjSingleTon.sharedInstance
        let cell = self.tableView.cellForRow(at: IndexPath(row: 3, section: 0))
        cell?.detailTextLabel?.text = singleTon.text
    }

    
    
}



extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let iden = "passValueCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: iden)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: iden)
        }
        cell?.textLabel?.text = self.datas[indexPath.row]
        return cell!
    }
    
}


extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0: // 属性传值
            let propertyVC = wjPropertyViewController()
            propertyVC.passValue = tableView.cellForRow(at: indexPath)?.textLabel?.text
            self.present(propertyVC, animated: true, completion: nil)
            break
        case 1: // 代理传值
            let wjDelegatVC = wjDelegateViewController()
            wjDelegatVC.delegate = self
            self.present(wjDelegatVC, animated: true, completion: nil)
            break
        case 2: // 闭包传值
            let wjBlcokVC = wjBlockViewController()
            wjBlcokVC.wjBlock = { (text) in
                let cell = tableView.cellForRow(at: indexPath)
                cell?.detailTextLabel?.text = text
            }
            self.present(wjBlcokVC, animated: true, completion: nil)
            break
        case 3: // 单例传值
            let singleTon = wjSingleViewController()
            self.present(singleTon, animated: true, completion: nil)
            break
        case 4: // 通知传值
            let notificationVC = wjNotificationViewController()
            self.wjNotificationPassValue()
            self.present(notificationVC, animated: true, completion: nil)
            break
        default:
            break
        }
        
    }
}


// MARK:- delegate
extension ViewController : wjSecondDelegate {
    func wjTextFiledPassTextToLabel(_ text: String) {
        let cell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0))
        cell?.detailTextLabel?.text = text
    }
}


// MARK:- 通知传值
extension ViewController {
    func wjNotificationPassValue() {
        print("发送通知")
        // 2.发送通知
        // 通知接收的线程是基于通知发送的线程。如果接收不到通知方发送的消息，很有可能是因为它们不在同一个线程上。因此，我们可以把通知的发送方放到和接收方同一个线程中。
        // 发送通知时做如下操作，解决了push/present时发送通知接收不到的情况。
        OperationQueue.main.addOperation {
            let cell = self.tableView.cellForRow(at: IndexPath(row: 4, section: 0))
            let wjNotificationName = Notification.Name.init(rawValue: "notificationTest")
            NotificationCenter.default.post(name: wjNotificationName, object: self, userInfo: ["text" : cell?.textLabel?.text ?? "没有值传入"])
        }
        
        print("通知发送完毕")
    }
    
}

