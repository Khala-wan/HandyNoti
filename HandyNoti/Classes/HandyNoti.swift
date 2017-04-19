import Foundation


/// 缓存池
fileprivate var NotiPool:[NSObject:[String:Selector]] = [:]

extension NotificationCenter {
    
    /// 增加Handy观察者
    ///
    /// - Parameters:
    ///   - observer: 观察者
    ///   - aSelector: 回调方法
    ///   - aName: 通知的名字
    ///   - anObject: 回调数据
    open func addHandyObserver(_ observer: NSObject, selector aSelector: Selector, name aName: String, object anObject: Any?){
        
        guard !checkOutNotiPool(observer ,aName, newSel: aSelector) else {
            return
        }
        
        registerNoti(observer, selector: aSelector, name: aName, object: anObject)
    }
    
    
    /// 增加Handy观察者
    ///
    /// - Parameter observer: 观察者
    open func removeHandyObserver(_ observer: NSObject){
        guard NotiPool[observer] != nil else {
            return
        }
        NotiPool.removeValue(forKey: observer)
        NotificationCenter.default.removeObserver(observer)
    }
    
    
    /// 移除观察者
    ///
    /// - Parameters:
    ///   - observer: 观察者
    ///   - aName: 通知名称
    ///   - anObject: 回调数据
    open func removeHandyObserver(_ observer: NSObject, name aName: String, object anObject: Any?){
        guard NotiPool[observer] != nil else {
            return
        }
        guard NotiPool[observer]![aName] != nil else {
            return
        }
        NotiPool[observer]!.removeValue(forKey: aName)
        removeObserver(observer, name: NSNotification.Name(rawValue: aName), object: anObject)
    }
    
    
    /// 校验是否注册了通知
    ///
    /// - Parameters:
    ///   - observer: 观察者
    ///   - name: 通知名字
    /// - Returns: 是否注册
    open func didRegisted(_ observer:NSObject , _ name:String)->Bool{
        guard NotiPool[observer] != nil else {
            return false
        }
        return NotiPool[observer]![name] != nil
    }
    
    
    
    /// 注册通知
    ///
    /// - Parameters:
    ///   - observer: 观察者
    ///   - aSelector: 回调方法
    ///   - aName: 通知名称
    ///   - anObject: 回调数据
    fileprivate final func registerNoti(_ observer: NSObject, selector aSelector: Selector, name aName: String, object anObject: Any?){
        var subPool:[String:Selector] = NotiPool[observer] ?? [:]
        subPool[aName] = aSelector
        NotiPool[observer] = subPool
        self.addObserver(observer, selector: aSelector, name: Notification.Name(rawValue: aName), object: anObject)
    }
    
    
    /// 1.检查缓存池中是否存在该观察者，
    /// 2.该观察者是否已经注册了通知(正常情况下是1的充要条件)
    /// 2.已经监听的通知回调方法和新方法一致？
    ///
    /// - Parameters:
    ///   - observer: 观察者
    ///   - notiName: 通知名称
    ///   - newSel: 新的回调方法
    /// - Returns: 检查结果
    fileprivate final func checkOutNotiPool(_ observer: NSObject , _ notiName:String,newSel:Selector)->Bool{
        
        if let subPool:[String:Selector] = NotiPool[observer] {
            if let sel:Selector = subPool[notiName] {
                return sel == newSel
            }
            return false
        }
        return false
    }
}


