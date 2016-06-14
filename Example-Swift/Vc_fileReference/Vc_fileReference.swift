//
//  Vc_fileReference.swift
//  Example-Swift
//
//  Created by Myoung.SC on 2016. 4. 27..
//  Copyright © 2016년 myoung. All rights reserved.
//

import UIKit

class Vc_fileReference: UIViewController {

    @IBOutlet var view_top: UIView!
    @IBOutlet var iv_topLine: UIImageView!
    @IBOutlet var lb_topTitle: UILabel!
    @IBOutlet var btn_back: UIButton!
    
    @IBOutlet var sc_fileRef: UIScrollView!
   
    @IBOutlet var btn_folderCreate: UIButton!
    
    @IBOutlet var btn_imgSave: UIButton!
    @IBOutlet var btn_textSave: UIButton!
   
    @IBOutlet var btn_delPath: UIButton!
    
    @IBOutlet var btn_imgLoad: UIButton!
    @IBOutlet var btn_textLoad: UIButton!
    
    let iv_loadImg = UIImageView()
    let btn_hideIv = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        init_frame()
        
        // my simulator home Director
        // your mac Click finder after commend+shift+G(hot key)
        let homeDir = NSHomeDirectory()
        print(homeDir)
        
        
        let filemanager:NSFileManager = NSFileManager()
        let files = filemanager.enumeratorAtPath(homeDir)
        while let file = files?.nextObject() {
            print("file list = \(file)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    //MARK: Init-Method
    // init-frame
    func init_frame() {
        
        view_top.frame = CGRectMake(0, 0, screenWidth, 64)
        iv_topLine.frame = CGRectMake(0, 63, screenWidth, 1)
        lb_topTitle.frame = CGRectMake(0, 20, screenWidth, 44)
        btn_back.frame = CGRectMake(5, 20, 44, 44)
        btn_back.addTarget(self, action: #selector(Vc_fileReference.btn_backB(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        sc_fileRef.frame = CGRectMake(0, 64, screenWidth, screenHeight-64)
        
        var viewy : CGFloat = 20
        btn_folderCreate.frame = CGRectMake(15, viewy, screenWidth-30, 30)
        btn_folderCreate.addTarget(self, action: #selector(Vc_fileReference.btn_folderCreateB(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        viewy = method().viewBetweenFrame(btn_folderCreate.frame)+50
        btn_imgSave.frame = CGRectMake(15, viewy, screenWidth-30, 30)
        btn_imgSave.addTarget(self, action: #selector(Vc_fileReference.btn_saveImgFile(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        viewy = method().viewBetweenFrame(btn_imgSave.frame)+20
        btn_textSave.frame = CGRectMake(15, viewy, screenWidth-30, 30)
        btn_textSave.addTarget(self, action: #selector(Vc_fileReference.btn_saveTextFile(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        viewy = method().viewBetweenFrame(btn_textSave.frame)+50
        btn_imgLoad.frame = CGRectMake(15, viewy, screenWidth-30, 30)
        btn_imgLoad.addTarget(self, action: #selector(Vc_fileReference.btn_imgLoadB(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        viewy = method().viewBetweenFrame(btn_imgLoad.frame)+20
        btn_textLoad.frame = CGRectMake(15, viewy, screenWidth-30, 30)
        btn_textLoad.addTarget(self, action: #selector(Vc_fileReference.btn_textLoadB(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        viewy = method().viewBetweenFrame(btn_textLoad.frame)+50
        btn_delPath.frame = CGRectMake(15, viewy, screenWidth-30, 30)
        btn_delPath.addTarget(self, action: #selector(Vc_fileReference.btn_delPathB(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        // Crate UIImageVIew, and UIButton.
        // Because UIImageView is Load Image See and UIButton is Delete UIImageview.
        viewy = method().viewBetweenFrame(btn_delPath.frame)+20
        
        iv_loadImg.frame =  CGRectMake(15, viewy, screenWidth-30, screenWidth-30)
        iv_loadImg.contentMode = UIViewContentMode.ScaleAspectFit
        iv_loadImg.hidden = true
        sc_fileRef.addSubview(iv_loadImg)
        
        btn_hideIv.frame = CGRectMake(15, viewy, screenWidth-30, screenWidth-30)
        btn_hideIv.addTarget(self, action: #selector(Vc_fileReference.btn_hideIvB(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        sc_fileRef.addSubview(btn_hideIv)
        
        
        let f_height = method().viewBetweenFrame(btn_hideIv.frame)+20
        sc_fileRef.contentSize = CGSizeMake(screenWidth, f_height)
    }
    
    //MARK: UIButton-Method
    // back to main
    func btn_backB(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
        
    
    // Folder_Create
    func btn_folderCreateB(sender: UIButton) {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let str_dir = paths[0]
        let str_createDir = str_dir+"/FolderName"
        
        if !(NSFileManager.defaultManager().fileExistsAtPath(str_createDir)) {
            do {
                try NSFileManager.defaultManager().createDirectoryAtPath(str_createDir, withIntermediateDirectories: false, attributes: nil)
            } catch {
                let error = error as NSError
                NSLog(" error =  \(error.localizedDescription)")
            }
        }
    }
    
    
    // save Image-File in Create_Folder
    func btn_saveImgFile(sender: UIButton) {
        
        let img_save = UIImage(named: "korea_actor_suji.jpg")
        
        //UIImage change NSData
        let data_save : NSData = UIImageJPEGRepresentation(img_save!, 1.0)!
        
        //Data write create Folder
        let str_saveFilePath = return_makeDirPath("korea_actor_suji.jpg")
        
        if !(NSFileManager.defaultManager().fileExistsAtPath(str_saveFilePath)) {
            data_save.writeToFile(str_saveFilePath, atomically: true)
        } else {
            print("Already exist FileName")
        }
    }
    
    // save Text-File in Create_Folder
    func btn_saveTextFile(sender: UIButton) {
        
        let str_save = "Hello \nMy Name is Myoung"
        //Data write create Folder
        let str_saveFilePath = return_makeDirPath("Introduce.txt")
       
        if !(NSFileManager.defaultManager().fileExistsAtPath(str_saveFilePath)) {
            do {
                try str_save.writeToFile(str_saveFilePath, atomically: false, encoding: NSUTF8StringEncoding)
            }catch {
                let error = error as NSError
                NSLog(" error =  \(error.localizedDescription)")
            }
            
        } else {
            print("Already exist FileName")
        }
    }
    
    // Load Image-File in Create_Folder
    func btn_imgLoadB(sender: UIButton) {
        // get file path
        let str_fileName = return_makeDirPath("korea_actor_suji.jpg")
        
        //Optional Check
        if let image = UIImage(contentsOfFile: str_fileName) {
            let img_loadImage = image
            iv_loadImg.image = img_loadImage
            iv_loadImg.hidden = false
        } else {
            print("not file")
        }
        
        
        
    }
 
    // Load Text-File in Create_Folder
    func btn_textLoadB(sender: UIButton) {
        // get file path
        let str_fileName = return_makeDirPath("Introduce.txt")
        
        var str_loadText : String = ""
        do{
            str_loadText = try String(contentsOfFile: str_fileName, encoding: NSUTF8StringEncoding)
        }catch {
            let error = error as NSError
            NSLog(" error =  \(error.localizedDescription)")
        }
        
        print("*********************")
        print(str_loadText)
        print("*********************")
    }
    
    
    // Delete File Path
    func btn_delPathB(sender: UIButton) {
        
        //get file path
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let str_dir = paths[0]
        //Folder
        let str_folderDir = str_dir+"/FolderName"
        // Image
        //let str_imageFilePath = str_folderDir + "/korea_actor_suji.jpg"
        // Text
        //let str_textFilePath = str_folderDir + "/Introduce.txt"
        
        if (NSFileManager.defaultManager().fileExistsAtPath(str_folderDir)) {
            do {
                try  NSFileManager.defaultManager().removeItemAtPath(str_folderDir)
                print("success")
            }catch {
                let error = error as NSError
                NSLog(" error =  \(error.localizedDescription)")
            }
        } else {
            print("File Not Found")
        }
    }
    
    // iv_loadImg is hidden 
    func btn_hideIvB(sender: UIButton) {
        if !iv_loadImg.hidden {
            iv_loadImg.hidden = true
        }
    }
    
 
    //MARK: Etc-Method
    // Return-Make dir path + file_name
    func return_makeDirPath(str_fileName: String) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let str_dir = paths[0]
        
        let str_returnDir = str_dir+"/FolderName"+"/\(str_fileName)"
        
        return str_returnDir
    }

}
