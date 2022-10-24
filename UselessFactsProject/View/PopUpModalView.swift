//
//  IntroductionCardView.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 20/10/22.
//
import Foundation
import UIKit

class PopUpModalView: UIView {

    var didPopUpAppear: (() -> Void)?

    weak var delegate: GeratorPopUpDelegate?

    lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: .close)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        closeButton.tag = 2

        closeButton.clipsToBounds = true
        return closeButton
    }()

    lazy var titlePopUp: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()

    lazy var messagePopUp: UILabel = {
        let message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        message.textAlignment = .center
        message.numberOfLines = 0
        return message
    }()

    lazy var stack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [titlePopUp, messagePopUp])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 16.0
       return stack
    }()

    lazy var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.cornerRadius = 24
        return container
    }()

    lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Favorite", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(favoriteAction), for: .touchUpInside)
        button.tag = 1

        button.clipsToBounds = true
        return button
    }()

    init(title: String, message: String) {
        super.init(frame: .zero)
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.8)
        setupView()
        configConstraints()
        setupAdditionalConfigurations(title: title, message: message)
    }

    // MARK: - Call delegate to save and disable favorite button
    @objc func favoriteAction(sender: UIButton) {
        delegate?.didFavoriteFact(fact: messagePopUp.text!)
        favoriteButton.isUserInteractionEnabled = false
        favoriteButton.backgroundColor = .gray
        }

    // MARK: - Call delegate to close modal
    @objc func closeAction(sender: UIButton) {
        delegate?.dismiss()
        }

    private func setupView() {
        addSubview(container)
        container.addSubview(stack)
        container.addSubview(favoriteButton)
        container.addSubview(closeButton)
    }

    // MARK: - Setup constraints
    private func configConstraints() {
        NSLayoutConstraint.activate([

            closeButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),

            container.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),

            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stack.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -8),

            favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            favoriteButton.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.5),
            favoriteButton.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.15),
            favoriteButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopUpModalView {
    func setupAdditionalConfigurations(title: String, message: String) {
        titlePopUp.text = title
        messagePopUp.text = message
    }
}
