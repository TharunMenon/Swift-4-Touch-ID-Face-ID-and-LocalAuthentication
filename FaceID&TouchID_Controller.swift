//
//  FaceID&TouchID_Controller.swift
//  FaceID_TouchID
//
//  Created by Tharun Menon on 30/03/2018.
//  Copyright © 2018 Tharun. All rights reserved.
//

import UIKit
import LocalAuthentication

class FaceID_TouchID_Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func authenticate()
    {
        let context = LAContext()
        let reason = "We need this to protect your data." // add your own message explaining why you need this authentication method
        
        var authError: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                
                
                DispatchQueue.main.async
                    {
                        if success
                        {
                            // User authenticated successfully
                            
                        } else
                        {
                            // User did not authenticate successfully
                            
                            let authenticate_error = UIAlertController(title: "Authentication failed", message:"You could not be verified! please try again.", preferredStyle: .alert)
                            authenticate_error.addAction(UIAlertAction(title: "OK", style: .default))
                            self.present(authenticate_error, animated: true)
                            
                        }
                }
                
                
                
                
            }
        } else
        {
            // Handle Error - no biometry
            
            let biometry_error = UIAlertController(title:"Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            biometry_error.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(biometry_error, animated: true)
            
        }
    }
}
    


