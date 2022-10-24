//
//  UselessFactModel.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 19/10/22.
//
import Foundation
import UIKit

struct UselessFactModel: Codable {
    let id: String
    let text: String
}

struct UselessFactCellModel {
    var image: UIImage
    var title: String
}

struct Images {
    static let randomUselessFactImage =  UIImage(named: "RandomUselessFactImage")
}
