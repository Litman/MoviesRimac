//
//  MoviesCoreDataRepository.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 17/08/23.
//

import Foundation
import CoreData
import UIKit

class MoviesCoreDataRepository {
    
    let context = AppDelegate.shared.persistentContainer.viewContext
    
    func saveMovie(movie: MovieModel, withImage image: UIImage) {
        let newMovie = MoviesCoreData(context: context)
        newMovie.id = Int32(movie.id!.description)!
        newMovie.title = movie.title
        newMovie.overview = movie.overview
        newMovie.poster_path = movie.posterPath
        newMovie.release_date = movie.releaseDate
        newMovie.vote_average = movie.voteAverage ?? 0.0
        newMovie.imagePoster = image.pngData()
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func fetchMoviesCoreData(completion: @escaping ([MoviesCoreData]) -> Void) {
        do {
            
            let movies = try context.fetch(MoviesCoreData.fetchRequest())
            completion(movies)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
