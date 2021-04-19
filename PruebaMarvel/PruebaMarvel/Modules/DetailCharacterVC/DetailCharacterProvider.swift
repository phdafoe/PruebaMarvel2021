//
//  DetailCharacterProvider.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/4/21.
//

import Foundation

protocol DetailCharacterProviderProtocol: class {
    func fetchDetailCharacter(completionSuccess: @escaping (DetailComicModel?) -> (), failure: @escaping(CustomErrorModel?) -> ())
    func fetchDetailSeries(completionSuccess: @escaping (DetailSeriesModel?) -> (), failure: @escaping(CustomErrorModel?) -> ())
}


class DetailCharacterProvider: NativeManager, DetailCharacterProviderProtocol {
    
    internal func fetchDetailCharacter(completionSuccess: @escaping (DetailComicModel?) -> (), failure: @escaping(CustomErrorModel?) -> ()) {
        
        _ = self.request(CustomRequest(method: .get,
                                   urlContext: .marvel,
                                   endpoint: URLEndpoint.characters,
                                   headers: ["Referer":"developer.marvel.com"],
                                   params: [ "orderBy": "name",
                                             "limit": "20",
                                             "apikey": Utils.BaseURL().publicApiKey],
                                   acceptType: AcceptResponseType.json,
                                   additionalConfiguration: CustomRequest.AdditionalConfiguration.init(timeout: 15, printLog: true, encrypted: false, authenticated: false)), type: DetailComicModel.self) { [weak self] (result) in
            guard self != nil else { return }
            completionSuccess(result)
        } failure: { (error) in
            failure(error)
        }
    }
    
    
    internal func fetchDetailSeries(completionSuccess: @escaping (DetailSeriesModel?) -> (), failure: @escaping(CustomErrorModel?) -> ()) {
        
        _ = self.request(CustomRequest(method: .get,
                                   urlContext: .marvel,
                                   endpoint: URLEndpoint.characters,
                                   headers: ["Referer":"developer.marvel.com"],
                                   params: [ "orderBy": "name",
                                             "limit": "20",
                                             "apikey": Utils.BaseURL().publicApiKey],
                                   acceptType: AcceptResponseType.json,
                                   additionalConfiguration: CustomRequest.AdditionalConfiguration.init(timeout: 15, printLog: true, encrypted: false, authenticated: false)), type: DetailSeriesModel.self) { [weak self] (result) in
            guard self != nil else { return }
            completionSuccess(result)
        } failure: { (error) in
            failure(error)
        }
    }
    
    
    
}
