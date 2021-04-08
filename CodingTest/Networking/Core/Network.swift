//
//  Network.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/5.
//

import Moya

struct DefaultResponse: Codable {}

class Network {

    typealias DatasSuccessClosure<T> = (_ data: [T]?) -> Void
    typealias SuccessClosure<T> = (_ data: T?) -> Void
    typealias DictSuccessClosure<T> = (_ data: [String: Any]?) -> Void
    typealias ErrorClosure = (_ error: String) -> Void

    public static let `default`: Network = {
        Network(configuration: Configuration.default)
    }()

    public let provider: MoyaProvider<MultiTarget>

    public init(configuration: Configuration) {
        provider = MoyaProvider(configuration: configuration)
    }

    func requestDatas<T: Decodable>(_ api: TargetType, _ type: T.Type, success: @escaping DatasSuccessClosure<T>, error: @escaping ErrorClosure) {
        provider.request(.init(api)) { results in
            switch results {
            case .success(let response):
                if response.statusCode == 200 {
                    let response = try? response.mapResponseDatas(T.self)
                    if response?.code == 0 {
                        success(response?.result)
                    } else {
                        error(response?.message ?? "")
                    }
                } else {
                    if response.statusCode == 307 {
                        error("登录过期")
//                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                        appDelegate.logout()
                    } else {
                        error("服务器异常")
                    }
                }
            case .failure( _):
                error("服务器异常")
            }
        }
    }

    func request<T: Decodable>(_ api: TargetType, _ type: T.Type, success: @escaping SuccessClosure<T>, error: @escaping ErrorClosure) {
        provider.request(.init(api)) { results in
            switch results {
            case .success(let response):
                let response = try? response.mapResponse(T.self)
                if response?.code == 200 {
                    success(response?.result)
                } else {
                    if response?.code == 307 {
                        error("登录过期")
//                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                        appDelegate.logout()
                    } else {
                        error(response?.message ?? "服务器异常")
                    }
                }
            case .failure(_):
                error("服务器异常")
            }
        }
    }

    func request(_ api: TargetType, success: @escaping DictSuccessClosure<[String: Any]>, error: @escaping ErrorClosure) {
        provider.request(.init(api)) { results in
            switch results {
            case .success(let response):
                let response = try? response.mapDictionary()
                if let code = response?["code"] as? Int, code == 200 {
                    success(response?["result"] as? [String: Any])
                } else {
                    if let code = response?["code"] as? Int, code == 307 {
                        error("登录过期")
//                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                        appDelegate.logout()
                    } else {
                        error((response?["message"] as? String) ?? "服务器异常")
                    }
                }
            case .failure(_):
                error("服务器异常")
            }
        }
    }

    func requestJustResult(_ api: TargetType, success: @escaping SuccessClosure<Any>, error: @escaping ErrorClosure) {
        provider.request(.init(api)) { results in
            switch results {
            case .success(let response):
                let response = try? response.mapDictionary()
                if let code = response?["code"] as? Int, code == 200 {
                    success(response?["result"])
                } else {
                    if let code = response?["code"] as? Int, code == 307 {
                        error("登录过期")
//                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                        appDelegate.logout()
                    } else {
                        error((response?["message"] as? String) ?? "服务器异常")
                    }
                }
            case .failure(_):
                error("服务器异常")
            }
        }
    }
}

extension MoyaProvider {

    convenience init(configuration: Network.Configuration) {
        let endpointClosure = { target -> Endpoint in
            MoyaProvider.defaultEndpointMapping(for: target)
                .adding(newHTTPHeaderFields: configuration.addingHTTPHeaders(target))
                .replacing(task: configuration.replacingTask(target))
        }

        let requestClosure =  { (endpoint: Endpoint, closure: RequestResultClosure) -> Void in
            do {
                var request = try endpoint.urlRequest()
                request.timeoutInterval = configuration.timeoutInterval
                closure(.success(request))
            } catch MoyaError.requestMapping(let url) {
                closure(.failure(.requestMapping(url)))
            } catch MoyaError.parameterEncoding(let error) {
                closure(.failure(.parameterEncoding(error)))
            } catch {
                closure(.failure(.underlying(error, nil)))
            }
        }

        self.init(
            endpointClosure: endpointClosure,
            requestClosure: requestClosure,
            session: configuration.session,
            plugins: configuration.plugins
        )
    }
}
