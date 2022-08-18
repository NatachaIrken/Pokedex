//
//  ViewController.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import UIKit

class PokedexViewController: UIViewController {

    var viewModel = PokemonListViewModel()

    var pokemon = [PokemonListResponse]()
    var filteredPokemon = [PokemonListResponse]()

    let infoView: Info

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

    }

    private func configureView() {
        viewModel.retriveDataList()    }

    private func setUp() {
        viewModel.refreshData = { [weak self] () in

            DispatchQueue.main.async {
//           self.tableView.reloadData()

            }
        }
    }
}


