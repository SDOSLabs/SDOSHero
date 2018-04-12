//
//  SDOSHeroModifier.h
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 27/3/18.
//

#import <Foundation/Foundation.h>

@interface SDOSHeroModifier : NSObject

@property (strong, readonly) NSString *string;
- (instancetype)initWithString:(NSString *)string;


SDOSHeroModifier * _Nonnull HeroModifierFade(void);

SDOSHeroModifier * _Nonnull HeroModifierOpacity(float opacity);

SDOSHeroModifier * _Nonnull HeroModifierPosition(float x, float y);

SDOSHeroModifier * _Nonnull HeroModifierSize(float width, float height);

SDOSHeroModifier * _Nonnull HeroModifierScale(float scale);

SDOSHeroModifier * _Nonnull HeroModifierScaleXYZ(float x, float y, float z);

SDOSHeroModifier * _Nonnull HeroModifierRotate(float z);

SDOSHeroModifier * _Nonnull HeroModifierRotateXYZ(float x, float y, float z);

SDOSHeroModifier * _Nonnull HeroModifierTranslate(float x, float y, float z);

SDOSHeroModifier * _Nonnull HeroModifierOverlayColor(float red, float green, float blue, float opacity);

SDOSHeroModifier * _Nonnull HeroModifierDuration(double duration);

SDOSHeroModifier * _Nonnull HeroModifierDurationMatchLongest(void);

SDOSHeroModifier * _Nonnull HeroModifierDelay(double delay);

SDOSHeroModifier * _Nonnull HeroModifierSpring(void);

SDOSHeroModifier * _Nonnull HeroModifierSpringWith(float stiffness, float damping);

SDOSHeroModifier * _Nonnull HeroModifierTimingFunction(float cp1, float cp2, float cp3, float cp4);

SDOSHeroModifier * _Nonnull HeroModifierTimingFunctionWithName(NSString * _Nonnull name);

SDOSHeroModifier * _Nonnull HeroModifierArc(float intensity);

SDOSHeroModifier * _Nonnull HeroModifierCascadeBottomToTop(float delay, BOOL forceMatchedToWait);

SDOSHeroModifier * _Nonnull HeroModifierCascadeLeftToRight(float delay, BOOL forceMatchedToWait);

SDOSHeroModifier * _Nonnull HeroModifierCascadeRightToLeft(float delay, BOOL forceMatchedToWait);

SDOSHeroModifier * _Nonnull HeroModifierCascadeTopToBottom(float delay, BOOL forceMatchedToWait);

SDOSHeroModifier * _Nonnull HeroModifierSource(NSString * _Nonnull source_heroID);

SDOSHeroModifier * _Nonnull HeroModifierUseGlobalCoordinateSpace(void);

SDOSHeroModifier * _Nonnull HeroModifierIgnoreSubviewModifiers(void);

SDOSHeroModifier * _Nonnull HeroModifierZPosition(float z);

SDOSHeroModifier * _Nonnull HeroModifierUseOptimizedSnapshot(void);

SDOSHeroModifier * _Nonnull HeroModifierUseNormalSnapshot(void);

SDOSHeroModifier * _Nonnull HeroModifierUseLayerRenderSnapshot(void);

SDOSHeroModifier * _Nonnull HeroModifierUseNoSnapshot(void);

SDOSHeroModifier * _Nonnull HeroModifierForceAnimate(void);

@end
