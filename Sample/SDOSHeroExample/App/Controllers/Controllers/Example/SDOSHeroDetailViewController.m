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
        // [vc copyModalSDOSHeroAnimationTypeFromViewController:self.navigationController];
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

- (void)test {
    UIViewController *viewController = [[UIViewController alloc] init];
    
    // Presentación modal de viewController
    [viewController setSDOSHeroAnimationTypeForModalPresenting:SDOSHeroAnimationTypePageInUp];
    
    // Ocultación modal de viewController
    [viewController setSDOSHeroAnimationTypeForModalDismissing:SDOSHeroOppositeAnimationTo(SDOSHeroAnimationTypePageInUp)];
    
    // Presentación y ocultación modal de viewController simultáneamente
    [viewController setSDOSHeroAnimationTypeForModalPresenting:SDOSHeroAnimationTypePageInUp forModalDismissing:SDOSHeroOppositeAnimationTo(SDOSHeroAnimationTypePageInUp)];
    
    // Podemos consultar

    viewController.animationTypeForPresenting;
    viewController.animationTypeForDismissing;
    
    [self presentViewController:viewController usingAnimation:SDOSHeroAnimationTypeZoom];
    [self presentViewController:viewController usingAnimation:SDOSHeroAnimationTypeZoom completion:^{
        // Completion code here
    }];
    
    [self dismissViewControllerUsingAnimation:SDOSHeroAnimationTypeFade];
    [self dismissViewControllerUsingAnimation:SDOSHeroAnimationTypeFade completion:^{
        // Completion code here
    }];
    
    [self sdoshero_unwindToRootViewControllerUsingAnimation:SDOSHeroAnimationTypeNone];
    [self sdoshero_unwindToRootViewController];
    
    [self copyModalSDOSHeroAnimationTypeFromViewController:viewController];
    
    SDOSHeroNavigationController *navController = [[SDOSHeroNavigationController alloc] init];
    
    [navController setSDOSHeroAnimationTypeForPushNavigations:SDOSHeroAnimationTypePageInUp];
    
    [navController setSDOSHeroAnimationTypeForPopNavigations:SDOSHeroAnimationTypePullUp];
    
    [navController setSDOSHeroAnimationTypeForPushNavigations:SDOSHeroAnimationTypePageInUp forPopNavigations:SDOSHeroAnimationTypePullUp];
     
    [navController pushViewController:viewController usingAnimation:SDOSHeroAnimationTypePageInUp];
    
    // Se puede consultar el tipo de animación por defecto para la presentación y para la ocultación de un view controller específico
    navController.animationTypeForPush;
    navController.animationTypeForPop;
    
    
    [navController pushViewController:viewController usingAnimation:SDOSHeroAnimationTypeCoverRight];
    
    [navController pushViewController:viewController usingAnimationForPushAndOppositeForPop:SDOSHeroAnimationTypePullUp];
    
    [navController popViewControllerUsingAnimation:SDOSHeroAnimationTypeUncoverDown];
    
    [navController pushViewController:viewController usingAnimation:SDOSHeroAnimationTypeZoom withAnimationForPop:SDOSHeroAnimationTypeFade];
    
    [navController popToViewController:viewController usingAnimation:SDOSHeroAnimationTypeZoom];
    
}

@end










