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

    @IBOutlet weak var oberserCountLabel: UILabel!
    
    @IBOutlet weak var handyAddBtn: UIButton!
    
    @IBOutlet weak var nativeAddBtn: UIButton!
    
    @IBOutlet weak var removeBtn: UIButton!

    @IBOutlet weak var postBtn: UIButton!
    
//MARK:  -- Getter && Setter

    fileprivate var observerCount:Int = 0{
        didSet{
            self.oberserCountLabel.text = "已监听" + String(observerCount) + "次"
            if observerCount == 0 {
                self.handyAddBtn.isEnabled = true
                self.nativeAddBtn.isEnabled = true
            }
            self.postBtn.isEnabled = observerCount != 0
        }
    }
    
//MARK  -- EventResponse
    
    @IBAction func handyAddBtnClicked(_ sender: Any) {
        nativeAddBtn.isEnabled = false
        observerCount += 1
        NotificationCenter.default.addHandyObserver(self, selector: #selector(callBack), name: "handy", object: nil)
    }
    
    @IBAction func nativeAddBtnClicked(_ sender: Any) {
        handyAddBtn.isEnabled = false
        observerCount += 1
        NotificationCenter.default.addObserver(self, selector: #selector(callBack), name: NSNotification.Name(rawValue: "handy"), object: nil)
    }
    
    @IBAction func removeBtnClicked(_ sender: Any) {
        observerCount = 0
        removeObserver()
    }
    
    @IBAction func postBtnClicked(_ sender: Any) {
        callBackCount = 0
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "handy"), object: nil)
    }

//MARK  -- CallBack
    
    var callBackCount:Int = 0
    
    func callBack(){
        callBackCount += 1
        print("第\(callBackCount)次回调")
    }
    
//MARK:  -- FilePrivateFunction
    fileprivate final func removeObserver(){
        NotificationCenter.default.removeHandyObserver(self)
        NotificationCenter.default.removeObserver(self)
    }
    
//MARK:  -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        removeObserver()
    }

}

