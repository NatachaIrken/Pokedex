//
//  PokemonRepositoryProtocol.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 18-08-22.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func fetchPokemon(completion:@escaping(Result<[PokemonModel], PokemonError>) -> ())
}
