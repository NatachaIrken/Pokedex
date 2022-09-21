//
//  ViewController.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import UIKit


class PokedexListViewController: UIViewController {

    var viewModel: PokemonListViewModelProtocol!
    var pokemonList: [PokemonListModel]?
    var tableView = UITableView()

    init(viewModel: PokemonListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        view.backgroundColor = .systemCyan
        setUpNavigation()
        getPokemons()
        prepareTableView()
    }

    func setUpNavigation() {
        navigationItem.title = "Pokedex"
        self.navigationController?.navigationBar.barTintColor = .systemCyan
        self.navigationController?.navigationBar.isTranslucent = true
    }

    func prepareTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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

    func getPokemons() {

        viewModel.getPokemon { [weak self] pokemonList in
            self?.pokemonList = pokemonList
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension PokedexListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.pokemonList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //      let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text  = pokemonList?[indexPath.row].name.capitalized ?? ""
        cell.detailTextLabel?.text = pokemonList?[indexPath.row].description ?? ""
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let viewController = PokedexDetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}


