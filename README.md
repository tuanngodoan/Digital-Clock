# Digital-Clock


- UI/UX : I use font Digital, background search google image. // So bad :( 

###Timer. 

 - Timer.Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    - timeInterval: number sec will repeat once
    - target: target /self : screen iphone
    - selector: #selector(func) : func repeat
    - repeats: true // after timeInterval. Is it repeat again? true is yes.
 
### GET time 

  - 
        let date  = Date() // get infomation date now
        let calendar = NSCalendar.current 
        let requestedComponents :NSCalendar.Unit = [  // type date
            NSCalendar.Unit.hour, 
            NSCalendar.Unit.minute,
            NSCalendar.Unit.second,
            NSCalendar.Unit.day,
            NSCalendar.Unit.month,
            NSCalendar.Unit.year,
            NSCalendar.Unit.weekOfYear,
        ]
        
        let components = (calendar as NSCalendar).components(requestedComponents, from: date) 
        
        
