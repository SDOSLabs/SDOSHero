//
//  SDOSHeroConstants.h
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 25/7/17.
//

// Basic Modifiers

#define HeroModifierFade @"fade"

#define HeroModifierOpacity(float_opacity) [NSString stringWithFormat:@"opacity(" #float_opacity ")"]

#define HeroModifierPosition(float_x, float_y) [NSString stringWithFormat:@"position(" #float_x ", " #float_y ")"]

#define HeroModifierSize(float_width, float_height) [NSString stringWithFormat:@"size(" #float_width ", " #float_height ")"]

#define HeroModifierScale(float_scale) [NSString stringWithFormat:@"scale(" #float_scale ")"]

#define HeroModifierScaleXYZ(float_x, float_y, float_z) [NSString stringWithFormat:@"scale(" #float_x ", " #float_y ", " #float_z ")"]

#define HeroModifierRotate(float_z) [NSString stringWithFormat:@"rotate(" #float_z ")"]

#define HeroModifierRotateXYZ(float_x, float_y, float_z) [NSString stringWithFormat:@"rotate(" #float_x ", " #float_y ", " #float_z ")"]

#define HeroModifierTranslate(float_x, float_y, float_z) [NSString stringWithFormat:@"translate(" #float_x ", " #float_y ", " #float_z ")"]

#define HeroModifierOverlayColor(float_red, float_green, float_blue, float_opacity) [NSString stringWithFormat:@"overlay(" #float_red ", " #float_green ", " #float_blue ", " #float_opacity ")"]

#define HeroModifierDuration(double_duration) [NSString stringWithFormat:@"duration(" #double_duration ")"]

#define HeroModifierDurationMatchLongest @"durationMatchLongest"

#define HeroModifierDelay(double_delay) [NSString stringWithFormat:@"delay(" #double_delay ")"]

#define HeroModifierSpring @"spring"

#define HeroModifierSpringWith(float_stiffness, float_damping) [NSString stringWithFormat:@"spring(" #float_stiffness ", " #float_damping ")"]

#define HeroModifierTimingFunction(float_cp1, float_cp2, float_cp3, float_cp4) [NSString stringWithFormat:@"timingFunction(" #float_cp1 ", " #float_cp2 ", " #float_cp3 ", " #float_cp4 ")"]

#define HeroModifierTimingFunctionWithName(name) [NSString stringWithFormat:@"timingFunction(" #name ")"]

#define HeroModifierArc(float_intensity) [NSString stringWithFormat:@"arc(" #float_intensity ")"]

#define HeroModifierCascadeBottomToTop(float_delay, bool_forceMatchedToWait) [NSString stringWithFormat:@"cascade(" #float_delay ", bottomToTop, " #bool_forceMatchedToWait ")"]

#define HeroModifierCascadeLeftToRight(float_delay, bool_forceMatchedToWait) [NSString stringWithFormat:@"cascade(" #float_delay ", leftToRight, " #bool_forceMatchedToWait ")"]

#define HeroModifierCascadeRightToLeft(float_delay, bool_forceMatchedToWait) [NSString stringWithFormat:@"cascade(" #float_delay ", rightToLeft, " #bool_forceMatchedToWait ")"]

#define HeroModifierCascadeTopToBottom(float_delay, bool_forceMatchedToWait) [NSString stringWithFormat:@"cascade(" #float_delay ", topToBottom, " #bool_forceMatchedToWait ")"]

#define HeroModifierSource(source_heroID) [NSString stringWithFormat:@"source(" #source_heroID ")"]

#define HeroModifierUseGlobalCoordinateSpace @"useGlobalCoordinateSpace"

#define HeroModifierIgnoreSubviewModifiers @"ignoreSubviewModifiers"

#define HeroModifierZPosition(float_z) [NSString stringWithFormat:@"zPosition(" #float_z ")"]

#define HeroModifierUseOptimizedSnapshot @"useOptimizedSnapshot"

#define HeroModifierUseNormalSnapshot @"useNormalSnapshot"

#define HeroModifierUseLayerRenderSnapshot @"useLayerRenderSnapshot"

#define HeroModifierUseNoSnapshot @"useNoSnapshot"

#define HeroModifierForceAnimate @"forceAnimate"


// Booleans

#define HeroModifierBoolTrue @"true"
#define HeroModifierBoolFalse @"false"

