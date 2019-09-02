//
//  PostService.swift
//  NetworkLayer
//
//  Created by Bruno Silva on 16/11/2018.
//

import Foundation

enum SuggestService: ServiceProtocol {
    
    case suggest(query: String)
    case details(locationId: String)
    
    var path: String {
        switch self {
        case .suggest:
            return "suggest.json"
        case .details:
            return "geocode.json"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case let .suggest(query):
            let parameters = ["query": query]
            return .requestParameters(parameters)
        case let .details(locationId):
            let parameters = ["locationid": locationId]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
