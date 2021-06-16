//
//  DictionaryEncoder.swift
//  Playground
//
//  Created by Koxaras, Aris, Vodafone Greece on 16/06/2021.
//

import Foundation

class DictionaryEncoder: Encoder {
    var codingPath: [CodingKey] = []
    var userInfo: [CodingUserInfoKey: Any] = [:]

    private enum Mode {
        case keyedContainer
        case unkeyedContainer
        case singleValueContainer
    }
    private var mode: Mode!

    var result: Any? {
        switch mode {
        case .none:
            fatalError()
        case .some(.keyedContainer):
            return dictionary
        case .some(.unkeyedContainer):
            return array
        case .some(.singleValueContainer):
            return singleValue
        }
    }
    private var dictionary: [String: Any] = [:]
    private var array: [Any?] = []
    private var singleValue: Any?

    func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        mode = .keyedContainer
        let c = DictionaryKeyedEncodingContainer<Key>(onChange: { dict in
            self.dictionary.merge(dict, uniquingKeysWith: { _, second in
                return second
            })
        })
        return KeyedEncodingContainer<Key>.init(c)
    }

    func unkeyedContainer() -> UnkeyedEncodingContainer {
        mode = .unkeyedContainer
        return UnkeyedValuesEncoder(onChange: { value in
            self.array = value
        })
    }

    func singleValueContainer() -> SingleValueEncodingContainer {
        mode = .singleValueContainer
        return SingleValueEncoder(onChange: { value in
            assert(self.singleValue == nil)
            self.singleValue = value
        })
    }

}
