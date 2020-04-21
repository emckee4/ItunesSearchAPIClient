import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(PodcastSearch.allTests),
        testCase(MovieSearch.allTests),
        testCase(TVShowSearch.allTests),
        testCase(MusicSearch.allTests)
    ]
}
#endif
