// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listComicsModel = try? newJSONDecoder().decode(ListComicsModel.self, from: jsonData)

import Foundation

// MARK: - ListComicsModel
struct ListComicsModel: Decodable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: DataClassComics?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case status = "status"
        case copyright = "copyright"
        case attributionText = "attributionText"
        case attributionHTML = "attributionHTML"
        case etag = "etag"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClassComics: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [ResultComics]?

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct ResultComics: Decodable {
    let id: Int?
    let digitalId: Int?
    let title: String?
    let issueNumber: Int?
    let variantDescription: String?
    let resultDescription: String?
    let modified: String?
    let isbn: String?
    let upc: String?
    let diamondCode: String?
    let ean: String?
    let issn: String?
    let format: String?
    let pageCount: Int?
    let textObjects: [TextObject]?
    let resourceURI: String?
    let urls: [URLElement]?
    let series: Series?
    let variants: [Series]?
    let collections: [JSONAny]?
    let collectedIssues: [Series]?
    let dates: [DateElement]?
    let prices: [Price]?
    let thumbnail: Thumbnail?
    let images: [Thumbnail]?
    let creators: Creators?
    let characters: Characters?
    let stories: Stories?
    let events: Events?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case digitalId = "digitalId"
        case title = "title"
        case issueNumber = "issueNumber"
        case variantDescription = "variantDescription"
        case resultDescription = "description"
        case modified = "modified"
        case isbn = "isbn"
        case upc = "upc"
        case diamondCode = "diamondCode"
        case ean = "ean"
        case issn = "issn"
        case format = "format"
        case pageCount = "pageCount"
        case textObjects = "textObjects"
        case resourceURI = "resourceURI"
        case urls = "urls"
        case series = "series"
        case variants = "variants"
        case collections = "collections"
        case collectedIssues = "collectedIssues"
        case dates = "dates"
        case prices = "prices"
        case thumbnail = "thumbnail"
        case images = "images"
        case creators = "creators"
        case characters = "characters"
        case stories = "stories"
        case events = "events"
    }
}

