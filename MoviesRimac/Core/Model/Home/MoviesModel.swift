//
//  MoviesModel.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 14/08/23.
//

import Foundation

public struct MoviesModel: Codable {
    
    var dates: DatesModel?
    var result: [MovieModel]?
    var page: Int?
    var totalPages: Int?
    var totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case result = "results"
        case page = "page"
        case totalPages = "total_pages"
    }
    public init() {
        
    }
    
}


public struct DatesModel: Codable {
    var maximum: String?
    var minimum: String?
    
    enum CodingKeys: String, CodingKey {
        case maximum = "maximum"
        case minimum = "minimum"
    }
    
    public init(){
        
    }
    
}

public struct MovieModel: Codable {
      
    var id: Int?
    var voteAverage: Double?
    var title: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case voteAverage = "vote_average"
        case title = "title"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        
        
    }
    
    public init(){
        
    }
    
    public var voteAverageString: String {
        guard let average = voteAverage else { return "" }        
        return String(average)
    }
    
    public var dateReleaseString: String {
        let releaseDateTemp = releaseDate ?? ""
        return "\(Constants.title_release_date) \(releaseDateTemp)"
    }
}
