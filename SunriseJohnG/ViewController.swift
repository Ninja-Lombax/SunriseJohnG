//
//  ViewController.swift
//  SunriseJohnG
//
//  Created by John Grasser on 3/6/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let url = NSURL(string: "https://api.sunrise-sunset.org/json?lat=42.2590&lng=-88.3691&date=today")
        {
            if let data = NSData(contentsOf: url as URL)
            {
                do
                {
                    
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                    
                    let newDict = parsed
                    

                    
                    self.sunriseTime.text = "\(newDict["results"]!["sunrise"]!!)"
                    self.sunsetTime.text = "\(newDict["results"]!["sunset"]!!)"
                    self.dayLength.text = "\(newDict["results"]!["day_length"]!!)"
                }
                catch let error as NSError {
                    print("A JSON parsing error occurred. Here are the details:\n \(error)")
                    
                }
            }
        }
        
    }
    
    @IBOutlet var sunriseTime: UILabel!
    
    @IBOutlet var sunsetTime: UILabel!
    
    @IBOutlet var dayLength: UILabel!
}

