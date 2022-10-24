//
//  HomeViewController.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 19/10/22.
//

import Foundation
import UIKit

protocol GeratorUselessFactDelegate: AnyObject {
    func didTapCard(type: URLType)
    func didTapFavorite()
}

class SelectUselessFactViewController: UIViewController {

    var allUselessFact: [UselessFactModel] = []

    let selectUselessFactView = SelectUselessFactView()

    override func loadView() {
        self.view = selectUselessFactView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        selectUselessFactView.delegate = self
    }
}

extension SelectUselessFactViewController: GeratorUselessFactDelegate {

    // MARK: - Call favorites screen
    func didTapFavorite() {
        self.navigationController?.pushViewController(FavoritesViewController(), animated: true)
    }

    // MARK: - Call screen to show the useless fact selected (random or today)
    func didTapCard(type: URLType) {
        var titleScreen = "Random useless fact"
        if type == .today {
            titleScreen = "Today useless fact"
        }
        APIService().getUselessFact(urlType: type) { fact in
            guard let fact = fact else {
                return
            }
            let viewController = PopUpModalViewController(title: titleScreen, message: fact.text)
            viewController.modalPresentationStyle = .overFullScreen
            self.present(viewController, animated: false)
        }
    }
}
