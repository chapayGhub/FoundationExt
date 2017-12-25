//
//  DispatchQueue.ext.swift
//  FoundationExt
//
//  Created by chapayGhub on 12/25/17.
//

import Foundation

extension DispatchQueue {
  public class var currentName: String? {
    let name = __dispatch_queue_get_label(nil)
    return String(cString: name, encoding: .utf8)
  }
}

//RxSwift/Platform/DispatchQueue+Extensions.swift
extension DispatchQueue {
  private static var mainQueueStamp: DispatchSpecificKey<()> = {
    let stamp = DispatchSpecificKey<()>()
    DispatchQueue.main.setSpecific(key: stamp, value: ())
    return stamp
  }()
  
  public static var isMain: Bool { return DispatchQueue.getSpecific(key: mainQueueStamp) != nil }
  
  public class func mainSync(_ block: (()->(Void))) { return !isMain ? DispatchQueue.main.sync { block() } : block() }
}

extension DispatchQueue {
  public class func lock(_ lockObject: Any, block: (()->(Void))) {
    objc_sync_enter(lockObject)
    defer { objc_sync_exit(lockObject) }
    
    block()
  }
  
  public class func lock<T>(_ lockObject: Any, block: (()->(T))) -> T {
    objc_sync_enter(lockObject)
    defer { objc_sync_exit(lockObject) }
    return block()
  }
}
