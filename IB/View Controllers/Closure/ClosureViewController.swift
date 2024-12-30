//
//  ClosureViewController.swift
//  IB
//
//  Created by Dheeraj Bhavsar on 30/12/24.
//

import UIKit

class ClosureViewModel {
    var text = ""
    
    var didUpdateText: ((String) -> Void)?
    
    
    func textFieldTextChanged(_ text: String?) {
        self.text = text ?? ""
        didUpdateText?(self.text)
    }
}

class ClosureViewController: UIViewController {
    
    var viewModel: ClosureViewModel?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ClosureViewModel()
        setupClosures()
    }
    
    private func setupClosures() {
        self.viewModel?.didUpdateText = { [unowned self] text in
            self.label.text = text
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        self.viewModel?.textFieldTextChanged(sender.text)
    }
}
