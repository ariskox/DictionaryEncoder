//
//  DictionaryEncoderTests.swift
//  DictionaryEncoderTests
//
//  Created by Koxaras, Aris, Vodafone Greece on 16/06/2021.
//

import XCTest
@testable import DictionaryEncoder

class DictionaryEncoderTests: XCTestCase {

    func testPerformanceExample() throws {
        let address = Address(street: "Athinon", number: "1111", city: "Athens")
        let spouse = Spouse(name: "test", surname: "test2")
        let person = Person(name: "aris",
                            surname: "kox",
                            age: 44,
                            isWorking: true,
                            childrenAges: [0, 1, 2, 3],
                            maritalStatus: .married(spouse),
                            address: address)

        let enc = DictionaryEncoder()
        try person.encode(to: enc)

        // Then
        let resultPerson = try XCTUnwrap(enc.result as? [String: Any])
        let resultAddress = try XCTUnwrap(resultPerson["address"] as? [String: Any])
        let maritalStatus = try XCTUnwrap(resultPerson["maritalStatus"] as? [String: Any])
        let resultSpouse = try XCTUnwrap(maritalStatus["married"] as? [String: Any])

        XCTAssertEqual(resultPerson["name"] as? String, "aris")
        XCTAssertEqual(resultPerson["age"] as? Int, 44)
        XCTAssertEqual(resultPerson["isWorking"] as? Bool, true)
        XCTAssertEqual(resultSpouse["name"] as? String, "test")
        XCTAssertEqual(resultSpouse["surname"] as? String, "test2")


        XCTAssertEqual(resultAddress["street"] as? String, "Athinon")
        XCTAssertEqual(resultAddress["number"] as? String, "1111")
        XCTAssertEqual(resultAddress["city"] as? String, "Athens")

    }

    func testKeyedValueContainerTypes() throws {
        let values = KeyedValues(boolValue: true,
                                 doubleValue: 2,
                                 floatValue: 3,
                                 intValue: 1,
                                 int8Value: 8,
                                 int16Value: 16,
                                 int32Value: 32,
                                 int64Value: 64,
                                 uIntValue: 1,
                                 uInt8Value: 8,
                                 uInt16Value: 16,
                                 uInt32Value: 32,
                                 uInt64Value: 64)

        let enc = DictionaryEncoder()
        try values.encode(to: enc)

        let resultValues = try XCTUnwrap(enc.result as? [String: Any])

        XCTAssertEqual(resultValues["boolValue"] as? Bool, true)
        XCTAssertEqual(resultValues["doubleValue"] as? Double, 2)
        XCTAssertEqual(resultValues["floatValue"] as? Float, 3)
        XCTAssertEqual(resultValues["intValue"] as? Int, 1)
        XCTAssertEqual(resultValues["int8Value"] as? Int8, 8)
        XCTAssertEqual(resultValues["int16Value"] as? Int16, 16)
        XCTAssertEqual(resultValues["int32Value"] as? Int32, 32)
        XCTAssertEqual(resultValues["int64Value"] as? Int64, 64)
        XCTAssertEqual(resultValues["uIntValue"] as? UInt, 1)
        XCTAssertEqual(resultValues["uInt8Value"] as? UInt8, 8)
        XCTAssertEqual(resultValues["uInt16Value"] as? UInt16, 16)
        XCTAssertEqual(resultValues["uInt32Value"] as? UInt32, 32)
        XCTAssertEqual(resultValues["uInt64Value"] as? UInt64, 64)
    }

    func testSingleValueContainerTypes() throws {
        let values = UnkeyedSingleValues(stringValue: ["a","b"],
                                         boolValue: [true, false],
                                         doubleValue: [2, 3],
                                         floatValue: [3, 4],
                                         intValue: [1, 2],
                                         int8Value: [8, 9],
                                         int16Value: [16, 17],
                                         int32Value: [32, 33],
                                         int64Value: [64, 65],
                                         uIntValue: [1, 2],
                                         uInt8Value: [8, 9],
                                         uInt16Value: [16, 17],
                                         uInt32Value: [32, 33],
                                         uInt64Value: [64, 65])

        let enc = DictionaryEncoder()
        try values.encode(to: enc)

        let resultValues = try XCTUnwrap(enc.result as? [String: Any])

        XCTAssertEqual(resultValues["stringValue"] as? [String], ["a", "b"])
        XCTAssertEqual(resultValues["boolValue"] as? [Bool], [true, false])
        XCTAssertEqual(resultValues["doubleValue"] as? [Double], [2, 3])
        XCTAssertEqual(resultValues["floatValue"] as? [Float], [3, 4])
        XCTAssertEqual(resultValues["intValue"] as? [Int], [1, 2])
        XCTAssertEqual(resultValues["int8Value"] as? [Int8], [8, 9])
        XCTAssertEqual(resultValues["int16Value"] as? [Int16], [16, 17])
        XCTAssertEqual(resultValues["int32Value"] as? [Int32], [32, 33])
        XCTAssertEqual(resultValues["int64Value"] as? [Int64], [64, 65])
        XCTAssertEqual(resultValues["uIntValue"] as? [UInt], [1, 2])
        XCTAssertEqual(resultValues["uInt8Value"] as? [UInt8], [8, 9])
        XCTAssertEqual(resultValues["uInt16Value"] as? [UInt16], [16, 17])
        XCTAssertEqual(resultValues["uInt32Value"] as? [UInt32], [32, 33])
        XCTAssertEqual(resultValues["uInt64Value"] as? [UInt64], [64, 65])
    }
}
