import Nimble
import Quick

/*

Using Nimble and Quick together can provide a powerful and efficient testing workflow in your Swift projects.

Quick is a behavior-driven development (BDD) framework that allows you to define and organize your test cases in a clear and descriptive manner, while Nimble provides a range of useful matchers and other testing utilities for performing assertions and expectations within your tests.

*/

class MyTests: QuickSpec {
    override func spec() {
        describe("a calculator") {
            var calculator: Calculator!

            beforeEach {
                calculator = Calculator()
            }

            context("when adding numbers") {
                it("should return the correct result") {
                    let result = calculator.add(2, 3)
                    expect(result) == 5
                }

                it("should be commutative") {
                    let result1 = calculator.add(2, 3)
                    let result2 = calculator.add(3, 2)
                    expect(result1) == result2
                }
            }

            context("when subtracting numbers") {
                it("should return the correct result") {
                    let result = calculator.subtract(5, 3)
                    expect(result) == 2
                }
            }
        }
    }
}

class MyTests: QuickSpec {
    override func spec() {
        describe("a string") {
            it("should be equal to another string") {
                let string1 = "hello"
                let string2 = "hello"
                expect(string1) == string2
            }
        }
    }
}

// Fill you spec as you wish

// 1. Testing a simple function:
describe("Calculator") {
  context("when adding two numbers") {
    it("returns the correct result") {
      let result = Calculator.add(2, 3)
      expect(result) == 5
    }
  }
}

// 2. Testing a mock object

describe("UserManager") {
  context("when user logs in") {
    it("calls the delegate method") {
      let delegateMock = UserManagerDelegateMock()
      UserManager.delegate = delegateMock
      
      UserManager.login(username: "user", password: "pass")
      
      expect(delegateMock.didLoginCalled).to(beTrue())
    }
  }
}

// 3. Testing a view controller

describe("LoginViewController") {
  var viewController: LoginViewController!
  
  beforeEach {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    viewController = storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
    viewController.loadViewIfNeeded()
  }
  
  context("when logging in") {
    it("shows the correct alert") {
      viewController.usernameTextField.text = "user"
      viewController.passwordTextField.text = "pass"
      viewController.loginButton.sendActions(for: .touchUpInside)
      
      expect(viewController.presentedViewController).toEventually(beAKindOf(UIAlertController.self))
    }
  }
}
