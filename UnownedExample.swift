/*

If you have a closure to handle a response from a network requests use weak, because they are long lived. The view controller could close before the request completes so self no longer points to a valid object when the closure is called.
If you have closure that handles an event on a button. This can be unowned because as soon as the view controller goes away, the button and any other items it may be referencing from self goes away at the same time. The closure block will also go away at the same time.

https://stackoverflow.com/a/46944211/7657265
*/

class MyViewController: UIViewController {
      @IBOutlet weak var myButton: UIButton!
      let networkManager = NetworkManager()
      let buttonPressClosure: () -> Void // closure must be held in this class. 

      override func viewDidLoad() {
          // use unowned here
          buttonPressClosure = { [unowned self] in
              self.changeDisplayViewMode() // won't happen after vc closes. 
          }
          // use weak here
          networkManager.fetch(query: query) { [weak self] (results, error) in
              self?.updateUI() // could be called any time after vc closes
          }
      }
      @IBAction func buttonPress(self: Any) {
         buttonPressClosure()
      }

      // rest of class below.
 }
