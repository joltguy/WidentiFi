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
        
	@IBOutlet weak var widgetButton: UIButton!
	var previousNetwork: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
	
	func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
		return UIEdgeInsetsMake(5.0, defaultMarginInsets.left, 5.0, defaultMarginInsets.right)
	}
	
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
		if let ssid = getSSID() {
			widgetButton.setTitle("✅ Connected to: \(ssid)", forState: .Normal)
			if ssid == previousNetwork {
				completionHandler(NCUpdateResult.NoData)
			}
			previousNetwork = ssid
		} else {
			widgetButton.setTitle("🚫 No Wi-Fi Connection", forState: .Normal)
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
    
	@IBAction func buttonTapped(sender: UIButton) {
		self.extensionContext?.openURL(NSURL(string: "widentifi://today")!, completionHandler: nil)
	}
}
