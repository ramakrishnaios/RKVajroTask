//
//  Model.swift
//  RKVajroTask
//
//  Created by ramakrishna utti on 01/07/20.
//  Copyright © 2020 ramakrishnautti. All rights reserved.
//

import Foundation
struct ArticlesList : Codable{
    var articles : [articles]?
}
struct articles : Codable{
    var id : Int?
    var title : String?
    var created_at : String?
    var body_html : String?
    var blog_id : Int?
    var author : String?
    var user_id : Int?
    var published_at : String?
    var updated_at : String?
    var summary_html : String?
    var template_suffix : String?
    var handle : String?
    var tags : String?
    var admin_graphql_api_id : String?
    var image : image?
}
struct image : Codable {
    var created_at : String?
    var alt : String?
    var width : Int?
    var height : Int?
    var src : String?
}
