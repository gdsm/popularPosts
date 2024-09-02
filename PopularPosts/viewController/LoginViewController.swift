//
//  LoginViewController.swift
//  PopularPosts
//
//  Created by Gagandeep on 28/08/24.
//

import UIKit
import RxSwift
import SwiftUI

class LoginViewController: UIViewController {
    
    static let storyboardId = "LoginViewController"
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var switchNewUser: UISwitch!
    @IBOutlet weak var btnLogin: UIButton!
    private let disposeBag = DisposeBag()

    private let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.delegate = self
        tfPassword.delegate = self
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnLogin.isEnabled = false
        loginViewModel.isLoginEnabled.subscribe { [weak self] value in
            self?.btnLogin.isEnabled = value
        }
        .disposed(by: disposeBag)
    }
    
    private func launchPostView() {
//        let hostingController = UIHostingController(rootView: PostsView())
//        let nav = UINavigationController(rootViewController: hostingController)
//        self.navigationController?.present(nav, animated: true)
    }
    
    @IBAction func onBtnLogin(_ sender: UIButton) {
        loginViewModel.login(isNewUser: switchNewUser.isOn).subscribe { [weak self] value in
            print("Successfully logged in \(value)")
            self?.launchPostView()
        }
        .disposed(by: disposeBag)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            if textField == tfEmail {
                loginViewModel.email.onNext(text)
            } else if textField == tfPassword {
                loginViewModel.password.onNext(text)
            }
        }
        return true
    }
}
