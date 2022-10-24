//
//  PopUpMoldalViewController.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 21/10/22.
//

import UIKit

protocol GeratorPopUpDelegate: AnyObject {
    func didFavoriteFact(fact: String)
    func dismiss()
}

class PopUpModalViewController: UIViewController {

    let coreDataManager = CoreDataManager()

    var popUpModalView: PopUpModalView

    init(title: String, message: String) {
        self.popUpModalView = PopUpModalView(title: title, message: message)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = popUpModalView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpModalView.delegate = self
    }
}

extension PopUpModalViewController: GeratorPopUpDelegate {
    // MARK: - Dismiss PopUpModalView
    func dismiss() {
        dismiss(animated: false)
    }

    // MARK: - Favorite fact function (when favorite button is pressed)
    func didFavoriteFact(fact: String) {
        coreDataManager.saveContext(uselessFact: fact)
    }
}
