//
//  ViewController.swift
//  MatchIt
//
//  Created by Tian on 4/28/15.
//  Copyright (c) 2015 Tian Guo. All rights reserved.
// This is the main screen

import UIKit

class MenuViewController: UIViewController {
    var options = [[6,6],[10,8],[14,8]]

    override func viewDidLoad() {
        super.viewDidLoad()
        let boundary = UIScreen.mainScreen().bounds
        //name of game
        let title = UILabel(frame: CGRectZero)
        title.text = "Match It"
        title.sizeToFit()
        title.textColor = UIColor.blackColor()
        title.frame = CGRect(origin: CGPointZero, size: CGSizeMake(130.0, 30.0))
        title.font = UIFont.systemFontOfSize(30)
        title.center = CGPoint(x: CGRectGetMidX(boundary), y: CGRectGetMaxY(boundary) * 0.1)

        //we have two types of buttons
        var start = 1.0
        var frac = 0.2
        for option in options {
            var row = option[0]
            var col = option[1]
            let button = OptionButton.newOptionButton(rows: row, cols: col)
            button.center = CGPoint(x: CGRectGetMidX(boundary), y: CGRectGetMaxY(boundary) * CGFloat(start*frac))
            button.addTarget(self, action: "gameStart:", forControlEvents: .TouchUpInside)
            start=start+1.0
            self.view.addSubview(button)
        }
        
        let instruct = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        instruct.layer.borderWidth = 1.0
        instruct.layer.borderColor = UIColor.blackColor().CGColor
        instruct.setTitle("Instruction", forState: .Normal)
        instruct.setTitleColor(UIColor.blackColor(), forState: .Normal)
        instruct.titleLabel!.font = UIFont.systemFontOfSize(20, weight: 3)
        instruct.backgroundColor = UIColor.blueColor()
        instruct.frame = CGRect(origin: CGPointZero, size: CGSizeMake(200.0, 50.0))
        instruct.center = CGPoint(x: CGRectGetMidX(boundary), y: CGRectGetMaxY(boundary) * 0.8)
        instruct.addTarget(self, action: "viewInstruction:", forControlEvents: .TouchUpInside)
        
        //add them to window
        self.view.addSubview(title)
        self.view.addSubview(instruct)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func gameStart(sender: OptionButton!){
        let window = GameViewController()
        window.sender = sender
        presentViewController(window, animated: true, completion: nil)
    }
    
    func viewInstruction(sender: UIButton!){
        let window = InstructionViewController()
        presentViewController(window, animated: true, completion: nil)
    }
}

