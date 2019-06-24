//
//  GLBResumeAPIClient.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando on 6/21/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

typealias completeClosure = (Result<[GLBResumeHomeSection]>) -> Void

enum HttpMethod: String
{
    case GET = "GET"
    case DELETE = "DELETE"
    case POST = "POST"
    case PUT = "PUT"
}

enum Result<T>
{
    case failed(HttpError)
    case successful(T)
}

enum HttpError
{
    case json
    case parsing
    case unknown
}

enum GLBResumeURL: String
{
    case base = "https://gist.githubusercontent.com/FernandoFloresGlobant/"
    case info = "b4b1c2aed902f8ba8b55002abe587ab8/raw/e671c008fe88197a7d8e874b07e789881a65a4e5/test.json"
}

final class GLBResumeAPIClient: GLBResumeAPIClientProtocol
{
    private let baseUrl: GLBResumeURL
    
    private let urlSession: URLSessionProtocol
    
    convenience init()
    {
        self.init(baseUrl: .base , urlSession: URLSession.shared)
    }
    
    init(baseUrl: GLBResumeURL, urlSession: URLSessionProtocol)
    {
        self.baseUrl = baseUrl
        self.urlSession = urlSession
    }
    
    func request(endpoint: GLBResumeURL, httpMethod: HttpMethod, onCompletion: completeClosure?)
    {
        guard let getResumeURL = URL(string: baseUrl.rawValue + endpoint.rawValue) else { return }
        
        var request = URLRequest(url: getResumeURL)
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = urlSession.dataTask(with: request) { (data, urlResponse, error) -> Void in
            
            var errorResponse = HttpError.unknown
            
            if let dataToDecode = data
            {
                let decoder = JSONDecoder()

                do {
                    let response = try decoder.decode([GLBResumeHomeSection].self, from: dataToDecode)
                    onCompletion?(.successful(response))
                    
                    return
                } catch {
                    errorResponse = .json
                    onCompletion?(.failed(errorResponse))

                    return
                }
            }
            
            onCompletion?(.failed(errorResponse))
        }
        
        task.resume()
    }
}
