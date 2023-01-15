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

class NetworkClientSpy: NetworkClient {
    var fetchDataCallCount = 0
    var fetchDataArguments: (url: URL, completion: (Data?, Error?) -> Void)?
    
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        fetchDataCallCount += 1
        fetchDataArguments = (url, completion)
    }
}

class MyViewModelTests: XCTestCase {
    func testLoadData() {
        // Create an instance of the view model
        let networkClient = NetworkClientSpy()
        let viewModel = MyViewModel(networkClient: networkClient)
        
        // Call the loadData() method
        viewModel.loadData()
        
        // Assert that the fetchData method was called once
        XCTAssertEqual(networkClient.fetchDataCallCount, 1)
        
        // Assert that the fetchData method was called with the correct URL
        XCTAssertEqual(networkClient.fetchDataArguments?.url, URL(string: "https://example.com"))
    }
}
