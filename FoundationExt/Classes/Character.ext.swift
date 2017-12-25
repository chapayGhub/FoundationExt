//
//  Character.ext.swift
//  FoundationExt
//
//  Created by chapayGhub on 12/24/17.
//

import Foundation

extension Character {
  public var asciiCode: UInt32 { get { return unicodeScalars[unicodeScalars.startIndex].value } }
}
