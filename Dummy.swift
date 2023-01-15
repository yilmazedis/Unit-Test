class MyViewModel {
    var fetchDataFromServerCalled = false

    func loadData(completion: ((Data?) -> Void)?) {
        // perform some logic
        let data = fetchDataFromServer()
        completion?(data)
    }

    func fetchDataFromServer() -> Data? {
        fetchDataFromServerCalled = true
        // perform some logic
        return Data()
    }
}

class MyViewModelTests: XCTestCase {
    func testLoadData() {
        // Create an instance of the view model
        let viewModel = MyViewModel()

        // Call the loadData() method with a dummy completion block
        viewModel.loadData { _ in }

        // Assert that the fetchDataFromServer() method was called
        XCTAssertTrue(viewModel.fetchDataFromServerCalled)
    }
}
