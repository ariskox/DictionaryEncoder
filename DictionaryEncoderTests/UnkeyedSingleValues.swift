//
//  UnkeyedSingleValues.swift
//  DictionaryEncoderTests
//
//  Created by Aris Koxaras on 16/6/21.
//

import Foundation

struct UnkeyedSingleValues: Encodable {
    var stringValue: [String]
    var boolValue: [Bool]
    var doubleValue: [Double]
    var floatValue: [Float]
    var intValue: [Int]
    var int8Value: [Int8]
    var int16Value: [Int16]
    var int32Value: [Int32]
    var int64Value: [Int64]
    var uIntValue: [UInt]
    var uInt8Value: [UInt8]
    var uInt16Value: [UInt16]
    var uInt32Value: [UInt32]
    var uInt64Value: [UInt64]
}
