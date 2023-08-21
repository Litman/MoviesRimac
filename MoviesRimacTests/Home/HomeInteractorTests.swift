//
//  HomeInteractorTests.swift
//  MoviesRimacTests
//
//  Created by Litman Ayala Laura on 18/08/23.
//

import XCTest
@testable import MoviesRimac

final class HomeInteractorTests: XCTestCase {
    
    var sut: HomeInteractor!
    var homeApiMockRepository: HomeApiRepositoryProtocol!
    var homeDBMockRepository: MoviesCoreDataRepositoryProtocol!
    var homeInteractorToPresenterMock: HomePresenterMock!
 
    
    override func setUpWithError() throws {
        homeDBMockRepository = HomeDBMockRepository()
        homeApiMockRepository = HomeMockApiRepository()
        homeInteractorToPresenterMock = HomePresenterMock()
        
        sut = HomeInteractor(repository: homeApiMockRepository , repositoryDB: homeDBMockRepository)
        sut.presenter = homeInteractorToPresenterMock
        
    }

    override func tearDownWithError() throws {
        homeDBMockRepository = nil
        homeApiMockRepository = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_getMovies() {
        sut.getListMovies(apiKey: Constants.apiKey, page: "1")
        
        XCTAssertEqual(homeInteractorToPresenterMock.listMovies?.count, 20)
        
    }
     
}


class HomeMockApiRepository: HomeApiRepositoryProtocol {
    
    func getListMovies(apiKey: String, page: String, completion: @escaping (MoviesRimac.ResponseApi<MoviesRimac.MoviesModel>) -> Void) {
        
        let data = Data(jsonMock!)
        decode(data: data, completion: completion)
        
    }
    
    
}

class HomeDBMockRepository: MoviesCoreDataRepositoryProtocol {
    
    func saveMovie(movie: MoviesRimac.MovieModel, withImage image: UIImage) {
        
    }
    
