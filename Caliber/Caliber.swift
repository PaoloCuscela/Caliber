//
//  Caliber.swift
//  CodeConstrains
//
//  Created by Paolo Cuscela on 10/11/17.
//  Copyright © 2017 Paolo Cuscela. All rights reserved.
//

import Foundation
import UIKit

open class Caliber {

    private let view: UIView

    public init(_ view: UIView ) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view = view
    }
    
    /**
        Add a specific constraint to the selected view.
    */
    public func constrain(_ attribute: CaliberAttribute, to viewAttribute: CaliberAttribute, of second: UIView, offset: CGFloat = 0, multiplier : CGFloat = 1) -> Caliber {
        
        if let sup = view.superview {
            let constraint = NSLayoutConstraint(item: view, attribute: ns(attribute), relatedBy: .equal, toItem: second, attribute: ns(viewAttribute), multiplier: multiplier, constant: offset)
            sup.addConstraint(constraint)
        }
        
        return self
    }
    
    /**
     Anchor the top margin to the selected view anchor with a fixed offset.
     */
    public func top(with otherView: UIView, _ anchor: CaliberY, offset: CGFloat = 0 ) -> Caliber {

        view.topAnchor.constraint(equalTo: nsAnchor(otherView, anchor: anchor), constant: offset).isActive = true
        return self
    }
    
    /**
     Anchor the bottom margin to the selected view anchor with a fixed offset.
     */
    public func bottom(with otherView: UIView, _ anchor: CaliberY, offset: CGFloat = 0 ) -> Caliber {
        
        view.bottomAnchor.constraint(equalTo: nsAnchor(otherView, anchor: anchor), constant: offset).isActive = true
        return self
    }
    
    /**
     Anchor the left margin to the selected view's anchor with a fixed offset.
     */
    public func left(with otherView: UIView, _ anchor: CaliberX, offset: CGFloat = 0 ) -> Caliber {
        
        view.leftAnchor.constraint(equalTo: nsAnchor(otherView, anchor: anchor), constant: offset).isActive = true
        return self
    }
    
    /**
     Anchor the right margin to the selected view's anchor with a fixed offset.
     */
    public func right(with otherView: UIView, _ anchor: CaliberX, offset: CGFloat = 0 ) -> Caliber {

        view.rightAnchor.constraint(equalTo: nsAnchor(otherView, anchor: anchor), constant: offset).isActive = true
        return self
    }
    
    func set(_ value: CGFloat, to attribute: CaliberAttribute ) -> Caliber {
        
        guard let sup = view.superview else { return self }
        
        let constraint = attribute != .aspect ?
            NSLayoutConstraint(item: view, attribute: ns(attribute) , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: value) :
            NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: view, attribute: .height, multiplier: value, constant: 0)
        
        sup.addConstraint(constraint)

        return self
    }
    
    /**
    Fill the selected view bounds with specified insets.
     */
    public func fit(inside anotherView: UIView, offset: CGFloat = 0 ) {
        
        _ = constrain(.top, to: .top, of: anotherView, offset: offset, multiplier: 1)
        .constrain(.bottom, to: .bottom, of: anotherView, offset: offset, multiplier: 1)
        .constrain(.left, to: .left, of: anotherView, offset: offset, multiplier: 1)
        .constrain(.right, to: .right, of: anotherView, offset: offset, multiplier: 1)
    }
    
    /**
     Center inside the selected view.
     */
    public func center(in anotherView: UIView) -> Caliber {
        
        view.centerXAnchor.constraint(equalTo: anotherView.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: anotherView.centerYAnchor).isActive = true
        return self
    }
    
    /**
     Center horizontally inside the selected view.
     */
    public func centerHorizontally(in anotherView: UIView, multiplier: CGFloat = 1) -> Caliber {
        
        constrain(.centerX, to: .centerX, of: anotherView, offset: 0, multiplier: multiplier).ok()
        return self
    }
    
    /**
     Center vertically inside the selected view.
     */
    public func centerVertically(in anotherView: UIView, multiplier: CGFloat = 1) -> Caliber {
        
        constrain(.centerY, to: .centerY, of: anotherView, offset: 0, multiplier: multiplier).ok()
        
        return self
    }
    
    /**
     Set width equal to the selected view's width, with a specified multiplier.
     */
    public func width( of anotherView: UIView, multiplier: CGFloat = 1 ) -> Caliber {
        
        view.widthAnchor.constraint(equalTo: anotherView.widthAnchor, multiplier: multiplier).isActive = true
        return self
    }
    
    /**
     Set height equal to the selected view's height, with a specified multiplier.
     */
    public func height( of anotherView: UIView, multiplier: CGFloat = 1 ) -> Caliber {
        
        view.heightAnchor.constraint(equalTo: anotherView.heightAnchor, multiplier: multiplier).isActive = true
        return self
    }
    
    /**
     View's width.
     */
    public var width: CGFloat {
        set(val) {
             _ = set(val, to: .width)
        }
        get { return view.bounds.width }
    }
    
    /**
     View's height.
     */
    public var height: CGFloat {
        set(val) {
            _ = set(val, to: .height)
        }
        get { return view.bounds.height }
    }
    
    /**
     View's aspect ratio (needs at least a width or height constrain set).
     */
    public var aspect: CGFloat {
        set(val) {
            _ = set(val, to: .aspect)
        }
        get { return view.bounds.width / view.bounds.height }
    }
    
    
    public func ok(){}

    fileprivate func ns(_ caliberAttribute:  CaliberAttribute) -> NSLayoutAttribute {
        switch caliberAttribute {
            case .bottom: return .bottom
            case .centerX: return .centerX
            case .centerY: return .centerY
            case .height: return .height
            case .left: return .leading
            case .right: return .trailing
            case .top: return .top
            case .width: return .width
        default: return .width
        }
    }
    
    fileprivate func nsAnchor(_ view: UIView, anchor: CaliberY) -> NSLayoutAnchor<NSLayoutYAxisAnchor> {
        
        guard #available(iOS 11.0, *) else {
            
            return (anchor == .bottom) ? view.layoutMarginsGuide.bottomAnchor : view.layoutMarginsGuide.topAnchor
        }
        return (anchor == .bottom) ? view.safeAreaLayoutGuide.bottomAnchor : view.safeAreaLayoutGuide.topAnchor
        
    }
    
    fileprivate func nsAnchor(_ view: UIView, anchor: CaliberX) -> NSLayoutAnchor<NSLayoutXAxisAnchor> {
        
        guard #available(iOS 11.0, *) else {
            
            return (anchor == .left) ? view.layoutMarginsGuide.leftAnchor : view.layoutMarginsGuide.rightAnchor
        }
        return (anchor == .left) ? view.safeAreaLayoutGuide.leftAnchor : view.safeAreaLayoutGuide.rightAnchor
    }
    
}

public enum CaliberAttribute {
    case width, height, top, bottom, left, right, aspect, centerX, centerY
}

public enum CaliberY {
    case top,bottom
}

public enum CaliberX {
    case left,right
}


public extension UIView {
    
    public var caliber: Caliber {
        get {
            return Caliber(self)
        }
    }
}
