//
//  SDOSHeroModifier.m
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 27/3/18.
//

#import "SDOSHeroModifier.h"

@implementation SDOSHeroModifier

NSString * _Nonnull const HeroModifierFade = @"fade";

NSString * _Nonnull HeroModifierOpacity(float opacity) {
    return [NSString stringWithFormat:@"opacity(%f)", opacity];
}

NSString * _Nonnull HeroModifierPosition(float x, float y) {
    return [NSString stringWithFormat:@"position(%f, %f)", x, y];
}

NSString * _Nonnull HeroModifierSize(float width, float height) {
    return [NSString stringWithFormat:@"size(%f, %f)", width, height];
}

NSString * _Nonnull HeroModifierScale(float scale) {
    return [NSString stringWithFormat:@"scale(%f)", scale];
}

NSString * _Nonnull HeroModifierScaleXYZ(float x, float y, float z) {
    return [NSString stringWithFormat:@"scale(%f, %f, %f)", x, y, z];
}

NSString * _Nonnull HeroModifierRotate(float z) {
    return [NSString stringWithFormat:@"rotate(%f)", z];
}

NSString * _Nonnull HeroModifierRotateXYZ(float x, float y, float z) {
    return [NSString stringWithFormat:@"rotate(%f, %f, %f)", x, y, z];
}

NSString * _Nonnull HeroModifierTranslate(float x, float y, float z) {
    return [NSString stringWithFormat:@"translate(%f, %f, %f)", x, y, z];
}

NSString * _Nonnull HeroModifierOverlayColor(float red, float green, float blue, float opacity) {
    return [NSString stringWithFormat:@"overlay(%f, %f, %f, %f)", red, green, blue, opacity];
}

NSString * _Nonnull HeroModifierDuration(double duration) {
    return [NSString stringWithFormat:@"duration(%f)", duration];
}

NSString * _Nonnull const HeroModifierDurationMatchLongest = @"durationMatchLongest";

NSString * _Nonnull HeroModifierDelay(double delay) {
    return [NSString stringWithFormat:@"delay(%f)", delay];
}

NSString * _Nonnull const HeroModifierSpring = @"spring";

NSString * _Nonnull HeroModifierSpringWith(float stiffness, float damping) {
    return [NSString stringWithFormat:@"spring(%f, %f)", stiffness, damping];
}

NSString * _Nonnull HeroModifierTimingFunction(float cp1, float cp2, float cp3, float cp4) {
    return [NSString stringWithFormat:@"timingFunction(%f, %f, %f, %f)", cp1, cp2, cp3, cp4];
}

NSString * _Nonnull HeroModifierTimingFunctionWithName(NSString * _Nonnull name) {
    return [NSString stringWithFormat:@"timingFunction(%@)", name];
}

NSString * _Nonnull HeroModifierArc(float intensity) {
    return [NSString stringWithFormat:@"arc(%f)", intensity];
}

NSString * _Nonnull HeroModifierCascadeBottomToTop(float delay, BOOL forceMatchedToWait) {
    return [NSString stringWithFormat:@"cascade(%f, bottomToTop, %@)", delay, forceMatchedToWait ? HeroModifierBoolTrue : HeroModifierBoolFalse];
}

NSString * _Nonnull HeroModifierCascadeLeftToRight(float delay, BOOL forceMatchedToWait) {
    return [NSString stringWithFormat:@"cascade(%f, leftToRight, %@)", delay, forceMatchedToWait ? HeroModifierBoolTrue : HeroModifierBoolFalse];
}

NSString * _Nonnull HeroModifierCascadeRightToLeft(float delay, BOOL forceMatchedToWait) {
    return [NSString stringWithFormat:@"cascade(%f, rightToLeft, %@)", delay, forceMatchedToWait ? HeroModifierBoolTrue : HeroModifierBoolFalse];
}

NSString * _Nonnull HeroModifierCascadeTopToBottom(float delay, BOOL forceMatchedToWait) {
    return [NSString stringWithFormat:@"cascade(%f, topToBottom, %@)", delay, forceMatchedToWait ? HeroModifierBoolTrue : HeroModifierBoolFalse];
}

NSString * _Nonnull HeroModifierSource(NSString * _Nonnull source_heroID) {
    return [NSString stringWithFormat:@"source(%@)", source_heroID];
}

NSString * _Nonnull const HeroModifierUseGlobalCoordinateSpace = @"useGlobalCoordinateSpace";

NSString * _Nonnull const HeroModifierIgnoreSubviewModifiers = @"ignoreSubviewModifiers";

NSString * _Nonnull HeroModifierZPosition(float z) {
    return [NSString stringWithFormat:@"zPosition(%f)", z];
}

NSString * _Nonnull const HeroModifierUseOptimizedSnapshot = @"useOptimizedSnapshot";

NSString * _Nonnull const HeroModifierUseNormalSnapshot = @"useNormalSnapshot";

NSString * _Nonnull const HeroModifierUseLayerRenderSnapshot = @"useLayerRenderSnapshot";

NSString * _Nonnull const HeroModifierUseNoSnapshot = @"useNoSnapshot";

NSString * _Nonnull const HeroModifierForceAnimate = @"forceAnimate";


// Booleans

NSString * _Nonnull HeroModifierBoolTrue = @"true";
NSString * _Nonnull HeroModifierBoolFalse = @"false";
        
@end
