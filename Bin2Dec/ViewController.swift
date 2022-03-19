import UIKit

class ViewController: UIViewController {

    let containerView: View = View()

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }

    override func loadView() {
        view = containerView
    }
}
