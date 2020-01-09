//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Elise Farley on 11/19/19.
//  Copyright © 2019 Elise Farley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    var labelsArray = [GridLabel]()
    var xTurn = true
    var gameOver = false
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
    }
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer){
        if !gameOver{
            for label in labelsArray{
                if label.frame.contains(sender.location(in: backgroundView)){
                    if label.canTap{
                        if xTurn{
                            label.text = "X"
                        }
                        else{
                            label.text = "O"
                        }
                        xTurn = !xTurn
                        label.canTap = false
                        count += 1
                        checkForWinner()
                    }
                }
            }
            if count == 9{
                displayWinningMessage(message: "Cat's Game!")
            }
        }
    }
    
    func displayWinningMessage(message: String){
        gameOver = true
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default){
            (action) -> Void in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func checkForWinner(){
        threeInARow(first: 0, second: 1, third: 2)
        threeInARow(first: 3, second: 4, third: 5)
        threeInARow(first: 6, second: 7, third: 8)
        threeInARow(first: 0, second: 4, third: 8)
        threeInARow(first: 2, second: 4, third: 6)
        threeInARow(first: 0, second: 3, third: 6)
        threeInARow(first: 1, second: 4, third: 7)
        threeInARow(first: 2, second: 5, third: 8)
    }
    
    func threeInARow(first: Int, second: Int, third: Int){
        if(labelsArray[first].text! != "") && (labelsArray[first].text! == labelsArray[second].text!) && (labelsArray[first].text! == labelsArray[third].text!){
            displayWinningMessage(message: labelsArray[first].text! + " wins!")
        }
    }
    
    func resetGame(){
        count = 0
        xTurn = true
        gameOver = false
        for label in labelsArray{
            label.text = ""
            label.canTap = true
        }
    }
}
