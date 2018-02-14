//
//  SDOSHero.swift
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 6/6/17.
//  Copyright © 2017 SDOS. All rights reserved.
//

import Foundation
import UIKit
import Hero

@objc public enum SDOSHeroDefaultAnimationType: Int {
    case auto = 0
    case pushLeft
    case pushRight
    case pushUp
    case pushDown
    case pullLeft
    case pullRight
    case pullUp
    case pullDown
    case coverLeft
    case coverRight
    case coverUp
    case coverDown
    case uncoverLeft
    case uncoverRight
    case uncoverUp
    case uncoverDown
    case slideLeft
    case slideRight
    case slideUp
    case slideDown
    case zoomSlideLeft
    case zoomSlideRight
    case zoomSlideUp
    case zoomSlideDown
    case pageInLeft
    case pageInRight
    case pageInUp
    case pageInDown
    case pageOutLeft
    case pageOutRight
    case pageOutUp
    case pageOutDown
    case fade
    case zoom
    case zoomOut
    case none
}


internal extension SDOSHeroDefaultAnimationType {
    var heroDefaultAnimationType: HeroDefaultAnimationType {
        let animationType: HeroDefaultAnimationType
        switch self {
        case .auto:
            animationType = .auto
            break;
        case .pushLeft:
            animationType = .push(direction: .left)
            break;
        case .pushRight:
            animationType = .push(direction: .right)
            break;
        case .pushUp:
            animationType = .push(direction: .up)
            break;
        case .pushDown:
            animationType = .push(direction: .down)
            break;
        case .pullLeft:
            animationType = .pull(direction: .left)
            break;
        case .pullRight:
            animationType = .pull(direction: .right)
            break;
        case .pullUp:
            animationType = .pull(direction: .up)
            break;
        case .pullDown:
            animationType = .pull(direction: .down)
            break;
        case .coverLeft:
            animationType = .cover(direction: .left)
            break;
        case .coverRight:
            animationType = .cover(direction: .right)
            break;
        case .coverUp:
            animationType = .cover(direction: .up)
            break;
        case .coverDown:
            animationType = .cover(direction: .down)
            break;
        case .uncoverLeft:
            animationType = .uncover(direction: .left)
            break;
        case .uncoverRight:
            animationType = .uncover(direction: .right)
            break;
        case .uncoverUp:
            animationType = .uncover(direction: .up)
            break;
        case .uncoverDown:
            animationType = .uncover(direction: .down)
            break;
        case .slideLeft:
            animationType = .slide(direction: .left)
            break;
        case .slideRight:
            animationType = .slide(direction: .right)
            break;
        case .slideUp:
            animationType = .slide(direction: .up)
            break;
        case .slideDown:
            animationType = .slide(direction: .down)
            break;
        case .zoomSlideLeft:
            animationType = .zoomSlide(direction: .left)
            break;
        case .zoomSlideRight:
            animationType = .zoomSlide(direction: .right)
            break;
        case .zoomSlideUp:
            animationType = .zoomSlide(direction: .up)
            break;
        case .zoomSlideDown:
            animationType = .zoomSlide(direction: .down)
            break;
        case .pageInLeft:
            animationType = .pageIn(direction: .left)
            break;
        case .pageInRight:
            animationType = .pageIn(direction: .right)
            break;
        case .pageInUp:
            animationType = .pageIn(direction: .up)
            break;
        case .pageInDown:
            animationType = .pageIn(direction: .down)
            break;
        case .pageOutLeft:
            animationType = .pageOut(direction: .left)
            break;
        case .pageOutRight:
            animationType = .pageOut(direction: .right)
            break;
        case .pageOutUp:
            animationType = .pageOut(direction: .up)
            break;
        case .pageOutDown:
            animationType = .pageOut(direction: .down)
            break;
        case .fade:
            animationType = .fade
            break;
        case .zoom:
            animationType = .zoom
            break;
        case .zoomOut:
            animationType = .zoomOut
            break;
        case .none:
            animationType = .none
            break;
        }
        return animationType
    }
}

fileprivate extension HeroDefaultAnimationType.Direction {
    var oppositeDirection: HeroDefaultAnimationType.Direction {
        switch self {
        case .left:
            return .right
        case .right:
            return .left
        case .down:
            return .up
        case .up:
            return .down
        }
    }
}

internal extension HeroDefaultAnimationType {
    var oppositeAnimationType: HeroDefaultAnimationType {
        switch self {
        case .pageIn(direction: let direction):
            return .pageOut(direction: direction.oppositeDirection)
        case .pageOut(direction: let direction):
            return .pageIn(direction: direction.oppositeDirection)
        case .pull(direction: let direction):
            return .push(direction: direction.oppositeDirection)
        case .push(direction: let direction):
            return .pull(direction: direction.oppositeDirection)
        case .cover(direction: let direction):
            return .uncover(direction: direction.oppositeDirection)
        case .uncover(direction: let direction):
            return .cover(direction: direction.oppositeDirection)
        case .zoom:
            return .zoomOut
        case .zoomOut:
            return .zoom
        case .slide(direction: let direction):
            return .slide(direction: direction.oppositeDirection)
        case .zoomSlide(direction: let direction):
            return .zoomSlide(direction: direction.oppositeDirection)
        default:
            return self
        }
    }
    
}
