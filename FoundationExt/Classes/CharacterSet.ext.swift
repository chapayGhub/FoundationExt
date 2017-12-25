//
//  CharacterSet.ext.swift
//  FoundationExt
//
//  Created by chapayGhub on 12/24/17.
//

import Foundation

extension CharacterSet {
  
  public static var spaceCharacterSet: CharacterSet = {
    let set = NSMutableCharacterSet(charactersIn: "\u{00a0}")
    set.formUnion(with: CharacterSet.whitespacesAndNewlines)
    return set as CharacterSet
  }()
  
}
