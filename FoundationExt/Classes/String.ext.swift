//
//  String.ext.swift
//  FoundationExt
//
//  Created by chapayGhub on 12/24/17.
//

import Foundation

extension String {
  
  public var asUrl: URL? { return URL(string: self) }
  
  public var webUrl: URL? { return asUrl.flatMap { $0.isWeb ? $0 : nil  } }
  
  public var fileUrl: URL? { return asUrl.flatMap { $0.isFileURL ? $0 : nil } }
  
  public var urls: [URL] {
    var urls = [URL] ()
    if let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) {
      let nsstring = self as NSString
      let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
      matches.forEach{
        (nsstring.substring(with: $0.range) as String).asUrl.flatMap{ urls.append($0) }
      }
    }
    return urls
  }
  
  public var webUrls: [URL] { return urls.flatMap{ $0.isWeb ? $0 : nil } }
  
  public var fileUrls: [URL] { return urls.flatMap{ $0.isFileURL ? $0 : nil } }
  
}

extension String {
  public var trimmed: String { return self.trimmingCharacters(in: .spaceCharacterSet) }
    
  public func capitalizingFirstLetter() -> String {
    return prefix(1).uppercased() + dropFirst()
  }
    
  public mutating func capitalizeFirstLetter() {
    self = self.capitalizingFirstLetter()
  }
}


extension String {
  public var boolValue: Bool? {
    let value = self.lowercased()    
    return
        ["true", "yes", "1"].contains(value) ? true :
        ["false", "no", "0"].contains(value) ? false : nil
  }
  
  public var intValue: Int? { return Int(self, radix: 10) }
  
  public var uintValue: UInt? { return UInt(self, radix: 10) }
  
  public var int64: Int64? { return Int64(self, radix: 10) }
  
  public var doubleValue: Double? { return Double(self) }
  
  public var floatValue: Float? { return Float(self) }
  
}
