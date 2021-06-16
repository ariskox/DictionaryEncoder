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
}
