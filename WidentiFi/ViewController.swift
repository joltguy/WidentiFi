//
//  ViewController.swift
//  WidentiFi
//
//  Created by Jeff Marlow on 2015-06-04.
//  Copyright (c) 2015 Joltguy. All rights reserved.
//

import UIKit
import Foundation
import CoreFoundation
import SystemConfiguration.CaptiveNetwork

class ViewController: UIViewController {

	@IBOutlet weak var signalView: WiFiSignalView!
	@IBOutlet weak var networkName: UILabel!
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
//		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), nil, ViewController.networkChanged, "com.apple.system.config.network_change", nil, CFNotificationSuspensionBehavior.DeliverImmediately)
		
//		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), //center
//			NULL, // observer
//			{}, // callback
//			"com.apple.system.config.network_change", // event name
//			NULL, // object
//			CFNotificationSuspensionBehavior.DeliverImmediately);
	}
	
//	func networkChanged(center:CFNotificationCenter!, observer:UnsafeMutablePointer<Void>, name:CFString!, obj:UnsafePointer<Void>, userInfo:CFDictionary?) {
//		println("Network changed")
//	}
	
//	static onNotifyCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
//	{
//		NSString* notifyName = (NSString*)name;
//		// this check should really only be necessary if you reuse this one callback method
//		//  for multiple Darwin notification events
//		if ([notifyName isEqualToString:@"com.apple.system.config.network_change"]) {
//			// use the Captive Network API to get more information at this point
//			//  http://stackoverflow.com/a/4714842/119114
//		} else {
//			NSLog(@"intercepted %@", notifyName);
//		}
//	}
	
	// Found this function here: http://pastebin.com/VBahkiQu
	func getSSID() -> String {
		var currentSSID = ""
		let interfaces = CNCopySupportedInterfaces()
		
		if interfaces != nil {
			let interfacesArray = interfaces.takeRetainedValue() as! [String]
			
			if interfacesArray.count > 0 {
				let interfaceName = interfacesArray[0] as String
				let unsafeInterfaceData = CNCopyCurrentNetworkInfo(interfaceName)
				if unsafeInterfaceData != nil {
					let interfaceData = unsafeInterfaceData.takeRetainedValue() as Dictionary!
					currentSSID = interfaceData["SSID"] as! String
				} else {
					currentSSID = ""
				}
			} else {
				currentSSID = ""
			}
		} else {
			currentSSID = ""
		}
		return currentSSID
	}
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		signalView.onColor = self.view.tintColor
	}
	
	func openSettings() {
		UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		let ssid = getSSID()
		if ssid != "" {
			networkName.text = ssid
			signalView.turnOn()
		} else {
			signalView.turnOff()
		}
	}

	@IBAction func settingsButtonTapped(sender: UIButton) {
		openSettings()
	}

}

