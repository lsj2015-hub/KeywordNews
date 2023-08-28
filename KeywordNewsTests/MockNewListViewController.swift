//
//  MockNewListViewController.swift
//  KeywordNewsTests
//
//  Created by Sean Lee on 2023/08/28.
//

import Foundation
@testable import KeywordNews

final class MockNewListViewController: NewsListProtocol {
  var isCalledSetupNavigationBar = false
  var isCalledSetupLayout = false
  var isCalledEndRefreshing = false
  var isCalledMoveToNewsWebViewController = false
  var isCalledReloadTableView = false
  
  func setupNavigationBar() {
    isCalledSetupNavigationBar = true
  }
  
  func setupLayout() {
    isCalledSetupLayout = true
  }
  
  func endRefreshing() {
    isCalledEndRefreshing = true
  }
  
  func moveToNewsWebViewController(with news: KeywordNews.News) {
    isCalledMoveToNewsWebViewController = true
  }
  
  func reloadTableView() {
    isCalledReloadTableView = true
  }
}

