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
    
    public func searchPublisher(request:ItunesRequest, verbose:Bool=false) -> AnyPublisher<ItunesSearchResults, ItunesSearchError> {
        let urlReq = request.urlRequest()
        if verbose {
            print("Performing request with: \(urlReq)")
        }
        return session.dataTaskPublisher(for: urlReq)
            .tryMap{ (data, response) -> Data in
                let status = (response as? HTTPURLResponse)?.statusCode ?? -1
                if verbose {
                    print("Response Status: \(status)")
                    print(String(data: data, encoding: .utf8) ?? "")
                }
                guard status >= 200 && status < 300 else {
                    let message = String(data:data, encoding:.utf8)
                    throw ItunesSearchError.badResponse(status, message: message)
                }
                return data
        }
        //.decode(type: ItunesSearchResult.self, decoder: JSONDecoder())
            .tryMap({ (data) -> ItunesSearchResults in
                do {
                    return try self.decoder.decode(ItunesSearchResults.self, from: data)
                } catch let error {
                    print("\nParsing Error raw data:\n")
                    print(NSString(string:String(data:data, encoding:.utf8)!))
                    throw error
                }
            })
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
    public func typedSearchPublisher<T:ResultItem>(request:ItunesRequest, resultType:T.Type, verbose:Bool=false) -> AnyPublisher<ItunesTypedSearchResults<T>, ItunesSearchError> {
        let urlReq = request.urlRequest()
        if verbose {
            print("Performing request with: \(urlReq)")
        }
        return session.dataTaskPublisher(for: urlReq)
            .tryMap{ (data, response) -> Data in
                let status = (response as? HTTPURLResponse)?.statusCode ?? -1
                if verbose {
                    print("Response Status: \(status)")
                    print(String(data: data, encoding: .utf8) ?? "")
                }
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
}
