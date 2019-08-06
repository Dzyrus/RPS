//
//  ViewController.swift
//  RPS
//
//  Created by Daria on 05/08/2019.
//  Copyright © 2019 D.Misch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var app: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockSwitcher: UIButton!
    @IBOutlet weak var palmSwitcher: UIButton!
    @IBOutlet weak var scissorsSwitcher: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        playAgain.isHidden = true
    }
    func play(_ sign: Sign) {
        let appSign = randomSign()
        app.text = appSign.emoji
        switch sign {
        case .rock:
            rockSwitcher.isHidden = false
            palmSwitcher.isHidden = true
            scissorsSwitcher.isHidden = true
        case .paper:
            rockSwitcher.isHidden = true
            palmSwitcher.isHidden = false
            scissorsSwitcher.isHidden = true
        case .scissors:
            rockSwitcher.isHidden = true
            palmSwitcher.isHidden = true
            scissorsSwitcher.isHidden = false
        }
        playAgain.isHidden = false
        let getResult = sign.result(appSign)
        switch getResult {
        case .win:
            view.backgroundColor = .green
            gameStatus.text = "You won"
        case .draw:
            view.backgroundColor = .gray
            gameStatus.text = "DRAW"
        case .lose:
            view.backgroundColor = .red
            gameStatus.text = "You lose"
        }
        
    }
    func reset() {
        rockSwitcher.isHidden = false
        palmSwitcher.isHidden = false
        scissorsSwitcher.isHidden = false
        playAgain.isHidden = true
        app.text = "🤖"
        gameStatus.text = "Rock, Paper, Scissors?"
        view.backgroundColor = .white
    }
    @IBAction func rockPlayer(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func paperPlayer(_ sender: UIButton) {
        play(.paper)
    }
    
    @IBAction func scissorsPlayer(_ sender: UIButton) {
        play(.scissors)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        reset()
    }
    
}

