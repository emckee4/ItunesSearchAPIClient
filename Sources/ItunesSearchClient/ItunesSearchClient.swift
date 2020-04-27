import Foundation

public class ItunesSearchClient {
    public var session:URLSession
    public var decoder = JSONDecoder()
    
    //default request parameters
    public var limit:Int
    /// default is baseURL is  https://itunes.apple.com/
    public var baseURL:URL
    public var country:String?
    public var language:String?
    public var additionalQueryItems:[URLQueryItem]?
    public var additionalHeaderFields:[String:String]?
    
    public init(session:URLSession = URLSession.shared, limit:Int = 50, baseURL:URL? = nil, country:String? = nil, language:String? = nil, queryItems:[URLQueryItem]? = nil, headerFields:[String:String]? = nil) {
        self.session = session
        self.limit = limit
        self.baseURL = baseURL ?? URL(string:"https://itunes.apple.com/")!
        self.country = country
        self.language = language
        self.additionalQueryItems = queryItems
        self.additionalHeaderFields = headerFields
    }
    
    ///Returns a search request with client defaults applied
    /// limit applied here will override client limit
    public func searchRequest(term:String, searchParameters:ItunesSearchParameters, explicit:Bool? = nil, limit:Int? = nil, offset:Int? = nil) -> ItunesSearchRequest {
        var req = ItunesSearchRequest(term: term, searchParameters: searchParameters, explicit: explicit, offset: offset)
        req.limit = limit ?? self.limit
        req.baseURL = self.baseURL
        req.country = self.country
        req.language = self.language
        req.additionalQueryItems = self.additionalQueryItems
        req.additionalHeaderFields = self.additionalHeaderFields
        return req
    }
    
    ///Returns a lookup request with client defaults applied
    public func lookupRequest(idType:ItunesLookupRequest.IDType, ids:[String], entity:ItunesLookupEntities? = nil, sortRecent:Bool = false) -> ItunesLookupRequest {
        var req = ItunesLookupRequest(idType:idType, ids:ids, entity: entity, sortRecent:sortRecent)
        req.limit = self.limit
        req.baseURL = self.baseURL
        req.country = self.country
        req.language = self.language
        req.additionalQueryItems = self.additionalQueryItems
        req.additionalHeaderFields = self.additionalHeaderFields
        return req
    }
    

}


