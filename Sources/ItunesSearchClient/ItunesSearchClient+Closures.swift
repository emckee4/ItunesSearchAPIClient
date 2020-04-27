//
//  File.swift
//  
//
//  Created by Evan Mckee on 4/6/20.
//

import Foundation

extension ItunesSearchClient {

    @discardableResult
    public func performSearch(request:ItunesRequest,
                              completion:@escaping (Result<ItunesSearchResults, ItunesSearchError>)->()
    ) -> URLSessionDataTask {
        
        let urlReq = request.urlRequest()
        let task = session.dataTask(with: urlReq) { (data, response, error) in
            if case .failure(let packagedError) = self.parseResponse(data, response, error) {
                completion(.failure(packagedError))
                return
            }
            do {
                let results = try self.decoder.decode(ItunesSearchResults.self, from: data!)
                completion(.success(results))
            } catch let parseError {
                completion(.failure(self.mapError(parseError)))
                return
            }
        }
        task.resume()
        return task
    }
    
    @discardableResult
    public func performTypedSearch<T:ResultItem>(request:ItunesRequest,
                                                   resultType:T.Type,
                                                   completion:@escaping (Result<ItunesTypedSearchResults<T>, ItunesSearchError>)->()
    ) -> URLSessionDataTask {
        
        let urlReq = request.urlRequest()
        let task = session.dataTask(with: urlReq) { (data, response, error) in
            if case .failure(let packagedError) = self.parseResponse(data, response, error) {
                completion(.failure(packagedError))
                return
            }
            do {
                let results = try self.decoder.decode(ItunesTypedSearchResults<T>.self, from: data!)
                completion(.success(results))
            } catch let parseError {
                completion(.failure(self.mapError(parseError)))
                return
            }
        }
        task.resume()
        return task
    }
    
    private func parseResponse(_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Result<Data, ItunesSearchError> {
        let status = (response as? HTTPURLResponse)?.statusCode ?? -1
        guard error == nil else {
            return .failure(mapError(error!))
        }
        guard status >= 200 && status < 300 else {
            let message = data != nil ? String(data:data!, encoding:.utf8) : ""
            return .failure(.badResponse(status, message: message))
        }
        guard data != nil else {
            return .failure(.unknown(nil))
        }
        return .success(data!)
    }
    
    private func mapError(_ error:Error) -> ItunesSearchError {
        switch error {
        case is ItunesSearchError:
            return error as! ItunesSearchError
        case is URLError:
            return .network(error)
        case is DecodingError:
            return .parsing(error)
        default:
            return .unknown(error)
        }
    }

    
}
