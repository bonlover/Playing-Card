//
//  ViewController.swift
//  PlayingCard
//
//  Created by Yungdrung Gyaltsen on 2/2/19.
//  Copyright © 2019 Yungdrung Gyaltsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipt = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipt.direction = [.left , .right]
            playingCardView.addGestureRecognizer(swipt)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(playingCardView.adjustFaceCardScale(byHandlingGustureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
            
//            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(adjustFaceCardScale (byHandlingGustureRecognizedBy:)))
//            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isfaceUp = !playingCardView.isfaceUp
        default:
            break
        }
        
    }
    
    
    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

