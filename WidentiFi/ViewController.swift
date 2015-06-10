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
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	func openSettings() {
		UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		updateIPAddress()
		let ssid = getSSID()
		if ssid != "" {
			networkName.text = ssid
			symbolView.artColor = WiFiStyleKit.goodColor
			symbolView.symbol = .OK
		} else {
			symbolView.artColor = WiFiStyleKit.badColor
			symbolView.symbol = .Problem
		}
	}

	@IBAction func settingsButtonTapped(sender: UIButton) {
		openSettings()
	}
	
	// Fetch the SSID of the current WiFi connection
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
				}
			}
		}
		return currentSSID
	}
	
	
	func updateIPAddress() {
		let ipChecker = NSURL(string: "http://checkip.dyndns.org")!
		var ip = "..."
		
		let request = NSURLRequest(URL: ipChecker, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)
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

