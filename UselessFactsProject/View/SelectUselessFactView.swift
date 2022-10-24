//
//  SelectUselessFactView.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 19/10/22.
//
//

import Foundation
import UIKit

class SelectUselessFactView: UIView {

    weak var delegate: GeratorUselessFactDelegate?

    lazy var favoriteButton: UIButton = {
        let favoriteButton = UIButton(type: .system)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.setTitle("  favoritos", for: .normal)
        favoriteButton.setImage(UIImage(systemName: "heart.circle.fill"), for: .normal)
        favoriteButton.layer.cornerRadius = 8
        favoriteButton.tintColor = .gray
        favoriteButton.backgroundColor = .systemBackground

        favoriteButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        favoriteButton.clipsToBounds = true
        return favoriteButton
    }()

    lazy var subTitleLabel: UILabel = {
        let descriptionlabel = UILabel()
        descriptionlabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionlabel.text = "Hey you! Discover useless facts to impress your friends and family with our app!"
        descriptionlabel.textAlignment = .left
        descriptionlabel.font = UIFont.systemFont(ofSize: 24)
        descriptionlabel.textColor = .gray
        descriptionlabel.numberOfLines = 0
        return descriptionlabel
    }()

    lazy var titleLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "Select the fact type:"
        description.textAlignment = .left
        description.font = UIFont.boldSystemFont(ofSize: 36)
        description.numberOfLines = 0
        return description
    }()

    lazy var randomFactCardView: CardView = {
        let cardView = CardView(title: "Random useless fact", imageName: "RandomUselessFactImage")
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .init(red: 0.62, green: 0.66, blue: 1.00, alpha: 1.00)
        return cardView
    }()

    lazy var todayFactCardView: CardView = {
        let cardView = CardView(title: "Today useless fact", imageName: "TodayUselessFactImage")
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .init(red: 1.00, green: 0.78, blue: 0.62, alpha: 1.00)
        return cardView
    }()

    // MARK: - Call button action (show the favorites screen)
    @objc func buttonAction(sender: UIButton) {
            delegate?.didTapFavorite()
        }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configConstrainsts()

        randomFactCardView.didTapCard = {
            self.delegate?.didTapCard(type: .random)
        }

        todayFactCardView.didTapCard = {
            self.delegate?.didTapCard(type: .today)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup constraints
    private func configConstrainsts() {
        NSLayoutConstraint.activate([
            self.favoriteButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            self.favoriteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 250),
            self.favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            self.favoriteButton.bottomAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: -32)
        ])

        NSLayoutConstraint.activate([
            self.subTitleLabel.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: 32),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.subTitleLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -32)
        ])

        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 32),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            self.randomFactCardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            self.randomFactCardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.randomFactCardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.randomFactCardView.heightAnchor.constraint(equalToConstant: 150)
        ])

        NSLayoutConstraint.activate([
            self.todayFactCardView.topAnchor.constraint(equalTo: randomFactCardView.bottomAnchor, constant: 16),
            self.todayFactCardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.todayFactCardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.todayFactCardView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    private func setupView() {
        addSubview(favoriteButton)
        addSubview(subTitleLabel)
        addSubview(titleLabel)
        addSubview(randomFactCardView)
        addSubview(todayFactCardView)
    }
}
