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
    func btn_backB(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
    }

    //MARK: ***** init method *****
    func init_main() {
        
        view_top.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 64)
        
        lb_title.frame = CGRect(x: 0, y: 20, width: screenWidth, height: 44)
        
        btn_back.frame = CGRect(x: 0, y: 20, width: 44, height: 44)
        btn_back.addTarget(self, action: #selector(Vc_TTS.btn_backB(_:)), for: .touchUpInside)
        
        iv_topLine.frame = CGRect(x: 0, y: 63, width: screenWidth, height: 1)
    }
}
