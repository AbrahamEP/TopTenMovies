//
//  MyExtensions.swift
//  TopTenMovies
//
//  Created by Abraham Escamilla Pinelo on 29/01/20.
//  Copyright © 2020 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertOneButtonWith(alertTitle: String?, alertMessage: String?, buttonTitle: String, handler:  ((UIAlertAction) -> Void)? = nil){
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let button = UIAlertAction(title: buttonTitle, style: .default, handler: handler)
        
        alert.addAction(button)
        
        self.present(alert, animated: true, completion: nil)
    }
}
