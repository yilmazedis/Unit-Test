protocol NetworkClient {
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}

class MyViewModel {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func loadData() {
        networkClient.fetchData(from: URL(string: "https://example.com")!) { data, error in
            // do something with the data or error
        }
    }
}

// Mock implementation of the NetworkClient protocol
class NetworkClientMock: NetworkClient {
    var fetchDataCallCount = 0
    var dataToReturn: Data?
    var errorToReturn: Error?
    
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        fetchDataCallCount += 1
        completion(dataToReturn, errorToReturn)
    }
}

class MyViewModelTests: XCTestCase {
    func testLoadData() {
        // Create an instance of the view model
        let networkClient = NetworkClientMock()
        networkClient.dataToReturn = Data() // simulate successful response
        let viewModel = MyViewModel(networkClient: networkClient)
        
        // Call the loadData() method
        viewModel.loadData()
        
        // Assert that the fetchData method was called once
        XCTAssertEqual(networkClient.fetchDataCallCount, 1)
    }
}
