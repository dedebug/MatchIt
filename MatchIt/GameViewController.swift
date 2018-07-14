//
//  GameViewController.swift
//  MatchIt
//
//  Created by Tian on 4/28/15.
//  Copyright (c) 2015 Tian Guo. All rights reserved.
//

import Foundation
import UIKit

class GameViewController: UIViewController, UIScrollViewDelegate{
    var sender: OptionButton!
    var board: [[GridButton]]!
    var first: GridButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var rows = self.sender.rows
        var cols = self.sender.cols
        start(numRow:rows, numCol:cols)
        self.first = nil
    }
    
    func start(#numRow:Int, numCol:Int){
        let boundary = UIScreen.mainScreen().bounds
        //draw board
        self.board = [[GridButton]](count:numRow,repeatedValue:[GridButton]())
        //generate numbers and randomize them
        let largest = numRow*numCol/2;
        var allNumbers = [Int](0...(largest-1))
        allNumbers = allNumbers+allNumbers
        //modified from http://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift
        for i in 0..<(allNumbers.count - 1) {
            let j = Int(arc4random_uniform(UInt32(allNumbers.count - i))) + i
            swap(&allNumbers[i], &allNumbers[j])
        }
        var each = [Int](count:numRow,repeatedValue:Int())
        var theAnswer = [[Int]](count:numRow, repeatedValue:each)
        //at the true solution to theAnswer
        for i in 0..<allNumbers.count{
            var theCol = i%numRow
            var theRow = i/numRow
            theAnswer[theRow][theCol]=allNumbers[i]
        }
        var side = CGFloat(30.0)
        var initX = CGRectGetMinX(boundary)+side
        var initY = CGRectGetMinY(boundary)+side
        //add the grid buttons
        for row in 0..<numRow{
            for col in 0..<numCol{
                //println(String(theAnswer[row][col]))
                //println(String(row))
                //println(String(col))
                let addBut = GridButton.newGridButton(row: row, col: col, size: side, val: theAnswer[row][col])
                addBut.center = CGPoint(x: initX + (CGFloat(col)+0.5)*side, y: initY + (CGFloat(row)+0.5)*side)
                addBut.addTarget(self, action: "gridPressed:", forControlEvents: .TouchUpInside)
                self.view.addSubview(addBut)
                board[row].append(addBut)
            }
        }
        //add a back button
        let backButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        backButton.setTitle("Back to Main Menu", forState: .Normal)
        backButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        backButton.layer.borderWidth = 1.0
        backButton.frame = CGRect(origin: CGPointZero, size: CGSizeMake(200.0, 50.0))
        backButton.addTarget(self, action: "backButtonPressed:", forControlEvents: .TouchUpInside)
        backButton.backgroundColor = UIColor.blueColor()
        backButton.center = CGPoint(x: CGRectGetMidX(boundary), y: CGRectGetMaxY(boundary) * CGFloat(0.9))
        self.view.addSubview(backButton)
        
    }
    
    func gridPressed(sender: GridButton!){
        sender.aGuess()
        sender.s = true
        sender.showIt()
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "nextStep:", userInfo: sender, repeats: false)
    }
    
    func nextStep(timer: NSTimer!){
        let sender = timer.userInfo as GridButton
        let k = sender.value
        if (self.first==nil){
            //nothing memeorized
            self.first = sender
        } else if (self.first.value == k){
            //right answer
            self.first.s = true
            self.first = nil
        } else {
            //wrong answer
            self.first.s = false
            self.first.showIt()
            self.first = nil
            sender.s = false
            sender.showIt()
        }
        
    }
    
    func backButtonPressed(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}