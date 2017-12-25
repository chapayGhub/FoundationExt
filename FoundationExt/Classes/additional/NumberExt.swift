//
//  NumberExt.swift
//  FoundationExt
//
//  Created by chapayGhub on 12/24/17.
//

import Foundation

extension UnsignedInteger {
  public var grouping: String { return NumberExt.grouping(value: self) }
  public var abbreviature: String { return NumberExt.abbreviature(value: self) }
}

extension SignedInteger {
  public var grouping: String { return NumberExt.grouping(value: self) }
  public var abbreviature: String { return NumberExt.abbreviature(value: self) }
}

public struct NumberExt {
  public static let separatorFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }()
  
  public static func grouping<T>(value: T) -> String where T: UnsignedInteger  { return separatorFormatter.string(from: NSNumber(value: value.asMaxType)) ?? "" }
  
  public static func grouping<T>(value: T) -> String where T: SignedInteger { return separatorFormatter.string(from: NSNumber(value: value.asMaxType)) ?? "" }
  
  public static func abbreviature<T>(value: T) -> String where T: UnsignedInteger {
    guard let doubleValue = Double(exactly: value.asMaxType) else { return  value.description }
    return FoundationExt.abbreviature(from: doubleValue) ?? value.description
  }
  
  public static func abbreviature<T>(value: T) -> String where T: SignedInteger {
    guard let doubleValue = Double(exactly: value.asMaxType) else { return  value.description }
    return FoundationExt.abbreviature(from: doubleValue) ?? value.description
  }
}

extension UnsignedInteger {
  public var asMaxType: CUnsignedLongLong { return CUnsignedLongLong(self) }
}

extension SignedInteger {
  public var asMaxType: CLongLong { return CLongLong(self) }
}

private func abbreviature(from target: Double) -> String? {
  let abbrev = "KMBTPE"
  let sign = target >= 0 ? "" : "-"
  let value = abs(target)
  return abbrev.enumerated()
    .reversed()
    .reduce(nil as String?) { accum, tuple in
      let factor = value / pow(10, Double(tuple.0 + 1) * 3)
      let format = sign + (factor - floor(factor) == 0 ? "%.0f%@" : "%.1f%@")
      return accum ?? (factor >= 1 ? String(format: format, factor, String(tuple.1)) : nil)
  }
}
