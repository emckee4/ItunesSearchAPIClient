//
//  ItunesSearchClient+Dev.swift
//  
//
//  Created by Evan Mckee on 4/29/20.
//

import Foundation
import Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension ItunesSearchClient {
    ///Extension tool for checking frequency of tags in response types
    ///This helps for determining if there are missed possible values and for deciding if any further values should be considered non-optional.
    ///Results are printed to terminal.
    ///This is a dropin replacement for searchPublisher for test purposes
    ///Do not use this for anything outside of checking completeness of ResultTypes or testing the normal search functions
    public func searchPublisherWithDiagnostics(request:ItunesRequest, verbose:Bool = false) -> AnyPublisher<ItunesSearchResults, ItunesSearchError> {
        let urlReq = request.urlRequest()
        if verbose {
            print("Performing request with: \(urlReq)... ", terminator: "")
        }
        return session.dataTaskPublisher(for: urlReq)
            .tryMap{ (data, response) -> Data in
                let status = (response as? HTTPURLResponse)?.statusCode ?? -1
                if verbose {
                    print("Response Status: \(status)")
                }
                guard status >= 200 && status < 300 else {
                    let message = String(data:data, encoding:.utf8)
                    throw ItunesSearchError.badResponse(status, message: message)
                }
                return data
            }
            .handleEvents(receiveOutput: { (data) in
                if verbose {
                    print(String(data: data, encoding: .utf8) ?? "")
                }
                do {
                    let itunesResults = try self.decoder.decode(ItunesSearchResults.self, from: data)
                    ///forced unwrap should always work if above succeeds
                    let dictResults = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    self.compareForUnmatchedKeys(itunesResults: itunesResults, dictSearchResults: dictResults)
                } catch let error {
                    print("Diagnostics decode failure:")
                    print(error)
                }
            })
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
    
    ///options: should compare fields seen with extra, fields with nil, non-nil results
    private func compareForUnmatchedKeys(itunesResults:ItunesSearchResults, dictSearchResults:[String:Any]) {
        guard let resultDicts = dictSearchResults["results"] as? [[String:Any]] else {
            print("failed to unwrap dictionary results")
            return
        }
        var untrackedFields:[String:[String:[Any]]] = [:]//key is type, value dictionary of unmatched keys with values
        for i in 0..<itunesResults.results.count {
            let mirror = Mirror(reflecting: itunesResults.results[i])
            let typeName = "\(type(of:itunesResults.results[i]))"
            let dict = resultDicts[i]
            var mirrorKeys:Set<String> = Set(mirror.children.compactMap({$0.label}))
            if let superKeys = mirror.superclassMirror?.children {
                mirrorKeys.formUnion(superKeys.compactMap({$0.label}))
            }
            if let super2Keys = mirror.superclassMirror?.superclassMirror?.children {
                mirrorKeys.formUnion(super2Keys.compactMap({$0.label}))
            }
            let dictKeys:Set<String> = Set(dict.keys)
            //let mirrorUniqueKeys = mirrorKeys.subtracting(dictKeys) // use later for logging never-nil keys
            let untracked = dictKeys.subtracting(mirrorKeys)
            for key in untracked {
                untrackedFields[typeName, default:[String:[Any]]()][key, default:[Any]()].append(dict[key]!)
            }
        }
        if untrackedFields.count > 0 {
            print("\nUnmatched Keys (Keys in raw results but not yet in typed ResultItems):")
            for t in untrackedFields.keys {
                print("-- type: \(t)")
                for k in untrackedFields[t]!.keys {
                    print("---- \"\(k)\": \(untrackedFields[t]![k]!)")
                }
            }
            print("\n")
        }
    }
}
