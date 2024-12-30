//
//  ViewController.swift
//  IB
//
//  Created by Dheeraj Bhavsar on 30/12/24.
//

import UIKit

protocol ViewModelProtocol: AnyObject {
    func changeText(text: String) -> Void
}

class ViewModel {
    var text = ""
    
    var delegate: ViewModelProtocol?
    
    func changeText(text: String) {
        self.text = text
        self.delegate?.changeText(text: text)
    }
}

class DelegateViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var viewModel: ViewModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Get View Model through dependency injection
        self.viewModel = ViewModel()
        self.viewModel?.delegate = self
    }
    
    @IBAction func textFieldDidChangeText(_ sender: UITextField) {
        self.viewModel?.changeText(text: sender.text ?? "")
    }
    
}

extension DelegateViewController: ViewModelProtocol {
    func changeText(text: String) {
        self.label.text = text
    }
}
