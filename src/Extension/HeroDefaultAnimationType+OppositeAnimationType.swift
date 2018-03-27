//
//  HeroDefaultAnimationType+OppositeAnimationType.swift
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 27/3/18.
//

import Hero

extension HeroDefaultAnimationType {
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
