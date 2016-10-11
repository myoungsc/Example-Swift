//
//  method.swift
//  Example-Swift
//
//  Created by Myoung.SC on 2016. 4. 27..
//  Copyright © 2016년 myoung. All rights reserved.
//

import UIKit

//Device Screen Size
let screenWidth : CGFloat = UIScreen.main.bounds.size.width
let screenHeight : CGFloat = UIScreen.main.bounds.size.height


class Method: NSObject {
    
   
    
    //Return view Frame (y + height)
    func viewBetweenFrame (_ frame : CGRect) -> CGFloat {
        return frame.size.height + frame.origin.y
    }
    
    
    
    
    
    
    
    
    
    
    
}
