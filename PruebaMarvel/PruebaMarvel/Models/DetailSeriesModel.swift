// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailSeriesModel = try? newJSONDecoder().decode(DetailSeriesModel.self, from: jsonData)

import Foundation

// MARK: - DetailSeriesModel
struct DetailSeriesModel: Decodable  {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: DataClassSeries?

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
struct DataClassSeries: Decodable  {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [ResultSeries]?

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct ResultSeries: Decodable  {
    let id: Int?
    let title: String?
    let resultDescription: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let startYear: Int?
    let endYear: Int?
    let rating: String?
    let type: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let creators: Creators?
    let characters: Characters?
    let stories: Stories?
    let comics: Characters?
    let events: Characters?
    let next: Next?
    let previous: Next?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case resultDescription = "description"
        case resourceURI = "resourceURI"
        case urls = "urls"
        case startYear = "startYear"
        case endYear = "endYear"
        case rating = "rating"
        case type = "type"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case creators = "creators"
        case characters = "characters"
        case stories = "stories"
        case comics = "comics"
        case events = "events"
        case next = "next"
        case previous = "previous"
    }
}



// MARK: - Next
struct Next: Decodable  {
    let resourceURI: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case resourceURI = "resourceURI"
        case name = "name"
    }
}




