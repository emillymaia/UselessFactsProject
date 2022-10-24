//
//  CardViewHelaineGata.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 19/10/22.
import Foundation
import UIKit

class CardView: UIView {

    var didTapCard: (() -> Void)?

    lazy var titleCard: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .left
        description.numberOfLines = 0
        description.font = UIFont.systemFont(ofSize: 33)
        return description
    }()
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    init(title: String, imageName: String) {
        super.init(frame: .zero)
        setupView()
        configConstrainsts()
        setupAdditionalConfigurations(title: title, imageName: imageName)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup constraints
    private func configConstrainsts() {
        NSLayoutConstraint.activate([
            self.titleCard.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.titleCard.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.titleCard.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            self.imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            self.imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
    }
    private func setupView() {
        addSubview(titleCard)
        addSubview(imageView)
    }
}

extension CardView {

    // MARK: - Setup title and image styles and add a tapGesture on cards
    func setupAdditionalConfigurations(title: String, imageName: String) {
        layer.cornerRadius = 20
        titleCard.text = title
        imageView.image = UIImage(named: imageName)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        addGestureRecognizer(tapGesture)
    }

    // MARK: - recognize which card was pressed
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        didTapCard?()
    }
}
