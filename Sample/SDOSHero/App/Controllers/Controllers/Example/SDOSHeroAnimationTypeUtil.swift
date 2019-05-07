//
//  SDOSHeroDefaultAnimationTypeUtil.swift
//  SDOSHeroExample
//
//  Created by Antonio Jesús Pallares on 14/11/17.
//  Copyright © 2017 SDOS. All rights reserved.
//

import Foundation
import Hero


extension HeroDefaultAnimationType {
    
    var identifier: String {
        switch self {
        case .auto:
            return "auto"
        case .push(direction: let direction):
            return "push" + direction.identifier.capitalized
        case .pull(direction: let direction):
            return "pull" + direction.identifier.capitalized
        case .cover(direction: let direction):
            return "cover" + direction.identifier.capitalized
        case .uncover(direction: let direction):
            return "uncover" + direction.identifier.capitalized
        case .slide(direction: let direction):
            return "slide" + direction.identifier.capitalized
        case .zoomSlide(direction: let direction):
            return "zoomSlide" + direction.identifier.capitalized
        case .pageIn(direction: let direction):
            return "pageIn" + direction.identifier.capitalized
        case .pageOut(direction: let direction):
            return "pageOut" + direction.identifier.capitalized
        case .fade:
            return "fade"
        case .zoom:
            return "zoom"
        case .zoomOut:
            return "auto"
        case .none:
            return "none"
        case .selectBy(presenting: let presenting, dismissing: let dismissing):
            return "presenting: " + presenting.identifier + ", dismissing: " + dismissing.identifier
        }
    }
    
    static var allPosibleAnimationTypes: [HeroDefaultAnimationType] {
        return [.auto, .push(direction: .left), .push(direction: .right), .push(direction: .up), .push(direction: .down), .pull(direction:  .left), .pull(direction: .right), .pull(direction: .up), .pull(direction: .down), .cover(direction: .left), .cover(direction: .right), .cover(direction: .up), .cover(direction: .down), .uncover(direction: .left), .uncover(direction: .right), .uncover(direction: .up), .uncover(direction: .down), .slide(direction: .left), .slide(direction: .right), .slide(direction: .up), .slide(direction: .down), .zoomSlide(direction: .left), .zoomSlide(direction: .right), .zoomSlide(direction: .up), .zoomSlide(direction: .down), .pageIn(direction: .left), .pageIn(direction: .right), .pageIn(direction: .up), .pageIn(direction: .down), .pageOut(direction: .left), .pageOut(direction: .right), .pageOut(direction: .up), .pageOut(direction: .down), .fade, .zoom, .zoomOut, .none]
    }
    
    static func typeForIdentifier(_ identifier: String) -> HeroDefaultAnimationType {
        return allPosibleAnimationTypes.filter{ $0.identifier == identifier }.first ?? .auto
    }
    
    static func random() -> HeroDefaultAnimationType {
        return allPosibleAnimationTypes.randomElement() ?? .auto
    }
    
}

extension HeroDefaultAnimationType.Direction {
    
    var identifier: String {
        switch self {
        case .left:
            return "left"
        case .right:
            return "right"
        case .up:
            return "up"
        case .down:
            return "down"
        }
    }
    
}
