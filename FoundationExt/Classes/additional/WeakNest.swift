//
//  WeakNest.swift
//  FoundationExt
//
//  Created by chapayGhub on 12/24/17.
//

import Foundation

open class WeakNest<T> {
  
  private weak var obj: AnyObject?
  
  public init(_ object: AnyObject?) { self.obj = object }
  
  public func update(with object: AnyObject?) { self.obj = object }
  
  public func reset() { self.obj = nil }
  
  public var object: T? { return obj as? T}
  
  public var isNil: Bool { return self.object == nil }
}

extension WeakNest where T: Hashable {
  open var hashValue: Int { return self.object?.hashValue ?? Int.min }
  
  open static func == (lhs: WeakNest<T>, rhs: WeakNest<T>) -> Bool {
    guard
      let lhs = lhs.object,
      let rhs = rhs.object
    else 
      { return false }
    
    return lhs == rhs
  }
}
