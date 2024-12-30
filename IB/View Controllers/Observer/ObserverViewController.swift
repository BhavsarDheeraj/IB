//
//  ObserverViewController.swift
//  IB
//
//  Created by Dheeraj Bhavsar on 30/12/24.
//

import UIKit


class ObserverViewModel {
    
    var isLoggedIn = ObservableObject(false)
    var loginStatus = ObservableObject("")
    
    func login(email: String, password: String) {
        NetworkService.shared.login(email: email, password: password) { [weak self] success in
            self?.isLoggedIn.value = success
            self?.loginStatus.value = success ? "Login successful" : "Login failed"
        }
    }
    
    func logout() {
        NetworkService.shared.logout { [weak self] in
            self?.isLoggedIn.value = false
            self?.loginStatus.value = ""
        }
    }
    
}


class ObserverViewController: UIViewController {
    
    var viewModel: ObserverViewModel?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var statusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = ObserverViewModel()
        
        self.setupListener()
    }
    
    func setupListener() {
        self.viewModel?.isLoggedIn.bind { [weak self] success in
            let title = (success ?? false) ? "Logout" : "Login"
            DispatchQueue.main.async { [unowned self] in
                self?.loginButton.setTitle(title, for: .normal)
                if !(success ?? false) {
                    self?.emailTextField.text = ""
                    self?.passwordTextField.text = ""
                }
            }
        }
        
        self.viewModel?.loginStatus.bind { [weak self] status in
            DispatchQueue.main.async { [unowned self] in
                self?.statusLabel.text = self?.viewModel?.loginStatus.value
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let isLoggedIn = self.viewModel?.isLoggedIn.value ?? false
        
        if isLoggedIn {
            self.viewModel?.logout()
        } else {
            self.viewModel?.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        }
        
    }

}
