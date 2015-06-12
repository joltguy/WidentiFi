//
//  ViewController.swift
//  WidentiFi
//
//  Created by Jeff Marlow on 2015-06-04.
//  Copyright (c) 2015 Joltguy. All rights reserved.
//

import UIKit
import SystemConfiguration.CaptiveNetwork

class ViewController: UIViewController {

	@IBOutlet weak var networkName: UILabel!
	@IBOutlet weak var ipAddress: UILabel!
	@IBOutlet weak var symbolView: SymbolView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// I'm using an Objective-C class to listen for this Darwin Notification as it requires a C function pointer
		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), nil, NetworkNotifierCallback.notifierProc(), "com.apple.system.config.network_change", nil, CFNotificationSuspensionBehavior.DeliverImmediately)
		// My C function simply posts a nice NSNotification that I can listen for here in Swift
		NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("networkChanged"), name: "network.changed", object: nil)
	}
	
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		refresh()
	}
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	
	
	@IBAction func settingsButtonTapped(sender: UIButton) {
		openSettings()
	}

	func openSettings() {
		UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
	}
	
	func refresh() {
		updateIPAddress()
		if let ssid = getSSID() {
			networkName.text = ssid
			symbolView.artColor = WiFiStyleKit.goodColor
			symbolView.symbol = .OK
		} else {
			networkName.text = "Wi-Fi Network Unavailable"
			symbolView.artColor = WiFiStyleKit.badColor
			symbolView.symbol = .Problem
		}
	}
	
	func networkChanged() {
		println("Networking change detected. Refreshing the UI.")
		refresh()
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
	
	// Fetch external IP address by hitting a web service
	func updateIPAddress() {
		let ipChecker = NSURL(string: "http://checkip.dyndns.org")!
		var ip = ""
		
		let request = NSURLRequest(URL: ipChecker, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
		let queue = NSOperationQueue()
		NSURLConnection.sendAsynchronousRequest(request, queue: queue) {
			(response:NSURLResponse?, data:NSData?, error:NSError?) -> Void in
			if error == nil {
				if let responseData = data {
					if let html = NSString(data: responseData, encoding: NSUTF8StringEncoding) as? String,
					   let ip = html.matchesForRegex("\\b([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3})\\b").first {
						dispatch_async(dispatch_get_main_queue(), {
							self.ipAddress.text = ip
						})
					}
				}
			}
		}
	}

}

