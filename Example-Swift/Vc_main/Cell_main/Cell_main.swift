//
//  Cell_main.swift
//  Example-Swift
//
//  Created by Myoung.SC on 2016. 4. 27..
//  Copyright © 2016년 myoung. All rights reserved.
//

import UIKit

class Cell_main: UITableViewCell {

    @IBOutlet var lb_title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lb_title.frame = CGRect(x: 20, y: 0 , width: screenWidth-40, height: 45)
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
