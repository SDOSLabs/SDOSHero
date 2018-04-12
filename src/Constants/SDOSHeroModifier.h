//
//  SDOSHeroModifier.h
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 27/3/18.
//

#import <Foundation/Foundation.h>

@interface SDOSHeroModifier : NSObject

extern NSString * _Nonnull const HeroModifierFade;

NSString * _Nonnull HeroModifierOpacity(float opacity);

NSString * _Nonnull HeroModifierPosition(float x, float y);

NSString * _Nonnull HeroModifierSize(float width, float height);

NSString * _Nonnull HeroModifierScale(float scale);

NSString * _Nonnull HeroModifierScaleXYZ(float x, float y, float z);

NSString * _Nonnull HeroModifierRotate(float z);

NSString * _Nonnull HeroModifierRotateXYZ(float x, float y, float z);

NSString * _Nonnull HeroModifierTranslate(float x, float y, float z);

NSString * _Nonnull HeroModifierOverlayColor(float red, float green, float blue, float opacity);

NSString * _Nonnull HeroModifierDuration(double duration);

extern NSString * _Nonnull const HeroModifierDurationMatchLongest;

NSString * _Nonnull HeroModifierDelay(double delay);

extern NSString * _Nonnull const HeroModifierSpring;

NSString * _Nonnull HeroModifierSpringWith(float stiffness, float damping);

NSString * _Nonnull HeroModifierTimingFunction(float cp1, float cp2, float cp3, float cp4);

NSString * _Nonnull HeroModifierTimingFunctionWithName(NSString * _Nonnull name);

NSString * _Nonnull HeroModifierArc(float intensity);

NSString * _Nonnull HeroModifierCascadeBottomToTop(float delay, BOOL forceMatchedToWait);

NSString * _Nonnull HeroModifierCascadeLeftToRight(float delay, BOOL forceMatchedToWait);

NSString * _Nonnull HeroModifierCascadeRightToLeft(float delay, BOOL forceMatchedToWait);

NSString * _Nonnull HeroModifierCascadeTopToBottom(float delay, BOOL forceMatchedToWait);

NSString * _Nonnull HeroModifierSource(NSString * _Nonnull source_heroID);

extern NSString * _Nonnull const HeroModifierUseGlobalCoordinateSpace;

extern NSString * _Nonnull const HeroModifierIgnoreSubviewModifiers;

NSString * _Nonnull HeroModifierZPosition(float z);

extern NSString * _Nonnull const HeroModifierUseOptimizedSnapshot;

extern NSString * _Nonnull const HeroModifierUseNormalSnapshot;

extern NSString * _Nonnull const HeroModifierUseLayerRenderSnapshot;

extern NSString * _Nonnull const HeroModifierUseNoSnapshot;

extern NSString * _Nonnull const HeroModifierForceAnimate;

@end
