//
//  ViewController.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import UIKit

class PokedexListViewController: UIViewController {

    var viewModel: PokemonListViewModelProtocol!

    init(viewModel: PokemonListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        viewModel.getPokemon()
        view.backgroundColor = .red
    }
}
