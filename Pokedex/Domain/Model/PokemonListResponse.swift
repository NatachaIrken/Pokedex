//
//  PokemonListResponse.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation

struct PokemonListResponse: Codable {
    let pokemonAttack: Int
    let defense: Int
    let description: String
    let evolutionChain: [EvolutionChain2]?
    let height: Int
    let id: Int
    let imageURL: String
    let name: String
    let type: String
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case pokemonAttack = "attack"
        case defense
        case description
        case evolutionChain
        case height
        case id
        case imageURL = "imageUrl"
        case name
        case type
        case weight
    }
}

struct EvolutionChain2: Codable {
    let id : String
    let name: String
}

