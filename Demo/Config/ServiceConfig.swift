//
// Created by zengyazhi on 2020/1/14.
//

import UIKit

public typealias failure = (_ error: NSError) -> Void

public enum ConfigKey: Int {
    case errorBook              //错题集布局
    case captcha           //是否开启图形验证码验证
}

public enum ConfigSource {
    case Apollo
}

enum ServiceDomain: String {
    case application = "application"
    case student = "student"
    case teacher = "teacher"
    case techShare = "TECH.share-jyxb-cs"
}

protocol ServiceData {
    func fetch(_ userCache: Bool, success: @escaping (_ data: [String : Any]) -> Void, failure: @escaping failure)
}

extension String: SpecialValue {

}

protocol SpecialValue {

}

protocol TypeErasedSpecialController {
    var typeErasedCurrentValue: SpecialValue? { get }
    func parse(_ serviceRawData: [String: Any])
}


protocol ConfigParser: TypeErasedSpecialController {
    associatedtype SpecialValueType: SpecialValue
    var currentValue: SpecialValueType? { get }
}

extension ConfigParser {
    var typeErasedCurrentValue: SpecialValue? { return currentValue }
}

class ApolloData: ServiceData {
    func fetch(_ userCache: Bool = true, success: @escaping ([String : Any]) -> Void, failure: @escaping failure) {
        success(["errorBook": "hahaha"])
    }
}

class TestConfigParser: ConfigParser {
    func parse(_ serviceRawData: [String : Any]) {
        currentValue = serviceRawData["errorBook"] as? String
    }

    var currentValue: String?

    typealias SpecialValueType = String



//    func parse(_ serviceRawData: [String: Any]) throws -> ValueType {
//        guard let result = serviceRawData["errorBook"] as? String else {
//            throw ParseError.ParseError
//        }
//        return result
//    }
}

public class ServiceConfigCenter: NSObject {
    public static let instance = ServiceConfigCenter()

    private let sourceDic: [ConfigSource: ServiceData] = [ConfigSource.Apollo: ApolloData()]
    private let parserDic: [ConfigKey: TypeErasedSpecialController] = [ConfigKey.errorBook: TestConfigParser()]

    public func getConfig<T>(_ key: ConfigKey, useCache userCache: Bool = true, serviceSource source: ConfigSource = ConfigSource.Apollo
            , _ success: @escaping (_ data: T?) -> Void, _ failure: @escaping failure) {
        guard let serviceData = sourceDic[source] else {
            failure(NSError.init(domain: "没有找到对应的source", code: 0, userInfo: nil))
            return
        }
        guard let parser = parserDic[key] else {
            failure(NSError.init(domain: "没有找到对应的parser", code: 0, userInfo: nil))
            return
        }
        serviceData.fetch(userCache, success: { (result) in
            parser.parse(result)
            var v1 = parser.typeErasedCurrentValue as? T
            print("1 --- \(v1!)")
            success(v1)
        }) { (err) in
            failure(err)
        }
    }

}

