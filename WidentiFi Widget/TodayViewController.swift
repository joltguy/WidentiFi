//
//  TodayViewController.swift
//  WidentiFi Widget
//
//  Created by Jeff Marlow on 2015-06-12.
//  Copyright (c) 2015 Joltguy. All rights reserved.
//

import UIKit
import NotificationCenter
import SystemConfiguration.CaptiveNetwork

class TodayViewController: UIViewController, NCWidgetProviding {
        
	@IBOutlet weak var infoLabel: UILabel!
	var previousNetwork: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.
		
		
		
		if let ssid = getSSID() {
			infoLabel.text = "✅ Connected to: \(ssid)"
			if ssid == previousNetwork {
				completionHandler(NCUpdateResult.NoData)
			}
			previousNetwork = ssid
		} else {
			infoLabel.text = "🚫 No Wi-Fi Connection"
		}

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
		
        completionHandler(NCUpdateResult.NewData)
    }
	
	// Fetch the SSID of the current WiFi connection
	// Based on this code: http://pastebin.com/VBahkiQu
	func getSSID() -> String? {
		var currentSSID:String?
		let interfaces = CNCopySupportedInterfaces()
		
		if interfaces != nil {
			let interfacesArray = interfaces.takeRetainedValue() as! [String]
			
			if interfacesArray.count > 0 {
				let interfaceName = interfacesArray[0] as String
				let unsafeInterfaceData = CNCopyCurrentNetworkInfo(interfaceName)
				if unsafeInterfaceData != nil {
					let interfaceData = unsafeInterfaceData.takeRetainedValue() as Dictionary!
					currentSSID = interfaceData["SSID"] as? String
				}
			}
		}
		return currentSSID
	}
    
}
