//
//  SDOSHeroModifier.m
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 27/3/18.
//

#import "SDOSHeroModifier.h"

@interface SDOSHeroModifier ()

@property (strong, readwrite) NSString *string;

@end

@implementation SDOSHeroModifier

- (instancetype)initWithString:(NSString *)string {
    if (self = [super init]) {
        self.string = string;
    }
    return self;
}

SDOSHeroModifier * _Nonnull HeroModifierFade() {
    return [[SDOSHeroModifier alloc] initWithString:@"fade"];
}

SDOSHeroModifier * _Nonnull HeroModifierOpacity(float opacity) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"opacity(%f)", opacity]];
}

SDOSHeroModifier * _Nonnull HeroModifierPosition(float x, float y) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"position(%f, %f)", x, y]];
}

SDOSHeroModifier * _Nonnull HeroModifierSize(float width, float height) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"size(%f, %f)", width, height]];
}

SDOSHeroModifier * _Nonnull HeroModifierScale(float scale) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"scale(%f)", scale]];
}

SDOSHeroModifier * _Nonnull HeroModifierScaleXYZ(float x, float y, float z) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"scale(%f, %f, %f)", x, y, z]];
}

SDOSHeroModifier * _Nonnull HeroModifierRotate(float z) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"rotate(%f)", z]];
}

SDOSHeroModifier * _Nonnull HeroModifierRotateXYZ(float x, float y, float z) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"rotate(%f, %f, %f)", x, y, z]];
}

SDOSHeroModifier * _Nonnull HeroModifierTranslate(float x, float y, float z) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"translate(%f, %f, %f)", x, y, z]];
}

SDOSHeroModifier * _Nonnull HeroModifierOverlayColor(float red, float green, float blue, float opacity) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"overlay(%f, %f, %f, %f)", red, green, blue, opacity]];
}

SDOSHeroModifier * _Nonnull HeroModifierDuration(double duration) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"duration(%f)", duration]];
}

SDOSHeroModifier * _Nonnull HeroModifierDurationMatchLongest() {
    return [[SDOSHeroModifier alloc] initWithString:@"durationMatchLongest"];
}

SDOSHeroModifier * _Nonnull HeroModifierDelay(double delay) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"delay(%f)", delay]];
}

SDOSHeroModifier * _Nonnull HeroModifierSpring() {
    return [[SDOSHeroModifier alloc] initWithString:@"spring"];
}

SDOSHeroModifier * _Nonnull HeroModifierSpringWith(float stiffness, float damping) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"spring(%f, %f)", stiffness, damping]];
}

SDOSHeroModifier * _Nonnull HeroModifierTimingFunction(float cp1, float cp2, float cp3, float cp4) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"timingFunction(%f, %f, %f, %f)", cp1, cp2, cp3, cp4]];
}

SDOSHeroModifier * _Nonnull HeroModifierTimingFunctionWithName(NSString * _Nonnull name) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"timingFunction(%@)", name]];
}

SDOSHeroModifier * _Nonnull HeroModifierArc(float intensity) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"arc(%f)", intensity]];
}

SDOSHeroModifier * _Nonnull HeroModifierCascadeBottomToTop(float delay, BOOL forceMatchedToWait) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"cascade(%f, bottomToTop, %@)", delay, forceMatchedToWait ? HeroModifierBoolTrue : HeroModifierBoolFalse]];
}

SDOSHeroModifier * _Nonnull HeroModifierCascadeLeftToRight(float delay, BOOL forceMatchedToWait) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"cascade(%f, leftToRight, %@)", delay, forceMatchedToWait ? HeroModifierBoolTrue : HeroModifierBoolFalse]];
}

SDOSHeroModifier * _Nonnull HeroModifierCascadeRightToLeft(float delay, BOOL forceMatchedToWait) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"cascade(%f, rightToLeft, %@)", delay, forceMatchedToWait ? HeroModifierBoolTrue : HeroModifierBoolFalse]];
}

SDOSHeroModifier * _Nonnull HeroModifierCascadeTopToBottom(float delay, BOOL forceMatchedToWait) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"cascade(%f, topToBottom, %@)", delay, forceMatchedToWait ? HeroModifierBoolTrue : HeroModifierBoolFalse]];
}

SDOSHeroModifier * _Nonnull HeroModifierSource(NSString * _Nonnull source_heroID) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"source(%@)", source_heroID]];
}

SDOSHeroModifier * _Nonnull HeroModifierUseGlobalCoordinateSpace() {
    return [[SDOSHeroModifier alloc] initWithString:@"useGlobalCoordinateSpace"];
}

SDOSHeroModifier * _Nonnull HeroModifierIgnoreSubviewModifiers() {
    return [[SDOSHeroModifier alloc] initWithString:@"ignoreSubviewModifiers"];
}

SDOSHeroModifier * _Nonnull HeroModifierZPosition(float z) {
    return [[SDOSHeroModifier alloc] initWithString:[NSString stringWithFormat:@"zPosition(%f)", z]];
}

SDOSHeroModifier * _Nonnull HeroModifierUseOptimizedSnapshot() {
    return [[SDOSHeroModifier alloc] initWithString:@"useOptimizedSnapshot"];
}

SDOSHeroModifier * _Nonnull HeroModifierUseNormalSnapshot() {
    return [[SDOSHeroModifier alloc] initWithString:@"useNormalSnapshot"];
}

SDOSHeroModifier * _Nonnull HeroModifierUseLayerRenderSnapshot() {
    return [[SDOSHeroModifier alloc] initWithString:@"useLayerRenderSnapshot"];
}

SDOSHeroModifier * _Nonnull HeroModifierUseNoSnapshot() {
    return [[SDOSHeroModifier alloc] initWithString:@"useNoSnapshot"];
}

SDOSHeroModifier * _Nonnull HeroModifierForceAnimate() {
    return [[SDOSHeroModifier alloc] initWithString:@"forceAnimate"];
}


// Booleans

NSString * _Nonnull HeroModifierBoolTrue = @"true";
NSString * _Nonnull HeroModifierBoolFalse = @"false";
        
@end
