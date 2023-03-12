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
