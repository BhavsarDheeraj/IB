//
//  BoxViewController.swift
//  IB
//
//  Created by Dheeraj Bhavsar on 30/12/24.
//

import UIKit
import Combine

class CombineViewModel {
    @Published var text: String = ""
}

class CombineViewController: UIViewController {
    
    var viewModel: CombineViewModel?
    
    private var cancellables: Set<AnyCancellable> = []
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Combine"
        
        self.viewModel = CombineViewModel()
        setupCombine()
    }
    
    func setupCombine() {
        viewModel?.$text.sink { [weak self] text in
            self?.label.text = text
        }.store(in: &cancellables)
    }
    
    @IBAction func textFieldTextChanged(_ sender: UITextField) {
        viewModel?.text = sender.text ?? ""
    }
    
}
