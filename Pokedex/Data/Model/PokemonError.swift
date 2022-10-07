//
//  PokemonError.swift
//  Pokedex
//
//  Created by Christopher Ruz on 07-10-22.
//

import Foundation

enum PokemonError: Error {
    case apiError
    case emptyError
    case decodeError
    case malformedUrl
}
