//
//  ListCharactersProvider.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/4/21.
//

import Foundation

protocol ListCharactersProviderProtocol: class {
    func fetchListCharacters(completionSuccess: @escaping (ListCharacteresModel?) -> (), failure: @escaping(CustomErrorModel?) -> ())
}


class ListCharactersProvider: NativeManager, ListCharactersProviderProtocol {
    
    internal func fetchListCharacters(completionSuccess: @escaping (ListCharacteresModel?) -> (), failure: @escaping(CustomErrorModel?) -> ()) {
        
        _ = self.request(CustomRequest(method: .get,
                                   urlContext: .marvel,
                                   endpoint: URLEndpoint.characters,
                                   headers: ["Referer":"developer.marvel.com"],
                                   params: [ "orderBy": "name",
                                             "limit": "20",
                                             "apikey": Utils.BaseURL().publicApiKey],
                                   acceptType: AcceptResponseType.json,
                                   additionalConfiguration: CustomRequest.AdditionalConfiguration.init(timeout: 15, printLog: true, encrypted: false, authenticated: false)), type: ListCharacteresModel.self) { [weak self] (result) in
            guard self != nil else { return }
            completionSuccess(result)
        } failure: { (error) in
            failure(error)
        }
    }
    
}

