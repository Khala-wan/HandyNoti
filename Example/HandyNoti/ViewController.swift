//
//  ViewController.swift
//  HandyNoti
//
//  Created by wansheng_ios@sina.com on 04/18/2017.
//  Copyright (c) 2017 wansheng_ios@sina.com. All rights reserved.
//

import UIKit
import HandyNoti

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addHandyObserver(self, selector: #selector(callBack), name: "handy", object: nil)
        NotificationCenter.default.addHandyObserver(self, selector: #selector(callBack), name: "handy", object: nil)
        NotificationCenter.default.addHandyObserver(self, selector: #selector(callBack), name: "handy", object: nil)
        NotificationCenter.default.addHandyObserver(self, selector: #selector(callBack), name: "handy", object: nil)
        NotificationCenter.default.addHandyObserver(self, selector: #selector(callBack), name: "handy", object: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "handy"), object: nil)
    }
    
    var callBackCount:Int = 0
    
    func callBack(){
        callBackCount += 1
        print("第\(callBackCount)次回调")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

