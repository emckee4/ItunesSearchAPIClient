import XCTest
import Combine
@testable import ItunesSearchClient

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class NetworkedTests: XCTestCase {
    
    //    /*
    //     case movie(entity:MovieEntity, attribute:MovieAttribute)
    //     case podcast(entity:PodcastEntity, attribute:PodcastAttribute)
    //     case music(entity:MusicEntity, attribute:MusicAttribute)
    //     case musicVideo(entity:MusicVideoEntity, attribute:MusicVideoAttribute)
    //     case audiobook(entity:AudiobookEntity, attribute:AudiobookAttribute)
    //     case shortFilm(entity:ShortFilmEntity, attribute:ShortFilmAttribute)
    //     case tvShow(entity:TvShowEntity, attribute:TvShowAttribute)
    //     case software(entity:SoftwareEntity, attribute:SoftwareAttribute)
    //     case ebook(entity:EbookEntity)
    //     case all(entity:AllEntity, attribute:AllAttribute)
    //     */
    
    var subscriptions:Set<AnyCancellable> = []
    var searchClient:ItunesSearchClient!
    
    override func setUp() {
        super.setUp()
        searchClient = ItunesSearchClient()
        searchClient.session = URLSession(configuration: .default)
    }
    
    override func tearDown() {
        subscriptions = []
    }
}


