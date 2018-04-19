//
//  SDOSHeroDetailViewController.m
//  SDOSHeroExample
//
//  Created by Antonio Jesús Pallares on 13/11/17.
//  Copyright © 2017 SDOS. All rights reserved.
//

#import "SDOSHeroDetailViewController.h"
#import "SDOSHeroExample-Swift.h"


@interface SDOSHeroDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbAnimationGoTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbAnimationGo;
@property (weak, nonatomic) IBOutlet UILabel *lbAnimationReturnTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbAnimationReturn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintCenterTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintCenterBottom;

@end

@implementation SDOSHeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadStyle];
}


- (void)loadStyle {
    if (self.navigationController.viewControllers.firstObject == self) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(actionBack:)];
    }
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionNext:)];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"Root" style:UIBarButtonItemStylePlain target:self action:@selector(actionGoToRootViewController:)];
    self.navigationItem.rightBarButtonItems = @[item0, item1];
    
    
    [self.lbAnimationGo loadStyleLabelExample];
    self.lbAnimationGo.sdosHeroID = self.textAnimationType;
    [self.lbAnimationGo setSDOSHeroModifiers:@[HeroModifierSpringWith(300, 15)]];
    self.lbAnimationGo.text = self.textAnimationType;

    NSString *textOppositeAnimationType = [SDOSHeroAnimationTypeUtil identifierForType:SDOSHeroOppositeAnimationTo([SDOSHeroAnimationTypeUtil typeForIdentifier:self.textAnimationType])];
    
    
    [self.lbAnimationReturn loadStyleLabelExample];
    self.lbAnimationReturn.sdosHeroID = textOppositeAnimationType;
    [self.lbAnimationReturn setSDOSHeroModifiers:@[HeroModifierDelay(0.5)]];
    self.lbAnimationReturn.text = textOppositeAnimationType;
    
    NSString *titleGo;
    NSString *titleReturn;
    if ([self isInsideNavigation]) {
        titleGo = @"The push animation was";
        titleReturn = @"The pop animation will be";
    } else {
        titleGo = @"The present animation was";
        titleReturn = @"The dismiss animation will be";
    }
    
    [self.lbAnimationGoTitle loadStyleLabelExample];
    self.lbAnimationGoTitle.text = titleGo;
    
    [self.lbAnimationReturnTitle loadStyleLabelExample];
    self.lbAnimationReturnTitle.text = titleReturn;
    
    
    if (arc4random() % 2) {
        self.constraintCenterTop.priority = 1;
        self.constraintCenterBottom.priority = 999;
    }
}


#pragma mark - Actions

- (void)actionBack:(UIBarButtonItem *)sender {
    if (self.navigationController.viewControllers.firstObject == self) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)actionNext:(UIBarButtonItem *)sender {
    SDOSHeroAnimationType type = [SDOSHeroAnimationTypeUtil randomAnimation];
    if (self.navigationController.viewControllers.firstObject == self) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:SDOSHeroDetailNavigationViewControllerIdentifier];
        
        vc.sdosHeroIsEnabled = YES;
        [vc setSDOSHeroAnimationTypeForModalPresenting:type];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            UIViewController *firstVC = ((UINavigationController *)vc).viewControllers.firstObject;
            if ([firstVC isKindOfClass:[SDOSHeroDetailViewController class]]) {
                ((SDOSHeroDetailViewController *) firstVC).textAnimationType = [SDOSHeroAnimationTypeUtil identifierForType:type];
            }
        }
        
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    } else {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:SDOSHeroDetailViewControllerIdentifier];
        if ([vc isKindOfClass:[SDOSHeroDetailViewController class]]) {
            ((SDOSHeroDetailViewController *) vc).textAnimationType = [SDOSHeroAnimationTypeUtil identifierForType:type];
        }
        [(SDOSHeroNavigationController *)self.navigationController pushViewController:vc usingAnimation:type];
    }
}


- (void)actionGoToRootViewController:(UIBarButtonItem *)sender {
    if (self.navigationController.viewControllers.firstObject == self) {
        [self sdoshero_unwindToRootViewController];
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


#pragma mark - Helper

- (BOOL)isInsideNavigation {
    return (self.navigationController.viewControllers.firstObject != self);
}

@end










