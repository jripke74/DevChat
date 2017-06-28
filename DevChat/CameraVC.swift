//
//  ViewController.swift
//  DevChat
//
//  Created by Jeff Ripke on 6/27/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

class CameraVC: AAPLCameraViewController {
    
    @IBOutlet weak var previewView: AAPLPreviewView!
    
    override func viewDidLoad() {
        self._previewView = previewView
        super.viewDidLoad()
    }
}
