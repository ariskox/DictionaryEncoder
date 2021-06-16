//
//  UnkeyedValuesEncoder.swift
//  Playground
//
//  Created by Koxaras, Aris, Vodafone Greece on 16/06/2021.
//

import Foundation

struct UnkeyedValuesEncoder: UnkeyedEncodingContainer {

    var codingPath: [CodingKey] = []

    var count: Int = 0

    private(set) var result: [Any?] = [] {
        didSet {
            onChange(result)
        }
    }
    private var onChange: ([Any?]) -> ()

    init(onChange: @escaping ([Any?]) -> ()) {
        self.onChange = onChange
    }

    mutating func encodeNil() throws {
        fatalError()
    }

    mutating func encode(_ value: String) throws {
        fatalError()
    }

    mutating func encode(_ value: Double) throws {
        fatalError()
    }

    mutating func encode(_ value: Float) throws {
        fatalError()
    }

    mutating func encode(_ value: Int) throws {
        fatalError()
    }

    mutating func encode(_ value: Int8) throws {
        fatalError()
    }

    mutating func encode(_ value: Int16) throws {
        fatalError()
    }

    mutating func encode(_ value: Int32) throws {
        fatalError()
    }

    mutating func encode(_ value: Int64) throws {
        fatalError()
    }

    mutating func encode(_ value: UInt) throws {
        fatalError()
    }

    mutating func encode(_ value: UInt8) throws {
        fatalError()
    }

    mutating func encode(_ value: UInt16) throws {
        fatalError()
    }

    mutating func encode(_ value: UInt32) throws {
        fatalError()
    }

    mutating func encode(_ value: UInt64) throws {
        fatalError()
    }

    mutating func encode<T>(_ value: T) throws where T : Encodable {
        let enc = DictionaryEncoder()
        try value.encode(to: enc)
        result.append(enc.result)
    }

    mutating func encode(_ value: Bool) throws {
        fatalError()
    }

    mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        fatalError()
    }

    mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        fatalError()
    }

    mutating func superEncoder() -> Encoder {
        fatalError()
    }

}

