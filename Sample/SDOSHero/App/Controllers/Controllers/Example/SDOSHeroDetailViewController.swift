//
//  SDOSHeroDetailViewController.swift
//  SDOSHeroExample
//
//  Created by Antonio Jesús Pallares on 02/05/2019.
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import Hero
import SDOSHero

class SDOSHeroDetailViewController: BaseViewController {
    
    var textAnimationType = ""
    var heroIdPrefix = ""
    
    @IBOutlet private weak var lbAnimationGoTitle: UILabel!
    @IBOutlet private weak var lbAnimationGo: UILabel!
    @IBOutlet private weak var lbAnimationReturnTitle: UILabel!
    @IBOutlet private weak var lbAnimationReturn: UILabel!
    
    @IBOutlet private weak var constraintCenterTop: NSLayoutConstraint!
    @IBOutlet private weak var constraintCenterBottom: NSLayoutConstraint!
    
    private var isInsideNavigation: Bool {
        return navigationController?.viewControllers.first !== self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStyle()
    }
    
    private func loadStyle() {
        if navigationController?.viewControllers.first === self {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(actionBack(_ :)))
        }
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
        
        let item0 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(actionNext(_ :)))
        let item1 = UIBarButtonItem(title: "Root", style: .plain, target: self, action: #selector(actionGoToRootViewController(_ :)))
        navigationItem.rightBarButtonItems = [item0, item1]
        
        lbAnimationGo.loadStyleLabelExample()
        lbAnimationGo.hero.id = heroIdPrefix + textAnimationType
        lbAnimationGo.hero.modifiers = [.spring(stiffness: 300, damping: 15)]
        lbAnimationGo.text = textAnimationType
        
        let animationType = HeroDefaultAnimationType.typeForIdentifier(textAnimationType)
        let textOppositeAnimationType = animationType.oppositeAnimationType.identifier
        lbAnimationReturn.loadStyleLabelExample()
        lbAnimationReturn.hero.id = heroIdPrefix + textOppositeAnimationType
        lbAnimationReturn.hero.modifiers = [.delay(0.5)]
        lbAnimationReturn.text = textOppositeAnimationType
        
        let titleGo: String
        let titleReturn: String
        if isInsideNavigation {
            titleGo = "The push animation was"
            titleReturn = "The pop animation will be"
        } else {
            titleGo = "The present animation was";
            titleReturn = "The dismiss animation will be";
        }
        
        lbAnimationGoTitle.loadStyleLabelExample()
        lbAnimationGoTitle.text = titleGo
        
        lbAnimationReturnTitle.loadStyleLabelExample()
        lbAnimationReturnTitle.text = titleReturn
        
        if Bool.random() {
            constraintCenterTop.priority = UILayoutPriority(1)
            constraintCenterBottom.priority = UILayoutPriority(999)
        }
    }
    
    @objc func actionBack(_ sender: Any) {
        if isInsideNavigation {
            navigationController?.popViewController(animated: true)
        } else {
            navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func actionNext(_ sender: Any) {
        let animationType = HeroDefaultAnimationType.allPosibleAnimationTypes.randomElement() ?? .auto
        if isInsideNavigation {
            if let detailVC = storyboard?.instantiateViewController(withIdentifier: SDOSHeroDetailViewControllerIdentifier) as? SDOSHeroDetailViewController {
                detailVC.textAnimationType = animationType.identifier
                (navigationController as? SDOSHeroNavigationController)?.pushViewController(detailVC, usingAnimation: animationType)
            }
        } else {
            if
                let navigationController = storyboard?.instantiateViewController(withIdentifier: SDOSHeroDetailNavigationViewControllerIdentifier) as? UINavigationController,
                let firstVC = navigationController.viewControllers.first as? SDOSHeroDetailViewController
            {
                navigationController.hero.isEnabled = true
                navigationController.animationTypeForPresenting = animationType
                firstVC.textAnimationType = animationType.identifier
                navigationController.present(navigationController, animated: true, completion: nil)
            }
        }
    }
    
    @objc func actionGoToRootViewController(_ sender: Any) {
        if isInsideNavigation {
            navigationController?.popToRootViewController(animated: true)
        } else {
            dismissAllPresentedViewControllers()
        }
    }
    
}
