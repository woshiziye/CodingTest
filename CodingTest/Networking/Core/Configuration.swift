//
//  Configuration.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/5.
//

import Alamofire
import Moya

extension Network {
    
    class Configuration {
        
        static var `default`: Configuration = Configuration()
        var addingHTTPHeaders: (TargetType) -> [String: String] = { _ in [:] }
        var replacingTask: (TargetType) -> Task = { $0.task }
        var timeoutInterval: TimeInterval = 30
        var plugins: [PluginType] = []
        lazy var session: Session = { build() }()
        private var retryingRequests: [String: Int] = [:]
        public init() {}
    }
    
}


private extension Network.Configuration {
    
    func build() -> Session {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        
        let interceptor = Interceptor(adaptHandler: { request, _, callback in
            callback(.success(request))
        }, retryHandler: { request, session, error, callback in
            guard let url = request.request?.url?.absoluteString else {
                callback(.doNotRetry)
                return
            }
            
            guard request.task?.response == nil else {
                self.retryingRequests.removeValue(forKey: url)
                callback(.doNotRetry)
                return
            }
            
            guard let count = self.retryingRequests[url] else {
                self.retryingRequests[url] = 1
                callback(.retryWithDelay(1))
                return
            }
            
            guard count < 1 else {
                self.retryingRequests.removeValue(forKey: url)
                callback(.doNotRetry)
                return
            }
            
            self.retryingRequests[url] = count + 1
            callback(.retryWithDelay(1))
        })
        
        return Session(
            configuration: configuration,
            startRequestsImmediately: false,
            interceptor: interceptor
        )
    }
    
}
