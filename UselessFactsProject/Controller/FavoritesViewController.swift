//
//  FavoritesViewController.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 20/10/22.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {

    var favoritesView = FavoritesView()
    private var favoriteFacts = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view = favoritesView
        favoritesView.favoritesTableView.delegate = self
        favoritesView.favoritesTableView.dataSource = self
        favoriteFacts = CoreDataManager().fetchUselessFacts()
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteFacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        print(favoriteFacts[indexPath.row])
        var content = cell.defaultContentConfiguration()
        content.text = favoriteFacts[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    // MARK: - Delete favorite fact cell
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
                   indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            self.favoriteFacts.remove(at: indexPath.row)
            tableView.reloadData()
            completionHandler(true)
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delete])
        return swipeConfiguration
    }
}
