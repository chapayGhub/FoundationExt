//
//  Array.ext.swift
//  FoundationExt
//
//  Created by chapayGhub on 12/24/17.
//

import Foundation

extension Array {
  public subscript (safe index: Int) -> Element? {
    return (index < 0 || count <= index) ? nil : self[index]
  }
}

extension Array where Element : Equatable {
  public mutating func delete(_ object: Element) {
    let _ = index { object == $0 }.flatMap{ self.remove(at: $0) }
  }
  
  public mutating func deleteAll(_ object: Element) {
    indexes(object).reversed().forEach{ self.remove(at: $0) }
  }
  
  public func indexes(_ object: Element) -> [Int] {
    var indexes = [Int] ()
    for (index, element) in enumerated() {
      if element == object {
        indexes.append(index)
      }
    }
    return indexes
  }
}
