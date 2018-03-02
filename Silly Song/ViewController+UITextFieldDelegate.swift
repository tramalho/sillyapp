//
//  ViewController+UITextFieldDelegate.swift
//  Silly Song
//
//  Created by Thiago Antonio Ramalho on 02/03/18.
//  Copyright © 2018 Tramalho. All rights reserved.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
