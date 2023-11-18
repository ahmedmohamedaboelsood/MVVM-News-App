//
//  WebServices.swift
//  MVVMNewsApp
//
//  Created by 2B on 29/10/2023.
//

import Foundation

class WebServices {
    
    static var shared = WebServices()
    
    private init(){}
    
    func getNews(url:URL , completion: @escaping (Result<[Article]?,Error>)->Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse{
                print(response.statusCode , response.url
)
                            }
            if let error = error{
                completion(.failure(error))
            }else if let data = data {
                do{
                    let articlesList = try JSONDecoder().decode(ArticlesList.self, from: data)
                    completion(.success(articlesList.articles))
                }catch{
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
