import UIKit
import SliceControl

class ViewController: UIViewController {

    var sliceControl: SliceControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white

        sliceControl = SliceControl(with: ["All", "Option A", "Option B"],
                                    primaryColor: .green,
                                    secondaryColor: .red,
                                    padding: 12,
                                    startAt: 1)

        view.addSubview(sliceControl)
        sliceControl.translatesAutoresizingMaskIntoConstraints = false

        sliceControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 54).isActive = true
        sliceControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sliceControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        sliceControl.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
}
