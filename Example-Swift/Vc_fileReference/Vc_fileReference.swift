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
        
        
        let filemanager:FileManager = FileManager()
        let files = filemanager.enumerator(atPath: homeDir)
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
        
        view_top.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 64)
        iv_topLine.frame = CGRect(x: 0, y: 63, width: screenWidth, height: 1)
        lb_topTitle.frame = CGRect(x: 0, y: 20, width: screenWidth, height: 44)
        btn_back.frame = CGRect(x: 5, y: 20, width: 44, height: 44)
        btn_back.addTarget(self, action: #selector(Vc_fileReference.btn_backB(_:)), for: UIControlEvents.touchUpInside)
        
        
        sc_fileRef.frame = CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64)
        
        var viewy : CGFloat = 20
        btn_folderCreate.frame = CGRect(x: 15, y: viewy, width: screenWidth-30, height: 30)
        btn_folderCreate.addTarget(self, action: #selector(Vc_fileReference.btn_folderCreateB(_:)), for: UIControlEvents.touchUpInside)
        
        viewy = Method().viewBetweenFrame(btn_folderCreate.frame)+50
        btn_imgSave.frame = CGRect(x: 15, y: viewy, width: screenWidth-30, height: 30)
        btn_imgSave.addTarget(self, action: #selector(Vc_fileReference.btn_saveImgFile(_:)), for: UIControlEvents.touchUpInside)
        
        viewy = Method().viewBetweenFrame(btn_imgSave.frame)+20
        btn_textSave.frame = CGRect(x: 15, y: viewy, width: screenWidth-30, height: 30)
        btn_textSave.addTarget(self, action: #selector(Vc_fileReference.btn_saveTextFile(_:)), for: UIControlEvents.touchUpInside)
        
        viewy = Method().viewBetweenFrame(btn_textSave.frame)+50
        btn_imgLoad.frame = CGRect(x: 15, y: viewy, width: screenWidth-30, height: 30)
        btn_imgLoad.addTarget(self, action: #selector(Vc_fileReference.btn_imgLoadB(_:)), for: UIControlEvents.touchUpInside)
        
        viewy = Method().viewBetweenFrame(btn_imgLoad.frame)+20
        btn_textLoad.frame = CGRect(x: 15, y: viewy, width: screenWidth-30, height: 30)
        btn_textLoad.addTarget(self, action: #selector(Vc_fileReference.btn_textLoadB(_:)), for: UIControlEvents.touchUpInside)
        
        
        viewy = Method().viewBetweenFrame(btn_textLoad.frame)+50
        btn_delPath.frame = CGRect(x: 15, y: viewy, width: screenWidth-30, height: 30)
        btn_delPath.addTarget(self, action: #selector(Vc_fileReference.btn_delPathB(_:)), for: UIControlEvents.touchUpInside)
        
        // Crate UIImageVIew, and UIButton.
        // Because UIImageView is Load Image See and UIButton is Delete UIImageview.
        viewy = Method().viewBetweenFrame(btn_delPath.frame)+20
        
        iv_loadImg.frame =  CGRect(x: 15, y: viewy, width: screenWidth-30, height: screenWidth-30)
        iv_loadImg.contentMode = UIViewContentMode.scaleAspectFit
        iv_loadImg.isHidden = true
        sc_fileRef.addSubview(iv_loadImg)
        
        btn_hideIv.frame = CGRect(x: 15, y: viewy, width: screenWidth-30, height: screenWidth-30)
        btn_hideIv.addTarget(self, action: #selector(Vc_fileReference.btn_hideIvB(_:)), for: UIControlEvents.touchUpInside)
        sc_fileRef.addSubview(btn_hideIv)
        
        
        let f_height = Method().viewBetweenFrame(btn_hideIv.frame)+20
        sc_fileRef.contentSize = CGSize(width: screenWidth, height: f_height)
    }
    
    //MARK: UIButton-Method
    // back to main
    func btn_backB(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
        
    
    // Folder_Create
    func btn_folderCreateB(_ sender: UIButton) {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let str_dir = paths[0]
        let str_createDir = str_dir+"/FolderName"
        
        if !(FileManager.default.fileExists(atPath: str_createDir)) {
            do {
                try FileManager.default.createDirectory(atPath: str_createDir, withIntermediateDirectories: false, attributes: nil)
            } catch {
                let error = error as NSError
                NSLog(" error =  \(error.localizedDescription)")
            }
        }
    }
    
    
    // save Image-File in Create_Folder
    func btn_saveImgFile(_ sender: UIButton) {
        
        let img_save = UIImage(named: "korea_actor_suji.jpg")
        
        //UIImage change NSData
        let data_save : Data = UIImageJPEGRepresentation(img_save!, 1.0)!
        
        //Data write create Folder
        let str_saveFilePath = return_makeDirPath("korea_actor_suji.jpg")
        
        if !(FileManager.default.fileExists(atPath: str_saveFilePath)) {
            try? data_save.write(to: URL(fileURLWithPath: str_saveFilePath), options: [.atomic])
        } else {
            print("Already exist FileName")
        }
    }
    
    // save Text-File in Create_Folder
    func btn_saveTextFile(_ sender: UIButton) {
        
        let str_save = "Hello \nMy Name is Myoung"
        //Data write create Folder
        let str_saveFilePath = return_makeDirPath("Introduce.txt")
       
        if !(FileManager.default.fileExists(atPath: str_saveFilePath)) {
            do {
                try str_save.write(toFile: str_saveFilePath, atomically: false, encoding: String.Encoding.utf8)
            }catch {
                let error = error as NSError
                NSLog(" error =  \(error.localizedDescription)")
            }
            
        } else {
            print("Already exist FileName")
        }
    }
    
    // Load Image-File in Create_Folder
    func btn_imgLoadB(_ sender: UIButton) {
        // get file path
        let str_fileName = return_makeDirPath("korea_actor_suji.jpg")
        
        //Optional Check
        if let image = UIImage(contentsOfFile: str_fileName) {
            let img_loadImage = image
            iv_loadImg.image = img_loadImage
            iv_loadImg.isHidden = false
        } else {
            print("not file")
        }
        
        
        
    }
 
    // Load Text-File in Create_Folder
    func btn_textLoadB(_ sender: UIButton) {
        // get file path
        let str_fileName = return_makeDirPath("Introduce.txt")
        
        var str_loadText : String = ""
        do{
            str_loadText = try String(contentsOfFile: str_fileName, encoding: String.Encoding.utf8)
        }catch {
            let error = error as NSError
            NSLog(" error =  \(error.localizedDescription)")
        }
        
        print("*********************")
        print(str_loadText)
        print("*********************")
    }
    
    
    // Delete File Path
    func btn_delPathB(_ sender: UIButton) {
        
        //get file path
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let str_dir = paths[0]
        //Folder
        let str_folderDir = str_dir+"/FolderName"
        // Image
        //let str_imageFilePath = str_folderDir + "/korea_actor_suji.jpg"
        // Text
        //let str_textFilePath = str_folderDir + "/Introduce.txt"
        
        if (FileManager.default.fileExists(atPath: str_folderDir)) {
            do {
                try  FileManager.default.removeItem(atPath: str_folderDir)
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
    func btn_hideIvB(_ sender: UIButton) {
        if !iv_loadImg.isHidden {
            iv_loadImg.isHidden = true
        }
    }
    
 
    //MARK: Etc-Method
    // Return-Make dir path + file_name
    func return_makeDirPath(_ str_fileName: String) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let str_dir = paths[0]
        
        let str_returnDir = str_dir+"/FolderName"+"/\(str_fileName)"
        
        return str_returnDir
    }

}
