//
//  String+.swift
//  KeywordNews
//
//  Created by Sean Lee on 2023/08/25.
//

import Foundation

extension String {
  var htmlToString: String {
    guard let data = self.data(using: .utf8) else { return "" }
    
    do {
      return try NSAttributedString(
        data: data,
        options: [.documentType: NSAttributedString.DocumentType.html,
                  .characterEncoding: String.Encoding.utf8.rawValue],
        documentAttributes: nil
      ).string
    } catch {
      return ""
    }
  }
}
