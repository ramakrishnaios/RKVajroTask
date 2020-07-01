//
//  ModelView.swift
//  RKVajroTask
//
//  Created by ramakrishna utti on 30/06/20.
//  Copyright © 2020 ramakrishnautti. All rights reserved.
//

import Foundation
class ViewModel{
   class func getArticles(completion:@escaping (ArticlesList?,Error?) -> Void){
    APIHandler.shared.getAPI(url: "fetch_shopify_article?appid=14382&blog_handle=news", returnType: ArticlesList.self) { (response) in
            switch response{
            case .success(let article):
//                print(article)
                completion(article,nil)
            case .failure(let error):
                print(error)
                completion(nil,error)
            }
        }
    }
}
