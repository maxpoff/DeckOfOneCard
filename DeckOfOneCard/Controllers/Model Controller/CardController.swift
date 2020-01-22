//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Maxwell Poffenbarger on 1/22/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation
import UIKit

class CardController {
    
    static func fetchCard(completion: @escaping (Result <Card, CardError>) -> Void) {
        
        guard let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1") else {return(completion(.failure(.invalidURL)))}
        
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            
            if let unwrappedError = error {
                return completion(.failure(.thrownError(unwrappedError)))
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                guard let card = topLevelObject.cards.first else {return completion(.failure(.noData))}
                return completion(.success(card))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result <UIImage, CardError>) -> Void) {
        
        let url = card.image
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let unwrappedError = error {
                return completion(.failure(.thrownError(unwrappedError)))
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            completion(.success(image))
        }.resume()
    }
}//End of class
