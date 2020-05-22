//
//  ViewController.swift
//  corona
//
//  Created by Dalveer singh on 07/04/20.
//  Copyright © 2020 Dalveer singh. All rights reserved.
//

import UIKit
import WebKit
class SecondViewController: UIViewController,WKNavigationDelegate {
    var webView: WKWebView!
    override func loadView() {
            webView = WKWebView()
            webView.navigationDelegate = self
            view = webView
        }
        override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
load()
        }
    func load(){
        let url = URL(string: "https://google.com/covid19-map/?hl=en")!
            webView.load(URLRequest(url: url))
    }

    }
    


