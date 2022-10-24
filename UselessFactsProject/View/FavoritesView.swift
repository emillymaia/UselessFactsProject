//
//  FavoritesView.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 23/10/22.
//

import Foundation
import UIKit

class FavoritesView: UIView {

    lazy var favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(favoritesTableView)
        configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup constraints
    private func configConstraints() {
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: topAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
