//
//  Extensions.swift
//  WidentiFi
//
//  Created by Jeff Marlow on 2015-06-10.
//  Copyright (c) 2015 Joltguy. All rights reserved.
//

import Foundation

// Credit for this String extension goes to this answer on StackOverflow:
// http://stackoverflow.com/a/27880748/771460
extension String {
	func rangeFromNSRange(nsRange : NSRange) -> Range<String.Index>? {
		let utf16start = self.utf16.startIndex
		if let from = String.Index(self.utf16.startIndex + nsRange.location, within: self),
			let to = String.Index(self.utf16.startIndex + nsRange.location + nsRange.length, within: self) {
				return from ..< to
		}
		return nil
	}
	
	func matchesForRegex(regex: String!) -> [String] {
		let regex = NSRegularExpression(pattern: regex,
			options: nil, error: nil)!
		let results = regex.matchesInString(self,
			options: nil, range: NSMakeRange(0, count(self.utf16)))
			as! [NSTextCheckingResult]
		return map(results) {
			self.substringWithRange(self.rangeFromNSRange($0.range)!)
		}
	}
}

