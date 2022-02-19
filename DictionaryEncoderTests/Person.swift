//
//  Person.swift
//  DictionaryEncoderTests
//
//  Created by Koxaras, Aris, Vodafone Greece on 16/06/2021.
//

import Foundation

struct Person: Encodable {
    var name: String
    var surname: String
    var age: Int
    var isWorking: Bool
    var childrenAges: [Int]
    var maritalStatus: MaritalStatus
    var address: Address
}

struct Address: Encodable {
    var street: String
    var number: String
    var city: String
}

enum MaritalStatus: Encodable {
    case single
    case married(Spouse)
    case divorced

    enum CodingKeys: CodingKey {
        case single
        case married
        case divorced
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .single:
            try container.encode(1, forKey: .single)
        case .married(let spouse):
            try container.encode(spouse, forKey: .married)
        case .divorced:
            try container.encode(1, forKey: .divorced)
        }
    }

    func encode1(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .single:
            try container.encode(1, forKey: .single)
        case .married(let spouse):
            try container.encode(spouse, forKey: .married)
        case .divorced:
            try container.encode(1, forKey: .divorced)
        }
    }

}

struct Spouse: Encodable {
    var name: String
    var surname: String
}
