//
//  ArticlesList.swift
//  MVVMNewsApp
//
//  Created by 2B on 05/11/2023.
//

import Foundation

struct ArticlesList : Decodable{
    let articles : [Article]
}

struct Article : Decodable {
    let title : String
    let description : String?
}
