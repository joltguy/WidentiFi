//
//  WiFiSignalView.swift
//  WiFiWatcher
//
//  Created by Jeff Marlow on 2015-05-29.
//  Copyright (c) 2015 Joltguy. All rights reserved.
//

import UIKit

@IBDesignable class WiFiSignalView: UIView
{
	@IBInspectable var barColor:UIColor = UIColor.grayColor()
	
	override func drawRect(rect: CGRect) {
		drawSignal(frame:rect)
	}
	
	func drawSignal(#frame:CGRect) {
		
		let fillColor = barColor
		
		//// Subframes
		let bars: CGRect = CGRectMake(frame.minX, frame.minY + 44.15, floor((frame.width) * 0.99964 - 0.34) + 0.84, floor((frame.height - 44.15) * 0.78558 + 43.79) - 43.29)
		
		
		//// Bars
		//// Bar3 Drawing
		var bar3Path = UIBezierPath()
		bar3Path.moveToPoint(CGPointMake(bars.minX + 0.99809 * bars.width, bars.minY + 0.29214 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.99679 * bars.width, bars.minY + 0.28992 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.99771 * bars.width, bars.minY + 0.29135 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.99727 * bars.width, bars.minY + 0.29060 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + -0.00000 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.86409 * bars.width, bars.minY + 0.10296 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.68766 * bars.width, bars.minY + -0.00000 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.00325 * bars.width, bars.minY + 0.28988 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.31235 * bars.width, bars.minY + -0.00000 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.13594 * bars.width, bars.minY + 0.10294 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.00000 * bars.width, bars.minY + 0.30086 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.00118 * bars.width, bars.minY + 0.29276 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.00000 * bars.width, bars.minY + 0.29671 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.00321 * bars.width, bars.minY + 0.31179 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.00000 * bars.width, bars.minY + 0.30495 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.00115 * bars.width, bars.minY + 0.30889 * bars.height))
		bar3Path.addLineToPoint(CGPointMake(bars.minX + 0.07586 * bars.width, bars.minY + 0.41413 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.08361 * bars.width, bars.minY + 0.41866 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.07791 * bars.width, bars.minY + 0.41703 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.08070 * bars.width, bars.minY + 0.41866 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.09137 * bars.width, bars.minY + 0.41413 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.08652 * bars.width, bars.minY + 0.41866 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.08931 * bars.width, bars.minY + 0.41703 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 0.17526 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.20069 * bars.width, bars.minY + 0.26009 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.34582 * bars.width, bars.minY + 0.17526 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.90864 * bars.width, bars.minY + 0.41413 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.65418 * bars.width, bars.minY + 0.17526 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.79931 * bars.width, bars.minY + 0.26010 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.91639 * bars.width, bars.minY + 0.41866 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.91069 * bars.width, bars.minY + 0.41703 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.91348 * bars.width, bars.minY + 0.41866 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.92414 * bars.width, bars.minY + 0.41413 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.91930 * bars.width, bars.minY + 0.41866 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.92209 * bars.width, bars.minY + 0.41703 * bars.height))
		bar3Path.addLineToPoint(CGPointMake(bars.minX + 0.99679 * bars.width, bars.minY + 0.31178 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 1.00000 * bars.width, bars.minY + 0.30085 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.99884 * bars.width, bars.minY + 0.30888 * bars.height), controlPoint2: CGPointMake(bars.minX + 1.00000 * bars.width, bars.minY + 0.30495 * bars.height))
		bar3Path.addCurveToPoint(CGPointMake(bars.minX + 0.99809 * bars.width, bars.minY + 0.29214 * bars.height), controlPoint1: CGPointMake(bars.minX + 1.00000 * bars.width, bars.minY + 0.29775 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.99934 * bars.width, bars.minY + 0.29471 * bars.height))
		bar3Path.closePath()
		bar3Path.miterLimit = 4;
		
		fillColor.setFill()
		bar3Path.fill()
		
		
		//// Bar2 Drawing
		var bar2Path = UIBezierPath()
		bar2Path.moveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 0.27067 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.13922 * bars.width, bars.minY + 0.48155 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.36386 * bars.width, bars.minY + 0.27067 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.23574 * bars.width, bars.minY + 0.34556 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.13922 * bars.width, bars.minY + 0.50340 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.13494 * bars.width, bars.minY + 0.48758 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.13494 * bars.width, bars.minY + 0.49737 * bars.height))
		bar2Path.addLineToPoint(CGPointMake(bars.minX + 0.21164 * bars.width, bars.minY + 0.60542 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.21939 * bars.width, bars.minY + 0.60995 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.21369 * bars.width, bars.minY + 0.60832 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.21648 * bars.width, bars.minY + 0.60995 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.22715 * bars.width, bars.minY + 0.60542 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.22230 * bars.width, bars.minY + 0.60995 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.22509 * bars.width, bars.minY + 0.60832 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 0.44593 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.30015 * bars.width, bars.minY + 0.50257 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.39705 * bars.width, bars.minY + 0.44593 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.77285 * bars.width, bars.minY + 0.60542 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.60296 * bars.width, bars.minY + 0.44593 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.69986 * bars.width, bars.minY + 0.50257 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.78061 * bars.width, bars.minY + 0.60995 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.77491 * bars.width, bars.minY + 0.60832 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.77770 * bars.width, bars.minY + 0.60995 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.78837 * bars.width, bars.minY + 0.60542 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.78352 * bars.width, bars.minY + 0.60995 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.78631 * bars.width, bars.minY + 0.60832 * bars.height))
		bar2Path.addLineToPoint(CGPointMake(bars.minX + 0.86078 * bars.width, bars.minY + 0.50340 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.86400 * bars.width, bars.minY + 0.49247 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.86284 * bars.width, bars.minY + 0.50050 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.86400 * bars.width, bars.minY + 0.49657 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.86078 * bars.width, bars.minY + 0.48154 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.86400 * bars.width, bars.minY + 0.48837 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.86285 * bars.width, bars.minY + 0.48444 * bars.height))
		bar2Path.addCurveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 0.27067 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.76426 * bars.width, bars.minY + 0.34556 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.63614 * bars.width, bars.minY + 0.27067 * bars.height))
		bar2Path.closePath()
		bar2Path.miterLimit = 4;
		
		fillColor.setFill()
		bar2Path.fill()
		
		
		//// Bar1 Drawing
		var bar1Path = UIBezierPath()
		bar1Path.moveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 0.54133 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.27500 * bars.width, bars.minY + 0.67284 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.41510 * bars.width, bars.minY + 0.54133 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.33519 * bars.width, bars.minY + 0.58804 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.27179 * bars.width, bars.minY + 0.68378 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.27294 * bars.width, bars.minY + 0.67574 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.27179 * bars.width, bars.minY + 0.67967 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.27500 * bars.width, bars.minY + 0.69470 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.27179 * bars.width, bars.minY + 0.68787 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.27294 * bars.width, bars.minY + 0.69181 * bars.height))
		bar1Path.addLineToPoint(CGPointMake(bars.minX + 0.34742 * bars.width, bars.minY + 0.79673 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.35517 * bars.width, bars.minY + 0.80126 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.34947 * bars.width, bars.minY + 0.79963 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.35226 * bars.width, bars.minY + 0.80126 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.36293 * bars.width, bars.minY + 0.79673 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.35808 * bars.width, bars.minY + 0.80126 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.36087 * bars.width, bars.minY + 0.79963 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 0.71660 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.39960 * bars.width, bars.minY + 0.74505 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.44828 * bars.width, bars.minY + 0.71660 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.63708 * bars.width, bars.minY + 0.79673 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.55172 * bars.width, bars.minY + 0.71660 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.60040 * bars.width, bars.minY + 0.74506 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.64483 * bars.width, bars.minY + 0.80126 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.63914 * bars.width, bars.minY + 0.79963 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.64192 * bars.width, bars.minY + 0.80126 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.65259 * bars.width, bars.minY + 0.79673 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.64774 * bars.width, bars.minY + 0.80126 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.65053 * bars.width, bars.minY + 0.79963 * bars.height))
		bar1Path.addLineToPoint(CGPointMake(bars.minX + 0.72500 * bars.width, bars.minY + 0.69470 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.72500 * bars.width, bars.minY + 0.67285 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.72928 * bars.width, bars.minY + 0.68867 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.72928 * bars.width, bars.minY + 0.67888 * bars.height))
		bar1Path.addCurveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 0.54133 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.66481 * bars.width, bars.minY + 0.58804 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.58490 * bars.width, bars.minY + 0.54133 * bars.height))
		bar1Path.closePath()
		bar1Path.miterLimit = 4;
		
		fillColor.setFill()
		bar1Path.fill()
		
		
		//// Bar0 Drawing
		var bar0Path = UIBezierPath()
		bar0Path.moveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 0.82813 * bars.height))
		bar0Path.addCurveToPoint(CGPointMake(bars.minX + 0.42150 * bars.width, bars.minY + 0.87394 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.47034 * bars.width, bars.minY + 0.82813 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.44246 * bars.width, bars.minY + 0.84440 * bars.height))
		bar0Path.addCurveToPoint(CGPointMake(bars.minX + 0.42150 * bars.width, bars.minY + 0.89579 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.41722 * bars.width, bars.minY + 0.87998 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.41722 * bars.width, bars.minY + 0.88976 * bars.height))
		bar0Path.addLineToPoint(CGPointMake(bars.minX + 0.49225 * bars.width, bars.minY + 0.99547 * bars.height))
		bar0Path.addCurveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 1.00000 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.49430 * bars.width, bars.minY + 0.99837 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.49709 * bars.width, bars.minY + 1.00000 * bars.height))
		bar0Path.addCurveToPoint(CGPointMake(bars.minX + 0.50776 * bars.width, bars.minY + 0.99547 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.50291 * bars.width, bars.minY + 1.00000 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.50570 * bars.width, bars.minY + 0.99837 * bars.height))
		bar0Path.addLineToPoint(CGPointMake(bars.minX + 0.57850 * bars.width, bars.minY + 0.89579 * bars.height))
		bar0Path.addCurveToPoint(CGPointMake(bars.minX + 0.57850 * bars.width, bars.minY + 0.87394 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.58278 * bars.width, bars.minY + 0.88976 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.58278 * bars.width, bars.minY + 0.87998 * bars.height))
		bar0Path.addCurveToPoint(CGPointMake(bars.minX + 0.50000 * bars.width, bars.minY + 0.82813 * bars.height), controlPoint1: CGPointMake(bars.minX + 0.55754 * bars.width, bars.minY + 0.84440 * bars.height), controlPoint2: CGPointMake(bars.minX + 0.52966 * bars.width, bars.minY + 0.82813 * bars.height))
		bar0Path.closePath()
		bar0Path.miterLimit = 4;
		
		fillColor.setFill()
		bar0Path.fill()
	}
	
	
}
