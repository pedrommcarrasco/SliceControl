import UIKit
import SliceControl

class ViewController: UIViewController {
    
    var sliceControl: SliceControl!
    var sliceControl2: SliceControl!
    var sliceControl3: SliceControl!
    var sliceControl4: SliceControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        sliceControl = SliceControl(with: ["S", "L", "I"],
                                    primaryColor: UIColor(red:0.16, green:0.16, blue:0.15, alpha:1.0),
                                    secondaryColor: UIColor(red:0.99, green:0.81, blue:0.05, alpha:1.0),
                                    padding: 12,
                                    startAt: 0)
        
        view.addSubview(sliceControl)
        sliceControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                sliceControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 54),
                sliceControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                sliceControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                sliceControl.heightAnchor.constraint(equalToConstant: 54)
            ]
        )
        
        
        sliceControl2 = SliceControl(with: ["C", "E"],
                                     primaryColor: UIColor(red:0.99, green:0.81, blue:0.05, alpha:1.0),
                                     secondaryColor: UIColor(red:0.16, green:0.16, blue:0.15, alpha:1.0),
                                     
                                     padding: 12,
                                     startAt: 0)
        
        view.addSubview(sliceControl2)
        sliceControl2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                sliceControl2.topAnchor.constraint(equalTo: sliceControl.bottomAnchor),
                sliceControl2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                sliceControl2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                sliceControl2.heightAnchor.constraint(equalToConstant: 54)
            ]
        )
        
        sliceControl3 = SliceControl(with: ["C", "O", "N"],
                                     primaryColor: UIColor(red:0.91, green:0.95, blue:0.95, alpha:1.0),
                                     secondaryColor: UIColor(red: 0.10, green: 0.10, blue: 0.14, alpha: 1.0),
                                     padding: 12,
                                     startAt: 1)
        
        view.addSubview(sliceControl3)
        sliceControl3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                sliceControl3.topAnchor.constraint(equalTo: sliceControl2.bottomAnchor),
                sliceControl3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                sliceControl3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                sliceControl3.heightAnchor.constraint(equalToConstant: 54)
            ]
        )
        
        sliceControl4 = SliceControl(with: ["T", "R", "O", "L"],
                                     primaryColor: UIColor(red: 0.10, green: 0.10, blue: 0.14, alpha: 1.0),
                                     secondaryColor: UIColor(red:0.91, green:0.95, blue:0.95, alpha:1.0),
                                     padding: 12,
                                     startAt: 2)
        
        view.addSubview(sliceControl4)
        sliceControl4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                sliceControl4.topAnchor.constraint(equalTo: sliceControl3.bottomAnchor),
                sliceControl4.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                sliceControl4.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                sliceControl4.heightAnchor.constraint(equalToConstant: 54)
            ]
        )
    }
}
