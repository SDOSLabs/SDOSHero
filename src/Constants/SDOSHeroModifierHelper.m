//
//  SDOSHeroModifier+Helper.m
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 24/4/18.
//

#import "SDOSHeroModifierHelper.h"
#import <SDOSHero/SDOSHero-Swift.h>

@implementation SDOSHeroModifierHelper

#pragma mark - Basic modifiers

SDOSHeroModifier * _Nonnull HeroModifierFade(void) {
    return [SDOSHeroModifier HeroModifierFade];
}

SDOSHeroModifier * _Nonnull HeroModifierForceNonFade(void) {
    return [SDOSHeroModifier HeroModifierForceNonFade];
}

SDOSHeroModifier * _Nonnull HeroModifierPosition(CGPoint position) {
    return [SDOSHeroModifier HeroModifierPosition:position];
}

SDOSHeroModifier * _Nonnull HeroModifierSize(CGSize size) {
    return [SDOSHeroModifier HeroModifierSize:size];
}

SDOSHeroModifier * _Nonnull HeroModifierRespectAutolayout(void) {
    return [SDOSHeroModifier HeroModifierRespectAutolayout];
}


#pragma mark - Transform modifiers

SDOSHeroModifier * _Nonnull HeroModifierTransform(CATransform3D t) {
    return [SDOSHeroModifier HeroModifierTransform:t];
}

SDOSHeroModifier * _Nonnull HeroModifierPerspective(CGFloat perspective) {
    return [SDOSHeroModifier HeroModifierPerspective:perspective];
}

SDOSHeroModifier * _Nonnull HeroModifierScale3D(CGFloat x, CGFloat y, CGFloat z) {
    return [SDOSHeroModifier HeroModifierScale3DWithX:x y:y z:z];
}

SDOSHeroModifier * _Nonnull HeroModifierScale(CGFloat scale) {
    return [SDOSHeroModifier HeroModifierScale:scale];
}

SDOSHeroModifier * _Nonnull HeroModifierTranslate(CGPoint point) {
    return [SDOSHeroModifier HeroModifierTranslateWithPoint:point];
}

SDOSHeroModifier * _Nonnull HeroModifierTranslate3D(CGFloat x, CGFloat y, CGFloat z) {
    return [SDOSHeroModifier HeroModifierTranslateWithX:x y:y z:z];
}

SDOSHeroModifier * _Nonnull HeroModifierRotate(CGFloat z) {
    return [SDOSHeroModifier HeroModifierRotate:z];
}

SDOSHeroModifier * _Nonnull HeroModifierRotateXYZ(CGFloat x, CGFloat y, CGFloat z) {
    return [SDOSHeroModifier HeroModifierRotateXYZWithX:x y:y z:z];
}


#pragma mark - Appearance modifiers

SDOSHeroModifier * _Nonnull HeroModifierOpacity(CGFloat opacity) {
    return [SDOSHeroModifier HeroModifierOpacity:opacity];
}

SDOSHeroModifier * _Nonnull HeroModifierBackgroundColor(UIColor *color) {
    return [SDOSHeroModifier HeroModifierBackgroundColor:color];
}

SDOSHeroModifier * _Nonnull HeroModifierCornerRadius(CGFloat cornerRadius) {
    return [SDOSHeroModifier HeroModifierCornerRadius:cornerRadius];
}

SDOSHeroModifier * _Nonnull HeroModifierZPosition(CGFloat zPosition) {
    return [SDOSHeroModifier HeroModifierZPosition:zPosition];
}

SDOSHeroModifier * _Nonnull HeroModifierContentsRect(CGRect contentsRect) {
    return [SDOSHeroModifier HeroModifierContentsRect:contentsRect];
}

SDOSHeroModifier * _Nonnull HeroModifierContentsScale(CGFloat contentsScale) {
    return [SDOSHeroModifier HeroModifierContentsScale:contentsScale];
}

SDOSHeroModifier * _Nonnull HeroModifierBorderWidth(CGFloat borderWidth) {
    return [SDOSHeroModifier HeroModifierBorderWidth:borderWidth];
}

SDOSHeroModifier * _Nonnull HeroModifierBorderColor(UIColor *borderColor) {
    return [SDOSHeroModifier HeroModifierBorderColor:borderColor];
}

SDOSHeroModifier * _Nonnull HeroModifierShadowColor(UIColor *shadowColor) {
    return [SDOSHeroModifier HeroModifierShadowColor:shadowColor];
}

SDOSHeroModifier * _Nonnull HeroModifierShadowOpacity(CGFloat shadowOpacity) {
    return [SDOSHeroModifier HeroModifierShadowOpacity:shadowOpacity];
}

