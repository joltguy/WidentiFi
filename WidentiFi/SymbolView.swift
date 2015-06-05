//
//  SymbolView.swift
//  WidentiFi
//
//  Created by Jeff Marlow on 2015-06-05.
//  Copyright (c) 2015 Joltguy. All rights reserved.
//

import UIKit

typealias SymbolFunction = (CGRect,UIColor) -> Void

enum Symbol:Int {
	case Signal = 0, OK = 1, Problem = 2
	func code() -> SymbolFunction {
		switch(self) {
			case .Signal:
				return WiFiStyleKit.drawSignal
			case .OK:
				return WiFiStyleKit.drawCheckmark
			case .Problem:
				return WiFiStyleKit.drawExmark
		}
		
	}
}

@IBDesignable
class SymbolView: UIView {
	
	var symbol:Symbol = .Signal {
		didSet {
			setNeedsDisplay()
		}
	}
	
	@IBInspectable var symbolInt:Int = Symbol.Signal.rawValue {
		didSet {
			symbol = Symbol(rawValue: symbolInt) ?? .Signal
		}
	}
	
	@IBInspectable var artColor:UIColor = WiFiStyleKit.neutralColor

	override func drawRect(rect: CGRect) {
		let drawSymbol = symbol.code()
		drawSymbol(rect, artColor)
    }

}
