//
//  Animals.swift
//  Ragunan-Zoo-Map
//
//  Created by Wildan Budi on 19/10/22.
//

import Foundation

struct Animals: Equatable, Hashable, Encodable, Decodable {
    var cage: String
    var idName: String
    var enName: String
    var latinName: String
}
