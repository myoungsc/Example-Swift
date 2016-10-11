//
//  Vc_main.swift
//  Example-Swift
//
//  Created by Myoung.SC on 2016. 4. 27..
//  Copyright © 2016년 myoung. All rights reserved.
//

import UIKit

class Vc_main: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var view_top: UIView!
    @IBOutlet var iv_topline: UIImageView!
    @IBOutlet var lb_topTitle: UILabel!
    
    
    @IBOutlet var tb_main: UITableView!
    
    var arr_title : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.white
        
        init_data()
        init_main()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    //MARK: init-method
    func init_main() {
        
        view_top.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 64)
        iv_topline.frame = CGRect(x: 0, y: 63, width: screenWidth, height: 1)
        lb_topTitle.frame = CGRect(x: 0, y: 20, width: screenWidth, height: 44)
        
        tb_main.frame = CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64)
        tb_main.delegate = self
        tb_main.dataSource = self
        tb_main.register(UINib(nibName: "Cell_main", bundle: nil), forCellReuseIdentifier: "cell")
        //tb_main.separatorStyle = UITableViewCellSeparatorStyle.None
        
    }

    
    //init_data
    func init_data() {
        
        arr_title = ["File Reference", "TTS"]
        
    }
    
    
    
    //MARK: UITableView Delegate and DataSource
    //Table cell count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_title.count
    }
    
    //table cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    //table cell init
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell_main
        
        cell.lb_title.text = arr_title[(indexPath as NSIndexPath).row]
        
        
        return cell
        
    }
    
    //table cell selector
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch arr_title[(indexPath as NSIndexPath).row] {
            
        case "File Reference" :
            self.navigationController?.pushViewController(Vc_fileReference(), animated: true)
        case "TTS" :
            self.navigationController?.pushViewController(Vc_TTS(), animated: true)
        default:
            break
       
        }
        
        
        
        
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
       
        
       
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
