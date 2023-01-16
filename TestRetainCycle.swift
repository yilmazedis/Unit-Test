import XCTest

class Parent {
    var child: Child?
    init() {
        child = Child(parent: self)
    }
    deinit {
        print("Parent deallocated")
    }
}

class Child {
    weak var parent: Parent?
    init(parent: Parent) {
        self.parent = parent
    }
    deinit {
        print("Child deallocated")
    }
}

/*

In this test case, we are creating a weak reference of the parent object and checking if it is nil after the strong reference is set to nil. And we are also checking if the child property of the parent object is nil or not after the strong reference is set to nil.

If the test case passes it means that, both the parent and child objects are deallocated, and there is no retain cycle.

*/

class RetainCycleTests: XCTestCase {
    func testRetainCycle() {
        var parent: Parent? = Parent()
        weak var weakParent = parent
        XCTAssertNotNil(parent)
        parent = nil
        XCTAssertNil(parent)
        XCTAssertNil(weakParent)
        XCTAssertNil(weakParent?.child)
    }
}

RetainCycleTests.defaultTestSuite.run()
