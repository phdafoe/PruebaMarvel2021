//
//  ListComicsProvider.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/4/21.
//

import Foundation

protocol ListComicsProviderProtocol: class {
    func fetchListComics(completionSuccess: @escaping (ListComicsModel?) -> (), failure: @escaping(CustomErrorModel?) -> ())
}


class ListComicsProvider: NativeManager, ListComicsProviderProtocol {
    
    internal func fetchListComics(completionSuccess: @escaping (ListComicsModel?) -> (), failure: @escaping(CustomErrorModel?) -> ()) {
        
        _ = self.request(CustomRequest(method: .get,
                                   urlContext: .marvel,
                                   endpoint: URLEndpoint.comics,
                                   headers: ["Referer":"developer.marvel.com"],
                                   params: [ "orderBy": "title",
                                             "limit": "20",
                                             "apikey": Utils.BaseURL().publicApiKey],
                                   acceptType: AcceptResponseType.json,
                                   additionalConfiguration: CustomRequest.AdditionalConfiguration.init(timeout: 15, printLog: true, encrypted: false, authenticated: false)), type: ListComicsModel.self) { [weak self] (result) in
            guard self != nil else { return }
            completionSuccess(result)
        } failure: { (error) in
            failure(error)
        }
    }
    
}
