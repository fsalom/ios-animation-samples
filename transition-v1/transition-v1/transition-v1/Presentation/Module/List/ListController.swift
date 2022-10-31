//
//  ViewController.swift
//  transition-v1
//
//  Created by Fernando Salom Carratala on 29/10/22.
//

import UIKit

class ListController: UITableViewController {
    var viewModel: ListViewModel!
    var animator: UIViewPropertyAnimator!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel = ListViewModel()
        Task {
            try? await viewModel.getCharactersList()
            tableView.reloadData()
        }
    }

    func configure(){
        self.tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell

        cell.setupUI(for: viewModel.characters[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "DetailController") as? DetailController else {
            return
        }
        vc.viewModel.character = viewModel.characters[indexPath.row]
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
}

extension ListController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
}

