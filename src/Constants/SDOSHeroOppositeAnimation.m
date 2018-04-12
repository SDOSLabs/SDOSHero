//
//  SDOSHeroOppositeAnimation.m
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 12/4/18.
//

#import "SDOSHeroOppositeAnimation.h"
#import <SDOSHero/SDOSHero-Swift.h>

@implementation SDOSHeroOppositeAnimation

/**
 Returns the opposite animation type of the passed animation type.

 @param type The animation type whose opposite one is wanted.
 @return The opposite animation type of the passed one.
 */
SDOSHeroAnimationType SDOSHeroOppositeAnimationTo(SDOSHeroAnimationType type) {
    return [SDOSHeroAnimationTypeHelper oppositeAnimationTo:type];
}

@end
