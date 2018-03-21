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

@property (weak, nonatomic) IBOutlet UILabel *lbAnimationType;

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionNext:)];
    
    self.lbAnimationType.text = self.textAnimationType;
    self.lbAnimationType.heroID = self.textAnimationType;
    [self.lbAnimationType setHeroModifierStringWithHeroModifiers:@[HeroModifierArc(1)]];
    [self.lbAnimationType loadStyleLabelExample];
    [self.lbAnimationType loadStyleViewClear];
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
    if (self.navigationController.viewControllers.firstObject == self) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:SDOSHeroDetailNavigationViewControllerIdentifier];
        vc.isHeroEnabled = YES;
        [vc copyModalSDOSHeroAnimationTypeFromViewController:self.navigationController];
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    } else {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:SDOSHeroDetailViewControllerIdentifier];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