    func fetchMoviesCoreData(completion: @escaping ([MoviesRimac.MoviesCoreData]) -> Void) {
        
    }
    
    
}


fileprivate var jsonMock = """
{
    "dates": {
        "maximum": "2023-09-13",
        "minimum": "2023-08-23"
    },
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/zN41DPmPhwmgJjHwezALdrdvD0h.jpg",
            "genre_ids": [
                28,
                878,
                27
            ],
            "id": 615656,
            "original_language": "en",
            "original_title": "Meg 2: The Trench",
            "overview": "An exploratory dive into the deepest depths of the ocean of a daring research team spirals into chaos when a malevolent mining operation threatens their mission and forces them into a high-stakes battle for survival.",
            "popularity": 1659.416,
            "poster_path": "/4m1Au3YkjqsxF8iwQy0fPYSxE0h.jpg",
            "release_date": "2023-08-02",
            "title": "Meg 2: The Trench",
            "video": false,
            "vote_average": 7,
            "vote_count": 456
        },
        {
            "adult": false,
            "backdrop_path": "/lDCIQ1Qe7cRnhZ4ybQVVEbadMZ.jpg",
            "genre_ids": [
                27,
                53
            ],
            "id": 1008042,
            "original_language": "en",
            "original_title": "Talk to Me",
            "overview": "When a group of friends discover how to conjure spirits using an embalmed hand, they become hooked on the new thrill, until one of them goes too far and unleashes terrifying supernatural forces.",
            "popularity": 805.927,
            "poster_path": "/kdPMUMJzyYAc4roD52qavX0nLIC.jpg",
            "release_date": "2023-07-26",
            "title": "Talk to Me",
            "video": false,
            "vote_average": 7.1,
            "vote_count": 165
        },
        {
            "adult": false,
            "backdrop_path": "/iEFuHjqrE059SmflBva1JzDJutE.jpg",
            "genre_ids": [
                16,
                10751,
                28,
                14,
                10749
            ],
            "id": 496450,
            "original_language": "fr",
            "original_title": "Miraculous - le film",
            "overview": "A life of an ordinary Parisian teenager Marinette goes superhuman when she becomes Ladybug. Bestowed with magical powers of creation, Ladybug must unite with her opposite, Cat Noir, to save Paris as a new villain unleashes chaos unto the city.",
            "popularity": 756.574,
            "poster_path": "/dQNJ8SdCMn3zWwHzzQD2xrphR1X.jpg",
            "release_date": "2023-07-05",
            "title": "Miraculous: Ladybug & Cat Noir, The Movie",
            "video": false,
            "vote_average": 7.9,
            "vote_count": 464
        },
        {
            "adult": false,
            "backdrop_path": "/rLb2cwF3Pazuxaj0sRXQ037tGI1.jpg",
            "genre_ids": [
                18,
                36
            ],
            "id": 872585,
            "original_language": "en",
            "original_title": "Oppenheimer",
            "overview": "The story of J. Robert Oppenheimer’s role in the development of the atomic bomb during World War II.",
            "popularity": 736.078,
            "poster_path": "/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
            "release_date": "2023-07-19",
            "title": "Oppenheimer",
            "video": false,
            "vote_average": 8.3,
            "vote_count": 1962
        },
        {
            "adult": false,
            "backdrop_path": "/waBWlJlMpyFb7STkFHfFvJKgwww.jpg",
            "genre_ids": [
                28,
                18
            ],
            "id": 678512,
            "original_language": "en",
            "original_title": "Sound of Freedom",
            "overview": "The story of Tim Ballard, a former US government agent, who quits his job in order to devote his life to rescuing children from global sex traffickers.",
            "popularity": 445.018,
            "poster_path": "/kSf9svfL2WrKeuK8W08xeR5lTn8.jpg",
            "release_date": "2023-07-03",
            "title": "Sound of Freedom",
            "video": false,
            "vote_average": 8.2,
            "vote_count": 362
        },
        {
            "adult": false,
            "backdrop_path": "/H6j5smdpRqP9a8UnhWp6zfl0SC.jpg",
            "genre_ids": [
                28,
                878
            ],
            "id": 565770,
            "original_language": "en",
            "original_title": "Blue Beetle",
            "overview": "Recent college grad Jaime Reyes returns home full of aspirations for his future, only to find that home is not quite as he left it. As he searches to find his purpose in the world, fate intervenes when Jaime unexpectedly finds himself in possession of an ancient relic of alien biotechnology: the Scarab.",
            "popularity": 371.41,
            "poster_path": "/lZ2sOCMCcGaPppaXj0Wiv0S7A08.jpg",
            "release_date": "2023-08-16",
            "title": "Blue Beetle",
            "video": false,
            "vote_average": 7.2,
            "vote_count": 30
        },
        {
            "adult": false,
            "backdrop_path": "/8FhKnPpql374qyyHAkZDld93IUw.jpg",
            "genre_ids": [
                9648,
                53,
                878
            ],
            "id": 536437,
            "original_language": "en",
            "original_title": "Hypnotic",
            "overview": "A detective becomes entangled in a mystery involving his missing daughter and a secret government program while investigating a string of reality-bending crimes.",
            "popularity": 313.763,
            "poster_path": "/3IhGkkalwXguTlceGSl8XUJZOVI.jpg",
            "release_date": "2023-05-11",
            "title": "Hypnotic",
            "video": false,
            "vote_average": 6.5,
            "vote_count": 395
        },
        {
            "adult": false,
            "backdrop_path": "/o9bbojtrrpl0yriiTmzC3Lp3OhA.jpg",
            "genre_ids": [
                28,
                10752
            ],
            "id": 840326,
            "original_language": "fi",
            "original_title": "Sisu",
            "overview": "Deep in the wilderness of Lapland, Aatami Korpi is searching for gold but after he stumbles upon Nazi patrol, a breathtaking and gold-hungry chase through the destroyed and mined Lapland wilderness begins.",
            "popularity": 249.28,
            "poster_path": "/ygO9lowFMXWymATCrhoQXd6gCEh.jpg",
            "release_date": "2023-01-27",
            "title": "Sisu",
            "video": false,
            "vote_average": 7.5,
            "vote_count": 1175
        },
        {
            "adult": false,
            "backdrop_path": "/nYDPmxvl0if5vHBBp7pDYGkTFc7.jpg",
            "genre_ids": [
                27
            ],
            "id": 709631,
            "original_language": "en",
            "original_title": "Cobweb",
            "overview": "Eight year old Peter is plagued by a mysterious, constant tapping from inside his bedroom wall—one that his parents insist is all in his imagination. As Peter's fear intensifies, he believes that his parents could be hiding a terrible, dangerous secret and questions their trust.",
            "popularity": 246.327,
            "poster_path": "/cGXFosYUHYjjdKrOmA0bbjvzhKz.jpg",
            "release_date": "2023-07-19",
            "title": "Cobweb",
            "video": false,
            "vote_average": 6.8,
            "vote_count": 132
        },
        {
            "adult": false,
            "backdrop_path": "/nKOutYdpjpxdeftoXcDnSAaD2z8.jpg",
            "genre_ids": [
                53,
                27
            ],
            "id": 954388,
            "original_language": "en",
            "original_title": "Quicksand",
            "overview": "A married couple on the brink of divorce becomes trapped in quicksand while hiking through a Colombian rainforest. It’s a struggle for survival as they battle the elements of the jungle and must work together in order to escape.",
            "popularity": 204.877,
            "poster_path": "/cVLfO3CbVg8p5Qcaifq6AidOe2w.jpg",
            "release_date": "2023-08-31",
            "title": "Quicksand",
            "video": false,
            "vote_average": 0,
            "vote_count": 0
        },
        {
            "adult": false,
            "backdrop_path": "/qykUYxstHurdadXTF711AWZi0f8.jpg",
            "genre_ids": [
                16,
                10751,
                35
            ],
            "id": 916423,
            "original_language": "nl",
            "original_title": "Knor",
            "overview": "A young girl sets out to prove to her disapproving mother she can house-train the endearing but unruly little piglet she gets as a birthday gift from her estranged oddball grandfather.",
            "popularity": 202.401,
            "poster_path": "/6QbTLuLF3vslLn4K5IcIBas1Rh8.jpg",
            "release_date": "2022-07-01",
            "title": "Oink",
            "video": false,
            "vote_average": 7.8,
            "vote_count": 22
        },
        {
            "adult": false,
            "backdrop_path": "/jv4tiXAgaArMQo57jFMjvBEjmoa.jpg",
            "genre_ids": [
                28,
                18,
                12
            ],
            "id": 980489,
            "original_language": "en",
            "original_title": "Gran Turismo",
            "overview": "The ultimate wish fulfillment tale of a teenage Gran Turismo player whose gaming skills won him a series of Nissan competitions to become an actual professional racecar driver.",
            "popularity": 191.853,
            "poster_path": "/51tqzRtKMMZEYUpSYkrUE7v9ehm.jpg",
            "release_date": "2023-08-09",
            "title": "Gran Turismo",
            "video": false,
            "vote_average": 7.2,
            "vote_count": 87
        },
        {
            "adult": false,
            "backdrop_path": "/w2nFc2Rsm93PDkvjY4LTn17ePO0.jpg",
            "genre_ids": [
                16,
                35,
                28
            ],
            "id": 614930,
            "original_language": "en",
            "original_title": "Teenage Mutant Ninja Turtles: Mutant Mayhem",
            "overview": "After years of being sheltered from the human world, the Turtle brothers set out to win the hearts of New Yorkers and be accepted as normal teenagers through heroic acts. Their new friend April O'Neil helps them take on a mysterious crime syndicate, but they soon get in over their heads when an army of mutants is unleashed upon them.",
            "popularity": 189.912,
            "poster_path": "/ueO9MYIOHO7M1PiMUeX74uf8fB9.jpg",
            "release_date": "2023-07-31",
            "title": "Teenage Mutant Ninja Turtles: Mutant Mayhem",
            "video": false,
            "vote_average": 7.4,
            "vote_count": 174
        },
        {
            "adult": false,
            "backdrop_path": "/8iUYdAdkfiIQFMrg2Kxe4gVbXdN.jpg",
            "genre_ids": [
                35
            ],
            "id": 912908,
            "original_language": "en",
            "original_title": "Strays",
            "overview": "When Reggie is abandoned on the mean city streets by his lowlife owner, Doug, Reggie is certain that his beloved owner would never leave him on purpose. But once Reggie falls in with a fast-talking, foul-mouthed stray who loves his freedom and believes that owners are for suckers, Reggie finally realizes he was in a toxic relationship and begins to see Doug for the heartless sleazeball that he is.",
            "popularity": 175.808,
            "poster_path": "/8UYxOsE2LDlF9r4AnwhPwOkiqAy.jpg",
            "release_date": "2023-08-17",
            "title": "Strays",
            "video": false,
            "vote_average": 6.2,
            "vote_count": 6
        },
        {
            "adult": false,
            "backdrop_path": "/nUixrAu0tLn9PwfN7iaBoSAiHkm.jpg",
            "genre_ids": [
                27,
                14
            ],
            "id": 635910,
            "original_language": "en",
            "original_title": "The Last Voyage of the Demeter",
            "overview": "The crew of the merchant ship Demeter attempts to survive the ocean voyage from Carpathia to London as they are stalked each night by a merciless presence onboard the ship.",
            "popularity": 162.387,
            "poster_path": "/nrtbv6Cew7qC7k9GsYSf5uSmuKh.jpg",
            "release_date": "2023-08-09",
            "title": "The Last Voyage of the Demeter",
            "video": false,
            "vote_average": 7.7,
            "vote_count": 36
        },
        {
            "adult": false,
            "backdrop_path": "/c6Splshb8lb2Q9OvUfhpqXl7uP0.jpg",
            "genre_ids": [
                28,
                53
            ],
            "id": 717930,
            "original_language": "en",
            "original_title": "Kandahar",
            "overview": "After his mission is exposed, an undercover CIA operative stuck deep in hostile territory in Afghanistan must fight his way out, alongside his Afghan translator, to an extraction point in Kandahar, all whilst avoiding elite enemy forces and foreign spies tasked with hunting them down.",
            "popularity": 157.334,
            "poster_path": "/lCanGgsqF4xD2WA5NF8PWeT3IXd.jpg",
            "release_date": "2023-05-25",
            "title": "Kandahar",
            "video": false,
            "vote_average": 6.6,
            "vote_count": 337
        },
        {
            "adult": false,
            "backdrop_path": "/zjmHE7pDSOFVOsfDTwSsczwXPdP.jpg",
            "genre_ids": [
                16,
                35,
                18
            ],
            "id": 783675,
            "original_language": "ja",
            "original_title": "THE FIRST SLAM DUNK",
            "overview": "Shohoku's “speedster” and point guard, Ryota Miyagi, always plays with brains and lightning speed, running circles around his opponents while feigning composure. In his second year of high school, Ryota plays with the Shohoku High School basketball team along with Sakuragi, Rukawa, Akagi, and Mitsui as they take the stage at the Inter-High School National Championship. And now, they are on the brink of challenging the reigning champions, Sannoh Kogyo High School.",
            "popularity": 146.501,
            "poster_path": "/995t1sb4ummXHBfKlXLSM1IAEjc.jpg",
            "release_date": "2022-12-03",
            "title": "The First Slam Dunk",
            "video": false,
            "vote_average": 7.8,
            "vote_count": 167
        },
        {
            "adult": false,
            "backdrop_path": "/x6y6AHY3UoCeOP6kwZain7WNLPN.jpg",
            "genre_ids": [
                10749,
                18
            ],
            "id": 820525,
            "original_language": "en",
            "original_title": "After Everything",
            "overview": "Besieged by writer’s block and the crushing breakup with Tessa, Hardin travels to Portugal in search of a woman he wronged in the past – and to find himself. Hoping to win back Tessa, he realizes he needs to change his ways before he can make the ultimate commitment.",
            "popularity": 125.977,
            "poster_path": "/3PqW0elNnj5tk4XD9o82djTknGd.jpg",
            "release_date": "2023-09-13",
            "title": "After Everything",
            "video": false,
            "vote_average": 0,
            "vote_count": 0
        },
        {
            "adult": false,
            "backdrop_path": "/sbtJ1SxJ1CIvttQqhGbUZcDpSqC.jpg",
            "genre_ids": [
                35,
                18
            ],
            "id": 747188,
            "original_language": "en",
            "original_title": "Asteroid City",
            "overview": "In an American desert town circa 1955, the itinerary of a Junior Stargazer/Space Cadet convention is spectacularly disrupted by world-changing events.",
            "popularity": 122.855,
            "poster_path": "/tcKBclNUdkas4Jis8RYYZnPdTIm.jpg",
            "release_date": "2023-06-08",
            "title": "Asteroid City",
            "video": false,
            "vote_average": 6.7,
            "vote_count": 595
        },
        {
            "adult": false,
            "backdrop_path": "/jiAKGhaDze3b2EeL1VNu8QxS2Cn.jpg",
            "genre_ids": [
                27,
                9648,
                53
            ],
            "id": 968051,
            "original_language": "en",
            "original_title": "The Nun II",
            "overview": "Four years after the events at the Abbey of St. Carta, Sister Irene returns once again and comes face to face with the demonic force Valak, the Nun.",
            "popularity": 115.283,
            "poster_path": "/5gzzkR7y3hnY8AD1wXjCnVlHba5.jpg",
            "release_date": "2023-09-05",
            "title": "The Nun II",
            "video": false,
            "vote_average": 0,
            "vote_count": 0
        }
    ],
    "total_pages": 26,
    "total_results": 501
}
""".data(using: .utf8)




func decode<ResponseCodable>(data: Data, completion: @escaping (ResponseApi<ResponseCodable>) -> Void) where ResponseCodable: Decodable {
    do{
        let responseCodable = try JSONDecoder().decode(ResponseCodable.self, from: data)
        completion(.success(responseCodable))
    }catch let error {
        completion(.failure(error as! ServiceError))
    }
}
