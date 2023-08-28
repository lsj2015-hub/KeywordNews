//
//  MockNewsSearchManager.swift
//  KeywordNewsTests
//
//  Created by Sean Lee on 2023/08/28.
//

import Foundation
@testable import KeywordNews

final class MockNewsSearchManager: NewsSearchManagerProtocol {
  var error: Error?
  var isCalledrequest = false
  
  func request(
    from keyword: String,
    start: Int, display: Int,
    completionHandler: @escaping ([KeywordNews.News]) -> Void
  ) {
    isCalledrequest = true
    
    if error == nil {
      completionHandler([])
    }
  }
}

