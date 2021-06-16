//
//  DictionaryKeyedEncodingContainer.swift
//  Playground
//
//  Created by Koxaras, Aris, Vodafone Greece on 16/06/2021.
//

import Foundation

struct DictionaryKeyedEncodingContainer<K : CodingKey> : KeyedEncodingContainerProtocol {
    typealias Key = K

    var codingPath: [CodingKey] = []

    private var onChange: ( [String: Any] ) -> ()

    private var dict: [String: Any] = [:] {
        didSet {
            onChange(dict)
        }
    }

    init(onChange: @escaping ([String: Any] ) -> ()) {
        self.onChange = onChange
    }

    mutating func encodeNil(forKey key: K) throws {
        dict[key.stringValue] = nil
    }

    mutating func encode(_ value: Bool, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: String, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: Double, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: Float, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: Int, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: Int8, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: Int16, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: Int32, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: Int64, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: UInt, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: UInt8, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: UInt16, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: UInt32, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode(_ value: UInt64, forKey key: K) throws {
        dict[key.stringValue] = value
    }

    mutating func encode<T>(_ value: T, forKey key: K) throws where T : Encodable {
        let enc = DictionaryEncoder()
        try value.encode(to: enc)
        dict[key.stringValue] = enc.result
    }

    mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: K) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        fatalError()
    }

    mutating func nestedUnkeyedContainer(forKey key: K) -> UnkeyedEncodingContainer {
        fatalError()
    }

    mutating func superEncoder() -> Encoder {
        fatalError()
    }

    mutating func superEncoder(forKey key: K) -> Encoder {
        fatalError()
    }
}
