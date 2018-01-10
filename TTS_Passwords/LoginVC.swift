//
//  LoginVC.swift
//  TTS_Passwords
//
//  Created by Franks, Kent on 12/18/17.
//  Copyright © 2017 KefBytes. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let loginVM:LoginVM = LoginVM()
    var savedUserName: String = ""
    var savedPassword: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        guard let retrievedUserName = defaults.object(forKey: "AppUsername") as? String else {
            return
        }
        print("🤖 LoginVC.viewDidLoad() retrievedUserName = \(retrievedUserName)")
        savedUserName = retrievedUserName
        
        guard let retrievedPassword = KeychainService.loadPassword() else {
            return
        }
        print("🤖 LoginVC.viewDidLoad() retrievedPassword = \(retrievedPassword)")
        savedPassword = retrievedPassword
    }
    
    // MARK: - Actions
    @IBAction func loginAction(_ sender: Any) {
        loginVM.saveUserNameToDefaults(username: usernameTextField.text!)
        loginVM.savePasswordToKeychain(password: passwordTextField.text!)
        if savedUserName == usernameTextField.text! && savedPassword == passwordTextField.text! {
            print("🤖 Login successful")
            if let accountsTableVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AccountsTableVC") as? AccountsTableVC {
                present(accountsTableVC, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(title: "Login Failure", message: "That username and password combination did not work, please try again.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                // ...
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {}
        }
    }
    

    // MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}
