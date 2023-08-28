//
//  NewsListPresenter.swift
//  KeywordNews
//
//  Created by Sean Lee on 2023/08/24.
//

import UIKit

protocol NewsListProtocol: AnyObject {
  func setupNavigationBar()
  func setupLayout()
  func endRefreshing()
  func moveToNewsWebViewController(with news: News)
  func reloadTableView()
}

final class NewsListPresenter: NSObject {
  private weak var viewController: NewsListProtocol?
  private let newsSearchManager: NewsSearchManagerProtocol
  
  private var currentKeyword = ""
  // 지금까지 request된, 가지고 있는 보여주고 있는 page
  private var currentPage: Int = 0
  // 한 페이지에 최대 몇 개까지 보여줄 것인지
  private let display: Int = 20
  
  private let tags: [String] = ["IT", "IPhone", "Develop", "Developer", "Game", "Pangyo", "Gangnam", "Startup"]
  
  private var newList: [News] = []
  
  init(
    viewController: NewsListProtocol,
    newsSearchManager: NewsSearchManagerProtocol = NewsSearchManager()
  ) {
    self.viewController = viewController
    self.newsSearchManager = newsSearchManager
  }
  
  func viewDidLoad() {
    viewController?.setupNavigationBar()
    viewController?.setupLayout()
  }
  
  func didCalledRefresh() {
    requestNewsList(isNeededToReset: true)
  }
}

extension NewsListPresenter: NewsListTableViewHeaderViewDelegate {
  func didSelectTag(_ selectedIndex: Int) {
    currentKeyword = tags[selectedIndex]
    requestNewsList(isNeededToReset: true)
  }
}

extension NewsListPresenter: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let news = newList[indexPath.row]
    viewController?.moveToNewsWebViewController(with: news)
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let currentRow = indexPath.row
    
    guard
      (currentRow % 20) == (display - 3) && (currentRow / display) == (currentPage - 1)
    else {
      return
    }
    requestNewsList(isNeededToReset: false)
  }
}

extension NewsListPresenter: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    newList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier, for: indexPath) as? NewsListTableViewCell
    
    let news = newList[indexPath.row]
    cell?.setup(news: news)
    
    return cell ?? UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsListTableViewHeaderView.identifier) as? NewsListTableViewHeaderView
    
    header?.setup(tags: tags, delegate: self)
    
    return header
  }
}

private extension NewsListPresenter {
  func requestNewsList(isNeededToReset: Bool) {
    if isNeededToReset {
      currentPage = 0
      newList = []
    }
    
    newsSearchManager.request(
      from: currentKeyword,
      start: (currentPage * display) + 1,
      display: display
    ) { [weak self] newValue in
        self?.newList += newValue
        self?.currentPage += 1
        self?.viewController?.reloadTableView()
        self?.viewController?.endRefreshing()
      }
  }
}


