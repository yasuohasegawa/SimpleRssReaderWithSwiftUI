//
//  regex.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/06.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import Foundation

extension String {
  func match(pattern:String) -> Bool {
    let regex = try! NSRegularExpression(pattern:pattern)
    return regex.firstMatch(in:self, range:NSRange(self.startIndex..., in:self)) != nil
  }

  func extractAll(pattern:String) -> [String] {
    let regex = try! NSRegularExpression(pattern:pattern)
    return regex.matches(in:self, range:NSRange(self.startIndex..., in:self)).map { String(self[Range($0.range, in:self)!]) }
  }

  func replaceAll(pattern:String, to:String) -> String {
    return self.replacingOccurrences(of:pattern, with:to, options:NSString.CompareOptions.regularExpression, range:self.range(of:self))
  }
}
