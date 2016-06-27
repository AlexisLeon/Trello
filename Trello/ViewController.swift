//
//  ViewController.swift
//  Trello
//
//  Created by Alexis Leon on 6/26/16.
//  Copyright © 2016 Alexis Leon. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WebFrameLoadDelegate {

    @IBOutlet weak var webView: WebView!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.frameLoadDelegate = self
        self.progressIndicator.startAnimation(self)

        let url = "https://trello.com"
        self.webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func webView(sender: WebView!, didStartProvisionalLoadForFrame frame: WebFrame!)
    {
        self.progressIndicator.startAnimation(self)
        self.progressIndicator.hidden = false
    }

    func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!)
    {
        self.progressIndicator.stopAnimation(self)
        self.progressIndicator.hidden = true
    }
    
    @IBAction func goHelp(sender: AnyObject){
        let url = NSURL(string: "http://help.trello.com")
        NSWorkspace.sharedWorkspace().openURL(url!)
    }
}

