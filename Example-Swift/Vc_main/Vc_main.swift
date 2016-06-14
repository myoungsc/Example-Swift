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

        self.navigationController?.navigationBarHidden = true
        view.backgroundColor = UIColor.whiteColor()
        
        init_data()
        init_main()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    //MARK: init-method
    func init_main() {
        
        view_top.frame = CGRectMake(0, 0, screenWidth, 64)
        iv_topline.frame = CGRectMake(0, 63, screenWidth, 1)
        lb_topTitle.frame = CGRectMake(0, 20, screenWidth, 44)
        
        tb_main.frame = CGRectMake(0, 64, screenWidth, screenHeight-64)
        tb_main.delegate = self
        tb_main.dataSource = self
        tb_main.registerNib(UINib(nibName: "Cell_main", bundle: nil), forCellReuseIdentifier: "cell")
        //tb_main.separatorStyle = UITableViewCellSeparatorStyle.None
        
        
        
        
        
        
        
    }

    
    //init_data
    func init_data() {
        
        arr_title = ["File Reference", "TTS"]
        
    }
    
    
    
    //MARK: UITableView Delegate and DataSource
    //Table cell count
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_title.count
    }
    
    //table cell height
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
    
    //table cell init
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! Cell_main
        
        cell.lb_title.text = arr_title[indexPath.row]
        
        
        return cell
        
    }
    
    //table cell selector
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        switch arr_title[indexPath.row] {
            
        case "File Reference" :
            self.navigationController?.pushViewController(Vc_fileReference(), animated: true)
        case "TTS" :
            self.navigationController?.pushViewController(Vc_TTS(), animated: true)
        default:
            break
       
        }
        
        
        
        
        
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
       
        
       
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
