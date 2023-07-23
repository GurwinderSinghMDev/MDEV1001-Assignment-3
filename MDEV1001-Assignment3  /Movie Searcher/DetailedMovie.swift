//
//  DetailedMovie.swift
//  Movie Searcher
//
//  Created by Gurwinder Singh on 2023-07-23.
//  Copyright © 2023 ASN GROUP LLC. All rights reserved.
import Foundation

struct DetailedMovie: Codable {
    let Title: String
    let Year: String
    let Rated: String
    let Released: String
    let Runtime: String
    let Genre: String
    let Director: String
    let Actors: String
    let Plot: String
    let Poster: String
    let imdbRating: String
    let Production: String

    private enum CodingKeys: String, CodingKey {
        case Title, Year, Rated, Released, Runtime, Genre, Director, Actors, Plot, Poster, imdbRating, Production
    }
}
