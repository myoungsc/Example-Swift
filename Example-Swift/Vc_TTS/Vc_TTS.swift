//
//  Vc_TTS.swift
//  Example-Swift
//
//  Created by Myoung.SC on 2016. 5. 14..
//  Copyright © 2016년 myoung. All rights reserved.
//

import UIKit

class Vc_TTS: UIViewController {

    @IBOutlet var view_top: UIView!
    @IBOutlet var btn_back: UIButton!
    @IBOutlet var lb_title: UILabel!
    @IBOutlet var iv_topLine: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        init_main()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: ***** Button method *****
    func btn_backB(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    //MARK: ***** init method *****
    func init_main() {
        
        view_top.frame = CGRectMake(0, 0, screenWidth, 64)
        
        lb_title.frame = CGRectMake(0, 20, screenWidth, 44)
        
        btn_back.frame = CGRectMake(0, 20, 44, 44)
        btn_back.addTarget(self, action: #selector(Vc_TTS.btn_backB(_:)), forControlEvents: .TouchUpInside)
        
        iv_topLine.frame = CGRectMake(0, 63, screenWidth, 1)
    }
}
