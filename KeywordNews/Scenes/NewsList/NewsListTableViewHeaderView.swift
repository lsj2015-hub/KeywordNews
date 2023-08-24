//
//  NewsListTableViewHeaderView.swift
//  KeywordNews
//
//  Created by Sean Lee on 2023/08/24.
//

import UIKit
import TTGTags
import SnapKit

final class NewsListTableViewHeaderView: UITableViewHeaderFooterView {
  static let identifier = "NewsListTableViewHeaderView"
  private var tags: [String] = ["IT", "IPhone", "Develop", "Developer", "Game", "Pangyo", "Gangnam", "Startup"]
  private lazy var tagCollectionView = TTGTextTagCollectionView()
  
  func setup() {
    contentView.backgroundColor = .systemBackground
    
    setupTagCollectionViewLayout()
    setupTagCollectionView()
  }
}

private extension NewsListTableViewHeaderView {
  func setupTagCollectionViewLayout() {
    addSubview(tagCollectionView)
    
    tagCollectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func setupTagCollectionView() {
    tagCollectionView.numberOfLines = 1
    tagCollectionView.scrollDirection = .horizontal
    tagCollectionView.showsHorizontalScrollIndicator = false
    tagCollectionView.selectionLimit = 1
    let insetValue: CGFloat = 16.0
    tagCollectionView.contentInset = UIEdgeInsets(
      top: insetValue,
      left: insetValue,
      bottom: insetValue,
      right: insetValue
    )
    let cornerRadiusValue: CGFloat = 12.0
    let shadowOpacityValue: CGFloat = 0.0
    let extraSpacingValue = CGSize(width: 20.0, height: 12.0)
    let color = UIColor.systemOrange
    let style = TTGTextTagStyle()
    style.backgroundColor = color
    style.cornerRadius = cornerRadiusValue
    style.borderWidth = 0
    style.shadowOpacity = shadowOpacityValue
    style.extraSpace = extraSpacingValue
    let selectedStyle = TTGTextTagStyle()
    selectedStyle.backgroundColor = .white
    selectedStyle.cornerRadius = cornerRadiusValue
    selectedStyle.shadowOpacity = shadowOpacityValue
    selectedStyle.extraSpace = extraSpacingValue
    selectedStyle.borderColor = color
    
    tags.forEach { tag in
      let font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
      let tagContents = TTGTextTagStringContent(
        text: tag,
        textFont: font,
        textColor: .white
      )
      let SelectedTagContents = TTGTextTagStringContent(
        text: tag,
        textFont: font,
        textColor: color
      )
      
      let tag = TTGTextTag(
        content: tagContents,
        style: style,
        selectedContent: SelectedTagContents,
        selectedStyle: selectedStyle
      )
      tagCollectionView.addTag(tag)
    }
  }
}
