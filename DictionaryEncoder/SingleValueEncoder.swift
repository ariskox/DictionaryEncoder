//
//  SingleValueEncoder.swift
//  Playground
//
//  Created by Koxaras, Aris, Vodafone Greece on 16/06/2021.
//

import Foundation

struct SingleValueEncoder: SingleValueEncodingContainer {
    var codingPath: [CodingKey] = []

    private(set) var result: Any? {
        didSet {
            onChange(result)
        }
    }
    private var onChange: (Any?) -> ()

    init(onChange: @escaping (Any?) -> ()) {
        self.onChange = onChange
    }

    mutating func encodeNil() throws {
        result = nil
    }

    mutating func encode(_ value: Bool) throws {
        result = value
    }

    mutating func encode(_ value: String) throws {
        result = value
    }

    mutating func encode(_ value: Double) throws {
        result = value
    }

    mutating func encode(_ value: Float) throws {
        result = value
    }

    mutating func encode(_ value: Int) throws {
        result = value
    }

    mutating func encode(_ value: Int8) throws {
        result = value
    }

    mutating func encode(_ value: Int16) throws {
        result = value
    }

    mutating func encode(_ value: Int32) throws {
        result = value
    }

    mutating func encode(_ value: Int64) throws {
        result = value
    }

    mutating func encode(_ value: UInt) throws {
        result = value
    }

    mutating func encode(_ value: UInt8) throws {
        result = value
    }

    mutating func encode(_ value: UInt16) throws {
        result = value
    }

    mutating func encode(_ value: UInt32) throws {
        result = value
    }

    mutating func encode(_ value: UInt64) throws {
        result = value
    }

    mutating func encode<T>(_ value: T) throws where T : Encodable {
        fatalError()
    }

}

