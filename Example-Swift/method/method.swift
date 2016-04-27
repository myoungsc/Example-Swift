//
//  method.swift
//  Example-Swift
//
//  Created by Myoung.SC on 2016. 4. 27..
//  Copyright © 2016년 myoung. All rights reserved.
//

import UIKit

//Device Screen Size
let screenWidth : CGFloat = UIScreen.mainScreen().bounds.size.width
let screenHeight : CGFloat = UIScreen.mainScreen().bounds.size.height


class method: NSObject {
    
   
    
    //Return view Frame (y + height)
    func viewBetweenFrame (frame : CGRect) -> CGFloat {
        return frame.size.height + frame.origin.y
    }
    
    
    
    
    
    
    
    
    
    
    
}
