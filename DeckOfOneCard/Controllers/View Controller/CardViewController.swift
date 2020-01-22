//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Maxwell Poffenbarger on 1/22/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        CardController.fetchCard { [weak self] (result) in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateView(with: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    func fetchImageAndUpdateView(with card: Card) {
        
        CardController.fetchImage(for: card) { [weak self] (result) in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let image):
                    self?.cardLabel.text = "\(card.value) of \(card.suit)"
                    self?.cardImage.image = image
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}//End of class
