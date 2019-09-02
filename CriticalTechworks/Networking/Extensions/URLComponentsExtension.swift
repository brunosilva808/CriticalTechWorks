//
//  URLComponentsExtension.swift
//  NetworkLayer
//
//  Created by Bruno Silva on 16/11/2018.
//

import Foundation

extension URLComponents {
    
    init(service: ServiceProtocol) {
        let url = service.baseURL.appendingPathComponent(service.path)
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .url else { return }
        
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
        
        let urlQueryItems = [URLQueryItem(name: "app_id", value: "Ptxu9U8a7K3tpSMEichi"),
                             URLQueryItem(name: "app_code", value: "Em5r0EUO0emafprWaJ5OEg")]
        queryItems?.append(contentsOf: urlQueryItems)
    }
}