SDOSHeroModifier * _Nonnull HeroModifierShadowOffset(CGSize shadowOffset) {
    return [SDOSHeroModifier HeroModifierShadowOffset:shadowOffset];
}

SDOSHeroModifier * _Nonnull HeroModifierShadowRadius(CGFloat shadowRadius) {
    return [SDOSHeroModifier HeroModifierShadowRadius:shadowRadius];
}

SDOSHeroModifier * _Nonnull HeroModifierShadowPath(CGPathRef shadowPath) {
    return [SDOSHeroModifier HeroModifierShadowPath:shadowPath];
}

SDOSHeroModifier * _Nonnull HeroModifierMasksToBounds(BOOL masksToBounds) {
    return [SDOSHeroModifier HeroModifierMasksToBounds:masksToBounds];
}

SDOSHeroModifier * _Nonnull HeroModifierOverlayColor(UIColor *color, CGFloat opacity) {
    return [SDOSHeroModifier HeroModifierOverlayColor:color opacity:opacity];
}


#pragma mark - Timing modifiers

SDOSHeroModifier * _Nonnull HeroModifierDuration(double duration) {
    return [SDOSHeroModifier HeroModifierDuration:duration];
}

SDOSHeroModifier * _Nonnull HeroModifierDurationMatchLongest(void) {
    return [SDOSHeroModifier HeroModifierDurationMatchLongest];
}

SDOSHeroModifier * _Nonnull HeroModifierDelay(double delay) {
    return [SDOSHeroModifier HeroModifierDelay:delay];
}

SDOSHeroModifier * _Nonnull HeroModifierSpring(CGFloat stiffness, CGFloat damping) {
    return [SDOSHeroModifier HeroModifierSpringWithStiffness:stiffness damping:damping];
}

SDOSHeroModifier * _Nonnull HeroModifierTimingFunction(CAMediaTimingFunction *timingFunction) {
    return [SDOSHeroModifier HeroModifierTimingFunction:timingFunction];
}


#pragma mark - Other modifiers


SDOSHeroModifier * _Nonnull HeroModifierSource(NSString * _Nonnull source_heroID) {
    return [SDOSHeroModifier HeroModifierSource:source_heroID];
}

SDOSHeroModifier * _Nonnull HeroModifierArc(CGFloat intensity) {
    return [SDOSHeroModifier HeroModifierArc:intensity];
}


SDOSHeroModifier * _Nonnull HeroModifierCascade(CGFloat delta, HeroModifierCascadeDirection direction, BOOL delayMatchedViews) {
    return [SDOSHeroModifier HeroModifierCascadeWithDelta:delta direction:direction delayMatchedViews:delayMatchedViews];
}

SDOSHeroModifier * _Nonnull HeroModifierCascadeRadial(CGFloat delta, CGPoint center, BOOL delayMatchedViews) {
    return [SDOSHeroModifier HeroModifierCascadeRadialWithDelta:delta center:center delayMatchedViews:delayMatchedViews];
}

SDOSHeroModifier * _Nonnull HeroModifierCascadeInverseRadial(CGFloat delta, CGPoint center, BOOL delayMatchedViews) {
    return [SDOSHeroModifier HeroModifierCascadeInverseRadialWithDelta:delta center:center delayMatchedViews:delayMatchedViews];
}


#pragma mark - Advanced modifiers

SDOSHeroModifier * _Nonnull HeroModifierUseGlobalCoordinateSpace(void) {
    return [SDOSHeroModifier HeroModifierUseGlobalCoordinateSpace];
}

SDOSHeroModifier * _Nonnull HeroModifierIgnoreSubviewModifiers(void) {
    return [SDOSHeroModifier HeroModifierIgnoreSubviewModifiers];
}

SDOSHeroModifier * _Nonnull HeroModifierUseOptimizedSnapshot(void) {
    return [SDOSHeroModifier HeroModifierUseOptimizedSnapshot];
}

SDOSHeroModifier * _Nonnull HeroModifierUseNormalSnapshot(void) {
    return [SDOSHeroModifier HeroModifierUseNormalSnapshot];
}

SDOSHeroModifier * _Nonnull HeroModifierUseLayerRenderSnapshot(void) {
    return [SDOSHeroModifier HeroModifierUseLayerRenderSnapshot];
}

SDOSHeroModifier * _Nonnull HeroModifierUseNoSnapshot(void) {
    return [SDOSHeroModifier HeroModifierUseNoSnapshot];
}

SDOSHeroModifier * _Nonnull HeroModifierForceAnimate(void) {
    return [SDOSHeroModifier HeroModifierForceAnimate];
}

@end
