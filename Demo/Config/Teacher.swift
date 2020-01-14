//
// Created by zengyazhi on 2020/1/14.
//

import UIKit

enum ParseError: Error {
    case ParseError
}
//
//class ErrorBookConfigParser: ConfigParser, ShadowConfigParser {
//    typealias ValueType = String
//
//    func parse(_ serviceRawData: [String: Any]) throws -> ValueType {
//        guard let result = serviceRawData["errorBook"] as? String else {
//            throw ParseError.ParseError
//        }
//        return result
//    }
//}
