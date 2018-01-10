//
//  LoginVM.swift
//  TTS_Passwords
//
//  Created by Franks, Kent on 12/18/17.
//  Copyright © 2017 KefBytes. All rights reserved.
//

import Foundation

struct LoginVM {
    
    func saveUserNameToDefaults(username: String) {
        print("🤖 saveUserNameToDefaults: username = \(username)")
        let defaults = UserDefaults.standard
        defaults.set(username, forKey: "AppUsername")
    }
    
    func savePasswordToKeychain(password: String) {
        print("🤖 savePasswordToKeychain: password = \(password)")
        KeychainService.savePassword(token: password)
    }
    
}
