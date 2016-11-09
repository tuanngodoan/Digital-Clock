//
//  ViewController.swift
//  Digital Clock
//
//  Created by Doãn Tuấn on 11/9/16.
//  Copyright © 2016 doantuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBackground: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelWeek: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelPMAM: UILabel!
    var time :Timer!
    var timeBackground : Timer!
    let imageBackground :[String] = ["b1.jpg","b2.jpg","b3.jpg","b4.jpg","b6.jpg","b7.jpg","b8.jpg","b9.jpg","b10.jpg","b11.jpg","b12.jpg","b0.jpg"]
    
    var i :Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        timeBackground = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.updateBG), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Update background
    
    func updateBG(){
        i = i+1
        if i > imageBackground.count-1{
            i = 0
        }
        let image = UIImage(named: imageBackground[i])
        
        viewBackground.image = image

    }
    
    // Update time
    
    func updateTime(){
        
        let date  = Date()
        let calendar = NSCalendar.current
        let requestedComponents :NSCalendar.Unit = [
            NSCalendar.Unit.hour,
            NSCalendar.Unit.minute,
            NSCalendar.Unit.second,
            NSCalendar.Unit.day,
            NSCalendar.Unit.month,
            NSCalendar.Unit.year,
            NSCalendar.Unit.weekOfYear,
        ]
        
        let components = (calendar as NSCalendar).components(requestedComponents, from: date)
        
        var hour = components.hour
        let min = components.minute
        let second = components.second
        let weekOfYear = components.weekOfYear
        let day = components.day
        let month = components.month
        let year = components.year
        
        if hour! > 12 {
            hour = hour! - 12
            labelPMAM.text = "PM"
        }else{
            labelPMAM.text = "AM"
        }
        
        labelTime.text = pasZero(hour!) + ":" + pasZero(min!) + ":" + pasZero(second!)
        labelWeek.text = "WOY: " + pasZero(weekOfYear!)
        labelDate.text = pasZero(day!) + "/" + pasZero(month!) + "/" + pasZero(year!)
        
        
    }
    // Pasre Zero
    func pasZero(_ num :Int) -> String{
        
        let temp = (num < 10 ? "0":"") + String(num)
        
        return temp
    }
}

