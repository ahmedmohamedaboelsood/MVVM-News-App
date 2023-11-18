//
//  ArticlesViewModel.swift
//  MVVMNewsApp
//
//  Created by 2B on 18/11/2023.
//

import Foundation

struct ArticleListViewModel{
    var articlesList : [Article]
}

extension ArticleListViewModel {
    var numberOfRow : Int {
        return articlesList.count
    }
    
    func numberOfSections(_ sections : Int)-> Int {
        return articlesList.count
    }
    
    func articleAtIndex(_ index:Int)->ArticleViewModel{
        let article = self.articlesList[index]
        return ArticleViewModel(article)
    }
}


struct ArticleViewModel {
    var article : Article
}

extension ArticleViewModel {
    init(_ article : Article ){
        self.article = article
    }
}

extension ArticleViewModel {
    var title : String {
        return article.title
    }
    
    var description : String {
        return article.description ?? "N/A"
    }
}
