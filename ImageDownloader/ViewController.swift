//
//  ViewController.swift
//  ImageDownloader
//
//  Created by Maribel Montejano on 4/23/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadImage() {
        // 1) Create URL instance
        let northernURL = URL(string: "https://apod.nasa.gov/apod/image/1804/DragonAurora_Bastoni_4240.jpg")!
    }
}

