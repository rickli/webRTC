//
//  ViewController.swift
//  webRTC
//
//  Created by King on 2019/7/17.
//  Copyright © 2019 Rick. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, WKScriptMessageHandler {

    @IBOutlet var webView: WKWebView!
    
    var imagePicker: UIImagePickerController!
    
    let webConfiguration = WKWebViewConfiguration()
    

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage){
        let body = message.body as! String
        if message.name == "logger" {
            print("JS log:\(body)")
            return
        }
        //Other logic
    }
    
//    override func loadView() {
//        let contentController = WKUserContentController ()
//        
//        let js : String = "window.webkit.messageHandlers.logger.postMessage('Hello from JavaScript')"//"window.webkit.messageHandlers.logger.postMessage('Hello from JavaScript');"
//        let userScript = WKUserScript ( source : js, injectionTime : WKUserScriptInjectionTime.atDocumentEnd , forMainFrameOnly : false )
//        contentController.removeAllUserScripts ()
//        contentController.addUserScript (userScript)
//        contentController.add (self, name : "logger")
//        
//        webConfiguration.userContentController = contentController
//        webView = WKWebView ( frame : .zero , configuration : webConfiguration)
//        webView.uiDelegate = self
//        webView.navigationDelegate = self
//        view = webView
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        handleLoadWeb()
    }

    @IBAction func tapTakePhotoBtn(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tapInfoBtn(_ sender: Any) {
        handleLoadWeb()
    }
    
    func handleLoadWeb() {
        let myURL = URL(string:"https://algorithm-master.github.io/Books/playVideo/playVideo.html")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}

