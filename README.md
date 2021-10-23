# AWARE: Rotation

[![CI Status](https://img.shields.io/travis/awareframework/com.awareframework.ios.sensor.rotation.svg?style=flat)](https://travis-ci.org/awareframework/com.awareframework.ios.sensor.rotation)
[![Version](https://img.shields.io/cocoapods/v/com.awareframework.ios.sensor.rotation.svg?style=flat)](https://cocoapods.org/pods/com.awareframework.ios.sensor.rotation)
[![License](https://img.shields.io/cocoapods/l/com.awareframework.ios.sensor.rotation.svg?style=flat)](https://cocoapods.org/pods/com.awareframework.ios.sensor.rotation)
[![Platform](https://img.shields.io/cocoapods/p/com.awareframework.ios.sensor.rotation.svg?style=flat)](https://cocoapods.org/pods/com.awareframework.ios.sensor.rotation)

This sensor module allows us to access the **rotation rate** of the device. A rotation data contains data specifying the device’s rate of rotation around three axes. The value of this property contains a measurement of gyroscope data whose bias has been removed by Core Motion algorithms. Please check the link below for details.

[ Apple | Getting Processed Device-Motion Data ](https://developer.apple.com/documentation/coremotion/getting_processed_device-motion_data)

[ Apple | CMDeviceMotion | rotation ](https://developer.apple.com/documentation/coremotion/cmdevicemotion/1615967-rotationrate)

## Requirements
iOS 10 or later

## Installation

com.awareframework.ios.sensor.rotation is available through [CocoaPods](https://cocoapods.org). 

1. To install it, simply add the following line to your Podfile:

```ruby
pod 'com.awareframework.ios.sensor.rotation'
```

2. Import com.awareframework.ios.sensor.rotation library into your source code.
```swift
import com_awareframework_ios_sensor_rotation
```

## Public functions
### RotationSensor

+ `init(config:RotationSensor.Config?)` : Initializes the rotation sensor with the optional configuration.
+ `start()`: Starts the rotation sensor with the optional configuration.
+ `stop()`: Stops the service.

### RotationSensor.Config

Class to hold the configuration of the sensor.

#### Fields
+ `sensorObserver: RotationObserver`: Callback for live data updates.
+ `frequency: Int`: Data samples to collect per second (Hz). (default = 5)
+ `period: Double`: Period to save data in minutes. (default = 1)
+ `threshold: Double`: If set, do not record consecutive points if change in value is less than the set value.
+ `enabled: Boolean` Sensor is enabled or not. (default = `false`)
+ `debug: Boolean` enable/disable logging to Xcode console. (default = `false`)
+ `label: String` Label for the data. (default = "")
+ `deviceId: String` Id of the device that will be associated with the events and the sensor. (default = "")
+ `dbEncryptionKey` Encryption key for the database. (default = `null`)
+ `dbType: Engine` Which db engine to use for saving data. (default = `Engine.DatabaseType.NONE`)
+ `dbPath: String` Path of the database. (default = "aware_rotation")
+ `dbHost: String` Host for syncing the database. (default = `null`)

## Broadcasts

### Fired Broadcasts

+ `RotationSensor.ACTION_AWARE_ROTATION` fired when rotation saved data to db after the period ends.

### Received Broadcasts

+ `RotationSensor.ACTION_AWARE_ROTATION_START`: received broadcast to start the sensor.
+ `RotationSensor.ACTION_AWARE_ROTATION_STOP`: received broadcast to stop the sensor.
+ `RotationSensor.ACTION_AWARE_ROTATION_SYNC`: received broadcast to send sync attempt to the host.
+ `RotationSensor.ACTION_AWARE_ROTATION_SET_LABEL`: received broadcast to set the data label. Label is expected in the ``RotationSensor.EXTRA_LABEL` field of the intent extras.

## Data Representations

### `Rotation Data

Contains the raw sensor data.

| Field     | Type   | Description                                                     |
| --------- | ------ | --------------------------------------------------------------- |
| x         | Double  | value of X axis                                                 |
| y         | Double  | value of Y axis                                                 |
| z         | Double  | value of Z axis                                                 |
| label     | String | Customizable label. Useful for data calibration or traceability |
| deviceId  | String | AWARE device UUID                                               |
| label     | String | Customizable label. Useful for data calibration or traceability |
| timestamp | Int64   | unixtime milliseconds since 1970                                |
| timezone  | Int    | Raw timezone offset of the device                          |
| os        | String | Operating system of the device (ex. ios)                    |



## Example usage
```swift
// Do any additional setup after loading the view, typically from a nib.
let rotationSensor = RotationSensor.init(RotationSensor.Config().apply{ config in
    config.sensorObserver = Observer()
    config.debug = true
})
rotationSensor?.start()
```

```swift
class Observer:RotationObserver{
    func onDataChanged(data: RotationData) {
        // Your code here..
    }
}
```


## Author

Yuuki Nishiyama, yuukin@iis.u-tokyo.ac.jp

## License

Copyright (c) 2021 AWARE Mobile Context Instrumentation Middleware/Framework (http://www.awareframework.com)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
