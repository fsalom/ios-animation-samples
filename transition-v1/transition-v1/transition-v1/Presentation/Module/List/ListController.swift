//
//  ViewController.swift
//  transition-v1
//
//  Created by Fernando Salom Carratala on 29/10/22.
//

import UIKit

class ListController: UITableViewController {
    var viewModel: ListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ListViewModel()
        Task {
            try? await viewModel.getCharactersList()
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.characters[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

