//
//  NewsResponseModel.swift
//  KeywordNews
//
//  Created by Sean Lee on 2023/08/25.
//

import Foundation

struct NewsResponseModel: Decodable {
  var items: [News] = []
}

struct News: Decodable {
  let title: String
  let link: String
  let description: String
  let pubDate: String
}
