//
//  ItunesSearchClient+Combine.swift
//  
//
//  Created by Evan Mckee on 4/6/20.
//

import Foundation
import Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension ItunesSearchClient {
    
    public func searchPublisher(request:ItunesRequest) -> AnyPublisher<ItunesSearchResults, ItunesSearchError> {
        let urlReq = request.urlRequest()
        return session.dataTaskPublisher(for: urlReq)
            .tryMap{ (data, response) -> Data in
                let status = (response as? HTTPURLResponse)?.statusCode ?? -1
                guard status >= 200 && status < 300 else {
                    let message = String(data:data, encoding:.utf8)
                    throw ItunesSearchError.badResponse(status, message: message)
                }
                return data
        }
        .decode(type: ItunesSearchResults.self, decoder: self.decoder)
        .mapError { (error) -> ItunesSearchError in
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
        .eraseToAnyPublisher()
    }
    
    ///Filters unexpected or malformed results more gracefully.
    ///ResultCount will still indicate the total number of results returned from the server rather than the number successfully decoded.
    public func typedSearchPublisher<T:ResultItem>(request:ItunesRequest, resultType:T.Type) -> AnyPublisher<ItunesTypedSearchResults<T>, ItunesSearchError> {
        let urlReq = request.urlRequest()
        return session.dataTaskPublisher(for: urlReq)
            .tryMap{ (data, response) -> Data in
                let status = (response as? HTTPURLResponse)?.statusCode ?? -1
                guard status >= 200 && status < 300 else {
                    let message = String(data:data, encoding:.utf8)
                    throw ItunesSearchError.badResponse(status, message: message)
                }
                return data
        }
        .decode(type: ItunesTypedSearchResults<T>.self, decoder: decoder)
        .mapError { (error) -> ItunesSearchError in
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
        .eraseToAnyPublisher()
    }
    
    public func multiPageSearch(request:ItunesSearchRequest) -> MultiPageResults {
        return MultiPageResults(client: self, baseRequest: request)
    }
    
    public func multiPageTypedSearch<T:ResultItem>(request:ItunesSearchRequest, resultType:T.Type) -> MultiPageTypedResults<T> {
        return MultiPageTypedResults<T>(client:self, baseRequest:request)
    }
}
