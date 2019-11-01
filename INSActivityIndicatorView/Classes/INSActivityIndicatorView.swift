//
//  INSActivityIndicatorView.swift
//  INSActivityIndicatorView
//
//  Created by Dawid Płatek on 1/11/2019.
//  Copyright © 2019 Inspace Labs. All rights reserved.
//

import UIKit

class INSActivityIndicatorView: UIView {
    @IBInspectable var primaryColor: UIColor = UIColor.black {
        didSet {
            reconfigure()
        }
    }
    
    @IBInspectable var secondaryColor: UIColor = UIColor.black.withAlphaComponent(0.3) {
        didSet {
            reconfigure()
        }
    }
    
    @IBInspectable var lineWidth: CGFloat = 3 {
        didSet {
            reconfigure()
        }
    }
    
    @IBInspectable var animationDuration: Float = 1.0 {
        didSet {
            reconfigure()
        }
    }
    
    var timingFunction = CAMediaTimingFunction(name: .linear)
    
    private(set) public var isAnimating: Bool = false
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
        isHidden = true
    }
    
    init(frame: CGRect, primaryColor: UIColor = UIColor.black, secondaryColor: UIColor = UIColor.black.withAlphaComponent(0.3), lineWidth: CGFloat = 3) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.lineWidth = lineWidth
        
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: bounds.height)
    }
    
    override var bounds: CGRect {
        didSet {
            if oldValue != bounds && isAnimating {
                reconfigure()
            }
        }
    }
    
    private func reconfigure() {
        layer.sublayers?.removeAll()
        
        addBackgroundLayer()
        addForegroundLayer()
    }
    
    func startAnimating() {
        guard !isAnimating else {
            return
        }
        
        addBackgroundLayer()
        addForegroundLayer()
        
        isHidden = false
        isAnimating = true
    }
    
    func stopAnimating() {
        guard isAnimating else {
            return
        }
        isHidden = true
        isAnimating = false
        layer.sublayers?.removeAll()
    }
    
    private func addBackgroundLayer() {
        let minEdge = min(frame.width, frame.height)
        let size = CGSize(width: minEdge, height: minEdge)
        
        let backgroundLayer = INSActivityIndicatorViewLayerType.background.layer(withSize: CGSize(width: size.width-lineWidth, height: size.height-lineWidth), color: secondaryColor, lineWidth: lineWidth)
        let backgroundLayerFrame = CGRect(x: lineWidth/2, y: lineWidth/2, width: size.width-lineWidth, height: size.height-lineWidth)
        backgroundLayer.frame = backgroundLayerFrame
        layer.addSublayer(backgroundLayer)
    }
    
    private func addForegroundLayer() {
        let minEdge = min(frame.width, frame.height)
        let size = CGSize(width: minEdge, height: minEdge)
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = TimeInterval(animationDuration)
        animation.byValue = Float.pi * 2
        animation.timingFunction = timingFunction
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        
        let foregroundLayer = INSActivityIndicatorViewLayerType.foreground.layer(withSize: CGSize(width: size.width-lineWidth,height: size.height-lineWidth), color: primaryColor, lineWidth: lineWidth)
        let frame = CGRect(x: lineWidth/2,
                           y: lineWidth/2,
                           width: size.width-lineWidth,
                           height: size.height-lineWidth)
        
        foregroundLayer.frame = frame
        foregroundLayer.add(animation, forKey: "animation")
        layer.addSublayer(foregroundLayer)
    }
}

enum INSActivityIndicatorViewLayerType {
    case foreground
    case background
    
    func layer(withSize size: CGSize, color: UIColor, lineWidth: CGFloat) -> CALayer {
        let layer: CAShapeLayer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath()
        
        switch self {
        case .foreground:
            path.addArc(withCenter: CGPoint(x: size.width/2, y: size.height/2),
                        radius: size.width/2,
                        startAngle: CGFloat(0),
                        endAngle: CGFloat(-Double.pi/2),
                        clockwise: false)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        case .background:
            path.addArc(withCenter: CGPoint(x: size.width/2, y: size.height/2),
                        radius: size.width/2,
                        startAngle: -(.pi/2),
                        endAngle: .pi + .pi/2,
                        clockwise: true)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        }
        
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0,
                             y: 0,
                             width: size.width,
                             height: size.height)
        
        return layer
    }
}
