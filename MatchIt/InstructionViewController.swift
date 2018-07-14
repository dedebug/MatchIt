//
//  InstructionViewController.swift
//  MatchIt
//
//  Created by Tian on 4/28/15.
//  Copyright (c) 2015 Tian Guo. All rights reserved.
//

import Foundation
import UIKit

class InstructionViewController: UIViewController, UIScrollViewDelegate{
    override func viewDidLoad() {
        let boundary = UIScreen.mainScreen().bounds
        let backButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        backButton.setTitle("Back to Main Menu", forState: .Normal)
        backButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        backButton.layer.borderWidth = 1.0
        backButton.frame = CGRect(origin: CGPointZero, size: CGSizeMake(200.0, 50.0))
        backButton.addTarget(self, action: "backButtonPressed:", forControlEvents: .TouchUpInside)
        backButton.backgroundColor = UIColor.blueColor()
        backButton.center = CGPoint(x: CGRectGetMidX(boundary), y: CGRectGetMaxY(boundary) * CGFloat(0.9))
        var instruct = "This is a memory game. Each grid contains a number. Clicking the grid reveals the number under the grid. There are two copies of the same number for each numer. If you consecutively access the two grids containing the same number, those numbers are solved. Except for the numbers solved, there will be at most one grid constantly visible. If you did not access two grids of the same number, those two will be unvisible."
        let window = UITextView()
        window.text = instruct
        var w = CGRectGetMaxX(boundary)*CGFloat(0.9)
        var h = CGRectGetMaxX(boundary)
        window.frame = CGRect(origin: CGPointZero, size: CGSize(width: w, height: h))
        window.center = CGPoint(x: CGRectGetMidX(boundary), y: CGRectGetMaxY(boundary) * CGFloat(0.5))
        window.font = UIFont.systemFontOfSize(18)
        window.userInteractionEnabled = false
        self.view.addSubview(window)
        
        self.view.addSubview(backButton)
        
    }
    
    func backButtonPressed(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}