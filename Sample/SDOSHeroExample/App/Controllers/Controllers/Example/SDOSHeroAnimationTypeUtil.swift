//
//  SDOSHeroDefaultAnimationTypeUtil.swift
//  SDOSHeroExample
//
//  Created by Antonio Jesús Pallares on 14/11/17.
//  Copyright © 2017 SDOS. All rights reserved.
//

import Foundation
import SDOSHero


@objc public class SDOSHeroAnimationTypeUtil: NSObject {
    @objc class func identifierFor(type: SDOSHeroAnimationType) -> String {
        return type.identifier
    }
    
    @objc class func getAllAnimationTypesIdentifiers() -> [String] {
        return SDOSHeroAnimationType.arrayAllTypes.map({ type in
            type.identifier
        })
    }
    
    @objc class func typeFor(identifier: String) -> SDOSHeroAnimationType {
        for type in SDOSHeroAnimationType.arrayAllTypes where type.identifier == identifier {
            return type
        }
        return .auto
    }
}


fileprivate extension SDOSHeroAnimationType {
    
    var identifier: String {
        switch self {
        case .auto:
            return "auto"
        case .pushLeft:
            return "pushLeft"
        case .pushRight:
            return "pushRight"
        case .pushUp:
            return "pushUp"
        case .pushDown:
            return "pushDown"
        case .pullLeft:
            return "pullLeft"
        case .pullRight:
            return "pullRight"
        case .pullUp:
            return "pullUp"
        case .pullDown:
            return "pullDown"
        case .coverLeft:
            return "coverLeft"
        case .coverRight:
            return "coverRight"
        case .coverUp:
            return "coverUp"
        case .coverDown:
            return "coverDown"
        case .uncoverLeft:
            return "uncoverLeft"
        case .uncoverRight:
            return "uncoverRight"
        case .uncoverUp:
            return "uncoverUp"
        case .uncoverDown:
            return "uncoverDown"
        case .slideLeft:
            return "slideLeft"
        case .slideRight:
            return "slideRight"
        case .slideUp:
            return "slideUp"
        case .slideDown:
            return "slideDown"
        case .zoomSlideLeft:
            return "zoomSlideLeft"
        case .zoomSlideRight:
            return "zoomSlideRight"
        case .zoomSlideUp:
            return "zoomSlideUp"
        case .zoomSlideDown:
            return "zoomSlideDown"
        case .pageInLeft:
            return "pageInLeft"
        case .pageInRight:
            return "pageInRight"
        case .pageInUp:
            return "pageInUp"
        case .pageInDown:
            return "pageInDown"
        case .pageOutLeft:
            return "pageOutLeft"
        case .pageOutRight:
            return "pageOutRight"
        case .pageOutUp:
            return "pageOutUp"
        case .pageOutDown:
            return "pageOutDown"
        case .fade:
            return "fade"
        case .zoom:
            return "zoom"
        case .zoomOut:
            return "zoomOut"
        case .none:
            return "none"
        }
    }
    
    
    static var arrayAllTypes: [SDOSHeroAnimationType] {
        return [.auto, .pushLeft, .pushRight, .pushUp, .pushDown, .pullLeft, .pullRight, .pullUp, .pullDown, .coverLeft, .coverRight, .coverUp, .coverDown, .uncoverLeft, .uncoverRight, .uncoverUp, .uncoverDown, .slideLeft, .slideRight, .slideUp, .slideDown, .zoomSlideLeft, .zoomSlideRight, .zoomSlideUp, .zoomSlideDown, .pageInLeft, .pageInRight, .pageInUp, .pageInDown, .pageOutLeft, .pageOutRight, .pageOutUp, .pageOutDown, .fade, .zoom, .zoomOut, .none]
    }
    
    
    static func typeFor(identifier: String) -> SDOSHeroAnimationType? {
        for type in arrayAllTypes where type.identifier == identifier {
            return type
        }
        return nil
    }
}
