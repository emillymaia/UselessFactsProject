//
//  APIService.swift
//  UselessFactsProject
//
//  Created by Emilly Maia on 19/10/22.

import Foundation
import UIKit

enum URLType: String {

    case today = "today.json?language=en"
    case random = "random.json?language=en"
}

class APIService {
    // MARK: - API Request
    func getUselessFact (urlType: URLType, completion: @escaping (UselessFactModel?) -> Void) {
        guard let url = URL(string: "https://uselessfacts.jsph.pl/\(urlType.rawValue)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, _)
            in
            DispatchQueue.main.async {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let uselessfact = try? jsonDecoder.decode(UselessFactModel.self, from: data)
                    completion(uselessfact)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}
