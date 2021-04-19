//
//  DetailCharacterProvider.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/4/21.
//

import Foundation

protocol DetailCharacterProviderProtocol: class {
    func fetchDetailCharacter(id: String, completionSuccess: @escaping (DetailComicModel?) -> (), failure: @escaping(CustomErrorModel?) -> ())
    func fetchDetailSeries(id: String, completionSuccess: @escaping (DetailSeriesModel?) -> (), failure: @escaping(CustomErrorModel?) -> ())
}


class DetailCharacterProvider: NativeManager, DetailCharacterProviderProtocol {
    
    internal func fetchDetailCharacter(id: String, completionSuccess: @escaping (DetailComicModel?) -> (), failure: @escaping(CustomErrorModel?) -> ()) {
        
        _ = self.request(CustomRequest(method: .get,
                                   urlContext: .marvel,
                                   endpoint: URLEndpoint.comics,
                                   headers: ["Referer":"developer.marvel.com"],
                                   params: [ "apikey": Utils.BaseURL().publicApiKey],
                                   acceptType: AcceptResponseType.json,
                                   additionalConfiguration: CustomRequest.AdditionalConfiguration.init(timeout: 15, printLog: true, encrypted: false, authenticated: false)), type: DetailComicModel.self) { [weak self] (result) in
            guard self != nil else { return }
            completionSuccess(result)
        } failure: { (error) in
            failure(error)
        }
    }
    
    
    internal func fetchDetailSeries(id: String, completionSuccess: @escaping (DetailSeriesModel?) -> (), failure: @escaping(CustomErrorModel?) -> ()) {
        
        _ = self.request(CustomRequest(method: .get,
                                   urlContext: .marvel,
                                   endpoint: URLEndpoint.series,
                                   headers: ["Referer":"developer.marvel.com"],
                                   params: [ "apikey": Utils.BaseURL().publicApiKey],
                                   additionalConfiguration: CustomRequest.AdditionalConfiguration.init(timeout: 15, printLog: true, encrypted: false, authenticated: false)), type: DetailSeriesModel.self) { [weak self] (result) in
            guard self != nil else { return }
            completionSuccess(result)
        } failure: { (error) in
            failure(error)
        }
    }
    
    
    
}
