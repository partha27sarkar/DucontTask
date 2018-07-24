//
//  NYTimeModel.swift
//  ParthaSarkarAssignment
//
//  Created by Partha Sarkar on 24/07/18.
//  Copyright © 2018 Partha Sarkar. All rights reserved.
//

import Foundation

struct Response:Codable {
    var results:[NYTimeModel]? = nil
    enum CodingKeys:String,CodingKey
    {
        case results = "results"
    }
}

struct NYTimeModel:Codable {
    var byline:String? = nil
    var title:String? = nil
    var abstract:String? = nil
    var published_date:String? = nil
    var type:String? = nil
}
