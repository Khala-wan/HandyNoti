import Foundation

fileprivate var NotiPool:[NSObject:[String:Selector]] = [:]

extension NotificationCenter {
    
    open func addHandyObserver(_ observer: NSObject, selector aSelector: Selector, name aName: String, object anObject: Any?){
        
        guard checkOutNotiPool(observer ,aName, newSel: aSelector) else {
            return
        }
        registerNoti(observer, selector: aSelector, name: aName, object: anObject)
    }
    
    open func removeHandyObserver(_ observer: NSObject){
        NotiPool.removeValue(forKey: observer)
    }
    
    open func removeHandyObserver(_ observer: NSObject, name aName: String, object anObject: Any?){
        guard NotiPool[observer] != nil else {
            return
        }
        guard NotiPool[observer]![aName] != nil else {
            return
        }
        NotiPool[observer]!.removeValue(forKey: aName)
        self.removeObserver(observer, name: NSNotification.Name(rawValue: aName), object: anObject)
    }
    
    open func didRegisted(_ observer:NSObject , _ name:String)->Bool{
        guard NotiPool[observer] != nil else {
            return false
        }
        return NotiPool[observer]![name] != nil
    }
    
    
    
    fileprivate final func registerNoti(_ observer: NSObject, selector aSelector: Selector, name aName: String, object anObject: Any?){
        var subPool:[String:Selector] = NotiPool[observer] ?? [:]
        subPool[aName] = aSelector
        NotiPool[observer] = subPool
        self.addObserver(observer, selector: aSelector, name: Notification.Name(rawValue: aName), object: anObject)
    }
    
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


