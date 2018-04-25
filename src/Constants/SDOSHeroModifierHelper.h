//
//  SDOSHeroModifierHelper.h
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 24/4/18.
//

#import <UIKit/UIKit.h>

@class SDOSHeroModifier;
enum HeroModifierCascadeDirection : NSInteger;

@interface SDOSHeroModifierHelper: NSObject

#pragma mark - Basic modifiers

/**
 Fade the view during transition.
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierFade(void);

/**
 Force don't fade view during transition.
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierForceNonFade(void);

/**
 Set the position for the view to animate from/to.
 
 @param position position for the view to animate from/to
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierPosition(CGPoint position);

/**
 Set the size for the view to animate from/to.
 
 @param size size for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierSize(CGSize size);


#pragma mark - Transform modifiers

/**
 Set the transform for the view to animate from/to. Will override previous perspective, scale, translate, & rotate modifiers.
 
 @param t the CATransform3D object.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierTransform(CATransform3D t);

/**
 Set the perspective on the transform. Use in combination with the rotate modifier.
 
 @param perspective sets the camera distance of the transform.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierPerspective(CGFloat perspective);

/**
 Scale 3d.
 
 @param x scale factor on x axis.
 @param y scale factor on y axis.
 @param z scale factor on z axis.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierScale3D(CGFloat x, CGFloat y, CGFloat z);

/**
 Scale in x & y axis
 
 @param scale scale factor in both x & y axis
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierScale(CGFloat scale);

/**
 2D translation.
 
 @param point translation in display pixel.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierTranslate(CGPoint point);

/**
 3D translation.
 
 @param x translation distance on x axis in display pixel.
 @param y translation distance on y axis in display pixel.
 @param z translation distance on z axis in display pixel.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierTranslate3D(CGFloat x, CGFloat y, CGFloat z);

/**
 Rotate 2d.
 
 @param z rotation in radian.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierRotate(CGFloat z);

/**
 Rotate 3d.
 
 @param x rotation on x axis in radian, default 0.
 @param y rotation on y axis in radian, default 0.
 @param z rotation on z axis in radian, default 0.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierRotateXYZ(CGFloat x, CGFloat y, CGFloat z);


#pragma mark - Appearance modifiers

/**
 Set the opacity for the view to animate from/to.
 
 @param opacity the opacity for the view to animate from/to
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierOpacity(CGFloat opacity);

/**
 Set the backgroundColor for the view to animate from/to.
 
 @param color backgroundColor for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierBackgroundColor(UIColor *color);

/**
 Set the cornerRadius for the view to animate from/to.
 
 @param cornerRadius cornerRadius for the view to animate from/to
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierCornerRadius(CGFloat cornerRadius);

/**
 Set the zPosition for the view to animate from/to.
 
 @param zPosition zPosition for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierZPosition(CGFloat zPosition);

/**
 Set the contentsRect for the view to animate from/to.
 
 @param contentsRect contentsRect for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierContentsRect(CGRect contentsRect);

/**
 Set the contentsScale for the view to animate from/to.
 
 @param contentsScale contentsScale for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierContentsScale(CGFloat contentsScale);

/**
 Set the borderWidth for the view to animate from/to.
 
 @param borderWidth borderWidth for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */

SDOSHeroModifier * _Nonnull HeroModifierBorderWidth(CGFloat borderWidth);
/**
 Set the borderColor for the view to animate from/to.
 
 @param borderColor borderColor for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierBorderColor(UIColor *borderColor);

/**
 Set the shadowColor for the view to animate from/to.
 
 @param shadowColor shadowColor for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierShadowColor(UIColor *shadowColor);

/**
 Set the shadowOpacity for the view to animate from/to.
 
 @param shadowOpacity shadowOpacity for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierShadowOpacity(CGFloat shadowOpacity);

/**
 Set the shadowOffset for the view to animate from/to.
 
 @param shadowOffset shadowOffset for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierShadowOffset(CGSize shadowOffset);

/**
 Set the shadowRadius for the view to animate from/to.
 
 @param shadowRadius shadowRadius for the view to animate from/to
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierShadowRadius(CGFloat shadowRadius);

/**
 Set the shadowPath for the view to animate from/to.
 
 @param shadowPath shadowPath for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierShadowPath(CGPathRef shadowPath);

/**
 Set the masksToBounds for the view to animate from/to.
 
 @param masksToBounds masksToBounds for the view to animate from/to.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierMasksToBounds(BOOL masksToBounds);

/**
 Create an overlay on the animating view..
 
 @param color color of the overlay.
 @param opacity opacity of the overlay.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierOverlayColor(UIColor *color, CGFloat opacity);


#pragma mark - Timing modifiers

/**
 Sets the duration of the animation for a given view. If not used, Hero will use determine the duration based on the distance and size changes.
 
 @param duration duration of the animation.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierDuration(double duration);

/**
 Sets the duration of the animation for a given view to match the longest animation of the transition.
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierDurationMatchLongest(void);

/**
 Sets the delay of the animation for a given view.
 
 @param delay delay of the animation.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierDelay(double delay);

/**
 (iOS 9+) Use spring animation with custom stiffness & damping. The duration will be automatically calculated. Will be ignored if arc, timingFunction, or duration is set.
 
 @param stiffness stiffness of the spring.
 @param damping damping of the spring.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierSpring(CGFloat stiffness, CGFloat damping) API_AVAILABLE(ios(9.0));

/**
 Sets the timing function of the animation for a given view. If not used, Hero will use determine the timing function based on whether or not the view is entering or exiting the screen.
 
 @param timingFunction timing function of the animation.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier.
 */
