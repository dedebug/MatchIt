//
//  Button.swift
//  MatchIt
//
//  Created by Tian on 4/28/15.
//  Copyright (c) 2015 Tian Guo. All rights reserved.
//

import UIKit

class GridButton: UIButton{
    var row:Int!
    var col:Int!
    var size:CGFloat!
    var value:Int!
    var s: Bool!
    
    class func newGridButton(#row:Int, col:Int, size:CGFloat, val: Int) -> GridButton{
        let newButton = GridButton()
        newButton.row = row
        newButton.col = col
        newButton.size = size
        newButton.value = val
        newButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        newButton.layer.borderWidth = 0.5
        newButton.layer.cornerRadius = newButton.bounds.size.width/2;
        newButton.frame = CGRect(origin: CGPointZero, size: CGSizeMake(size, size))
        return newButton
    }
    
    func showIt(){
        if (s!){
            self.setTitle(String(self.value), forState: .Normal)
            self.setTitleColor(UIColor.blackColor(), forState: .Normal)
            self.titleLabel!.font = UIFont.systemFontOfSize(10, weight: 2)
        } else {
            self.setTitle("", forState: .Normal)
            self.layer.borderColor = UIColor.darkGrayColor().CGColor
            self.backgroundColor = UIColor.whiteColor()
        }
    }
    
    func aGuess(){
        self.backgroundColor = UIColor.redColor()
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.backgroundColor = UIColor.greenColor()
        })

    }
}

class OptionButton: UIButton{
    var rows:Int!
    var cols:Int!
    
    class func newOptionButton(#rows:Int, cols:Int) -> OptionButton{
        let newButton = OptionButton()
        newButton.rows = rows
        newButton.cols = cols
        newButton.layer.borderWidth = 1.0
        newButton.layer.borderColor = UIColor.blackColor().CGColor
        newButton.setTitle("\(rows) x \(cols)", forState: .Normal)
        newButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        newButton.titleLabel!.font = UIFont.systemFontOfSize(20, weight: 3)
        newButton.frame = CGRect(origin: CGPointZero, size: CGSizeMake(200.0, 50.0))
        return newButton
        
    }
    
}