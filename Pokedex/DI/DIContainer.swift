//
//  DIContainer.swift
//  Pokedex
//
//  Created by Christopher Ruz on 07-10-22.
//

import Foundation

struct DIContainer {
    static let remote: RemoteDataSourceProtocol = RemoteDataSource()
    static let repository: PokemonRepositoryProtocol = PokemonRepository(dataSource: remote)
    static let fetchPokemonUseCase: FetchPokemonUseCase = FetchPokemonUseCase(pokemonRepository: repository)
    static let viewModel: PokemonListViewModelProtocol = PokemonListViewModel(fetchPokemonUseCase: fetchPokemonUseCase)
}
