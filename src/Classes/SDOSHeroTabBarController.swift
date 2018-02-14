//
//  SDOSHeroTabBarController.swift
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 24/7/17.
//

import UIKit
import Hero

public class SDOSHeroTabBarController: UITabBarController {
    
    /// Method used to set the Hero animation type for the item selections of the tab bar. For visual consistency, the passed animation `type` will be used when the target item index is bigger than the current index. Otherwise, the opposite animation will be used.
    ///
    /// - Parameter type: The type of the transition animation for the tab bar item selection.
    @objc public func setSDOSHeroTabBarDefaultAnimationType(_ type: SDOSHeroDefaultAnimationType) {
        heroTabBarAnimationType = type.heroDefaultAnimationType
        currentTabBarAnimationTypeIsReversed = false
    }
    
    private var currentTabBarAnimationTypeIsReversed: Bool = false
    
    override public func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let items = tabBar.items,
            let nextIndex = items.index(of: item) {
            let currentIndex = selectedIndex
            
            guard currentIndex != nextIndex else {
                // This prevents a bug where if different buttons of the tabBar are tapped very quickly, then currentIndex and nextIndex are equal and this could make currentTabBarAnimationTypeIsReversed change without the heroTabBarAnimationType changing
                return
            }
            
            if (nextIndex < currentIndex && !currentTabBarAnimationTypeIsReversed) || (nextIndex > currentIndex && currentTabBarAnimationTypeIsReversed) {
                heroTabBarAnimationType = heroTabBarAnimationType.oppositeAnimationType
            }
            currentTabBarAnimationTypeIsReversed = nextIndex < currentIndex
            
            // Necessary to avoid a crash of Hero when tapping the tabBar very quickly
            tabBar.isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.35, execute: {
                tabBar.isUserInteractionEnabled = true
            })
        }
    }

}
