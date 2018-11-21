//
//  ViewController.swift
//  com.awareframework.ios.sensor.rotation
//
//  Created by tetujin on 11/20/2018.
//  Copyright (c) 2018 tetujin. All rights reserved.
//

import UIKit
import com_awareframework_ios_sensor_rotation

class ViewController: UIViewController {

    var sensor:RotationSensor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sensor = RotationSensor.init(RotationSensor.Config().apply{config in
            config.debug = true
            // config.sensorObserver = Observer()
        })
        sensor?.start()
    }

//    class Observer:RotationObserver{
//        func onOnChanged(data: RotationData) {
//            print(data)
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

