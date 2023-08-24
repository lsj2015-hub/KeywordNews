//
//  NewsListTableViewCell.swift
//  KeywordNews
//
//  Created by Sean Lee on 2023/08/24.
//

import UIKit
import SnapKit

final class NewsListTableViewCell: UITableViewCell {
  static let identifier = "NewsListTableViewCell"
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15, weight: .semibold)
    
    return label
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14, weight: .medium)
    
    return label
  }()
  
  private lazy var dateLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 12, weight: .medium)
    label.textColor = .secondaryLabel
    
    return label
  }()
  
  func setup() {
    setupLayout()
    
    accessoryType = .disclosureIndicator
    selectionStyle = .none
    
    titleLabel.text = "기사 제목"
    descriptionLabel.text = "기사 내용"
    dateLabel.text = "2023.08.25"
  }
}

private extension NewsListTableViewCell {
  func setupLayout() {
    [titleLabel, descriptionLabel, dateLabel]
      .forEach { addSubview($0) }
    
    let superViewInset: CGFloat = 16.0
    
    titleLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(superViewInset)
      $0.trailing.equalToSuperview().inset(48)
      $0.top.equalToSuperview().inset(superViewInset)
    }
    
    let verticalSpacing: CGFloat = 4.0
    
    descriptionLabel.snp.makeConstraints {
      $0.leading.equalTo(titleLabel.snp.leading)
      $0.trailing.equalTo(titleLabel.snp.trailing)
      $0.top.equalTo(titleLabel.snp.bottom).offset(verticalSpacing)
    }
    
    dateLabel.snp.makeConstraints {
      $0.leading.equalTo(titleLabel.snp.leading)
      $0.trailing.equalTo(titleLabel.snp.trailing)
      $0.top.equalTo(descriptionLabel.snp.bottom).offset(verticalSpacing)
      $0.bottom.equalToSuperview().inset(superViewInset)
    }
  }
}

