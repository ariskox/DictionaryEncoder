//
//  File.swift
//  DictionaryEncoder
//
//  Created by Aris Koxaras on 19/2/22.
//

import Foundation

struct Spouse: Encodable {
    var name: String
    var surname: String
    var test: String?

    var aVariable: String {
        return "\(test)"
    }
}