SDOSHeroModifier * _Nonnull HeroModifierTimingFunction(CAMediaTimingFunction *timingFunction);


#pragma mark - Other modifiers

/**
 Transition from/to the state of the view with matching heroID
 Will also force the view to use global coordinate space.
 
 The following layer properties will be animated from the given view.
 
 position
 bounds.size
 cornerRadius
 transform
 shadowColor
 shadowOpacity
 shadowOffset
 shadowRadius
 shadowPath
 
 Note that the following properties **won't** be taken from the source view.
 
 backgroundColor
 borderWidth
 borderColor
 
 @param source_heroID the source view's heroId.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierSource(NSString * _Nonnull source_heroID);

/**
 Works in combination with position modifier to apply a natural curve when moving to the destination.
 
 @param intensity a value of 1 represent a downward natural curve ╰. a value of -1 represent a upward curve ╮.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierArc(CGFloat intensity);

/**
 Cascade applies increasing delay modifiers to subviews starting with the subviews at the bottom.
 
 @param delta delay in between each animation.
 @param direction cascade direction
 @param delayMatchedViews whether or not to delay matched subviews until all cascading animation have started.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierCascade(CGFloat delta, enum HeroModifierCascadeDirection direction, BOOL delayMatchedViews);

/**
 Radial cascade applies increasing delay modifiers to subviews starting with the subviews closer to the passed center.
 
 @param delta delay in between each animation.
 @param center the point used to decide what subviews are animated before. The closer a subview is from the center, the sooner it will animate.
 @param delayMatchedViews whether or not to delay matched subviews until all cascading animation have started.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierCascadeRadial(CGFloat delta, CGPoint center, BOOL delayMatchedViews);

/**
 Inverse radial cascade applies increasing delay modifiers to subviews starting with the subviews farther from the passed center.
 
 @param delta delay in between each animation.
 @param center the point used to decide what subviews are animated before. The closer a subview is from the center, the later it will animate.
 @param delayMatchedViews whether or not to delay matched subviews until all cascading animation have started.
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierCascadeInverseRadial(CGFloat delta, CGPoint center, BOOL delayMatchedViews);


#pragma mark - Advanced modifiers

/**
 Use global coordinate space.
 
 When using global coordinate space. The view become a independent view that is not a subview of any view.
 It won't move when its parent view moves, and won't be affected by parent view's attributes.
 
 When a view is matched, this is automatically enabled.
 The `source` modifier will also enable this.
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierUseGlobalCoordinateSpace(void);

/**
 Ignore all heroModifiers attributes for a view's direct subviews.
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierIgnoreSubviewModifiers(void);

/**
 Will create snapshot optimized for different view type.
 For custom views or views with masking, useOptimizedSnapshot might create snapshots
 that appear differently than the actual view.
 In that case, use .useNormalSnapshot or .useSlowRenderSnapshot to disable the optimization.
 
 This modifier actually does nothing by itself since .useOptimizedSnapshot is the default.
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierUseOptimizedSnapshot(void);

/**
 Create snapshot using snapshotView(afterScreenUpdates:).
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierUseNormalSnapshot(void);

/**
 Create snapshot using layer.render(in: currentContext).
 This is slower than .useNormalSnapshot but gives more accurate snapshot for some views (eg. UIStackView).
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierUseLayerRenderSnapshot(void);

/**
 Force Hero to not create any snapshot when animating this view.
 This will mess up the view hierarchy, therefore, view controllers have to rebuild
 its view structure after the transition finishes.
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierUseNoSnapshot(void);

/**
 Force the view to animate.
 
 By default, Hero will not animate if the view is outside the screen bounds or if there is no animatable hero modifier, unless this modifier is used.
 
 @return A SDOSHeroModifier instance representing the appropriate Hero modifier
 */
SDOSHeroModifier * _Nonnull HeroModifierForceAnimate(void);
@end
