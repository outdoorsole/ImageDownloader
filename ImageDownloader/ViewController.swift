//
//  ViewController.swift
//  ImageDownloader
//
//  Created by Maribel Montejano on 4/23/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var imageStateLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let URLStrings = [
        "https://upload.wikimedia.org/wikipedia/commons/e/e5/SF-Giants-Logo.jpg",
        "https://cdn.spacetelescope.org/archives/images/screen/opo0328a.jpg",
        "https://cdn.spacetelescope.org/archives/images/screen/heic0506a.jpg",
        "https://cdn.spacetelescope.org/archives/images/screen/heic0206b.jpg",
        "https://cdn.spacetelescope.org/archives/images/wallpaper5/potw1538a.jpg",
        "https://cdn.spacetelescope.org/archives/images/screen/heic0604a.jpg",
        "https://cdn.spacetelescope.org/archives/images/screen/potw1442a.jpg",
        "https://cdn.spacetelescope.org/archives/images/screen/opo9925a.jpg",
        "https://cdn.spacetelescope.org/archives/images/screen/potw1119a.jpg",
        "https://cdn.spacetelescope.org/archives/images/screen/potw1108a.jpg",
        "https://cdn.spacetelescope.org/archives/images/screen/opo9919i.jpg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if imageStateLabel.text != nil {
            imageStateLabel.text = "No Image Selected"
        }
    }
    
    @IBAction func loadImagePressed(_ sender: UIButton) {
        imageStateLabel.text = ""
        self.activityIndicator.startAnimating()
        loadImage()
    }
    
    func loadImage() {
        // Select random string from URLStrings array
        let urlString = selectUrlString(number: randomNumGenerator())
        // 1) Create URL instance
        let northernURL = URL(string: urlString)!
        
        // 2) Create the URL task for the northernURL
        let task = URLSession.shared.dataTask(with: northernURL) {
            (data, response, error) in
            
            // 3) Declare a UIImage var to hold the image, named displayImage
            var displayImage: UIImage?
            
            // 4) Process the error with an if-let. If there is an error, then print it and set displayImage to nil
            if let error = error {
                print("Error in loadImage: \(error)")
                displayImage = nil
            }
            
            // 5) Process the data with an if-let, and if available, try to create a UIImage from the data
            if let imageData = data {
                displayImage = UIImage(data: imageData)
            }
            
            // 6) Pass this line back to the main thread. Set the self.theImage to displayImage
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.theImage.image = displayImage
            }
        }
        // 7) Start the task running
        task.resume()
    }
    
    func randomNumGenerator() -> Int {
        return Int(arc4random_uniform(10))
    }
    
    func selectUrlString(number: Int) -> String {
        return URLStrings[number]
    }
}

