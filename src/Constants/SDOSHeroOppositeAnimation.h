//
//  SDOSHeroOppositeAnimation.h
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 12/4/18.
//

#import <Foundation/Foundation.h>

enum SDOSHeroAnimationType : NSInteger;

@interface SDOSHeroOppositeAnimation : NSObject

/**
 Returns the opposite animation type of the passed animation type.
 
 @param type The animation type whose opposite one is wanted.
 @return The opposite animation type of the passed one.
 */
enum SDOSHeroAnimationType SDOSHeroOppositeAnimationTo(enum SDOSHeroAnimationType type);

@end
