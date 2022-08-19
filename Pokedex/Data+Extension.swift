//
//  Data+Extension.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation

extension Data {
    func parseData(deleteString word: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let paseDataString = dataAsString?.replacingOccurrences(of: word, with: "")
        guard let data = paseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
