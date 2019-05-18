//
//  apiClient.swift
//  yumemi
//
//  Created by kitaharamugirou on 2019/05/18.
//  Copyright © 2019 kitaharamugirou. All rights reserved.
//

import Foundation
import Alamofire
import XMLParsing

class APIClient {
    static var shared = APIClient()
    private init() {}
    
    //alamofireで呼ぶとエラーが出るのでURLにクエリをつけて呼ぶやり方でやっている
    func easyCall<T: RequestProtocol>(request: T, success: @escaping (T.Response) -> Void, failure: @escaping () -> Void) {
        let baseUrl = request.baseUrl
        let path = request.path
        let param = request.parameters
        var urlWithQuery = URL(string: baseUrl + path)
        for key in (param?.keys)! {
            urlWithQuery = urlWithQuery?.queryItemAdded(name: key , value: param![key] as! String)
        }
        let task = URLSession.shared.dataTask(with: urlWithQuery!) {(data, response, error) in
            guard let data = data else {
                return
            }
            //print(String(data: data, encoding: .utf8)!)
            let decoder = XMLDecoder()
            do {
                let result = try decoder.decode(T.Response.self, from: data)
                success(result)
            } catch {
                print(error)
                failure()
            }
        }
        task.resume()
    }
    
    func call<T: RequestProtocol>(request: T, success: @escaping (T.Response) -> Void, failure: @escaping () -> Void) {
        let baseUrl = request.baseUrl
        let path = request.path
        let requestUrl = baseUrl + path
        let method = request.method
        let encoding = request.encoding
        let parameters = request.parameters
        let headers = request.headers
        
        let request = Alamofire.request(requestUrl,
                          method: method,
                          parameters: parameters,
                          encoding: encoding,
                          headers: headers
            )
            .responseData(completionHandler: {d in
                let decoder = XMLDecoder()
                
                guard let data = d.data else {
                    failure()
                    return
                }
                do {
                    let result = try decoder.decode(T.Response.self, from: data)
                    success(result)
                } catch {
                    print(error)
                    failure()
                }
            })
    }
}
