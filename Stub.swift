
protocol NetworkClient {
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}

// Stub implementation of the NetworkClient protocol
struct NetworkClientStub: NetworkClient {
    var dataToReturn: Data?
    var errorToReturn: Error?
    
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        completion(dataToReturn, errorToReturn)
    }
}

class MyViewModel {
    private let networkClient: NetworkClient
    var didLoadData = false
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func loadData() {
        networkClient.fetchData(from: URL(string: "https://example.com")!) { data, error in
            if let data = data {
                // do something with the data
                self.didLoadData = true
            } else {
                // handle the error
            }
        }
    }
}

class MyViewModelTests: XCTestCase {
    func testLoadData() {
        // Create an instance of the view model
        let networkClient = NetworkClientStub()
        networkClient.dataToReturn = "Dummy data".data(using: .utf8) // simulate successful response
        let viewModel = MyViewModel(networkClient: networkClient)
        
        // Call the loadData() method
        viewModel.loadData()
        
        // Assert that the view model did something with the data
        XCTAssertTrue(viewModel.didLoadData)
    }
}
