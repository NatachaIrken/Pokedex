//
//  ViewController.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import UIKit


class PokedexListViewController: UIViewController {


    var viewModel: PokemonListViewModelProtocol!
    var pokemonList = [PokemonListModel]()
    var tableView = UITableView()

    init(viewModel: PokemonListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        viewModel.getPokemon()
        view.backgroundColor = .systemCyan
        prepareTableView()
    }

    func prepareTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension PokedexListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        150
        // aqui contar pokemones pokemonlist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//        celda.textLabel?.text = pokemonList.[indexPath.row].name
        celda.detailTextLabel?.text = "detalle pokemon"
//        celda.imageView?.image = "highlighter"
        return celda
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

