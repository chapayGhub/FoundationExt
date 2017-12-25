//
//  URL.ext.swift
//  FoundationExt
//
//  Created by chapayGhub on 12/24/17.
//

import Foundation

extension URL {
  public var isWeb: Bool { return !isFileURL && host != nil }
}

extension URLComponents {
  public init?(string: String, params: [String : CustomStringConvertible]) {
    guard var components = URLComponents(string: string) else {
      return nil
    }
    components.queryItems = params.map { URLQueryItem(name: $0, value: $1.description) }
    self = components
  }
}

extension URL {
  public init?(string : String, params: [String : CustomStringConvertible]) {
    guard
      let components = URLComponents(string: string, params: params),
      let url = components.url
    else
      { return nil }
    
    self.init(string: url.absoluteString)
  }
  
  public var queryItems: [String: String] {
    var params = [String: String]()
    URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems?.forEach{ params[$0.name] = $0.value }
    return params
  }
  
  public func url(with params: [String : CustomStringConvertible]) -> URL? {
    guard let components = URLComponents(string: self.absoluteString, params: params) else { return nil }
    return components.url
  }
}

