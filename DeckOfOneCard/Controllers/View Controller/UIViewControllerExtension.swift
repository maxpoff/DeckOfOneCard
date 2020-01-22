//
//  UIViewControllerExtension.swift
//  DeckOfOneCard
//
//  Created by Maxwell Poffenbarger on 1/22/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentErrorToUser(localizedError: LocalizedError) {
        
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}//End of extension
