//
//  SDOSHeroViewController.m
//  SDOSHeroExample
//
//  Created by Antonio Jesús Pallares on 13/11/17.
//  Copyright © 2017 SDOS. All rights reserved.
//

#import "SDOSHeroViewController.h"
#import "ExampleTableViewCell.h"
#import "SDOSHeroExample-Swift.h"

@interface SDOSHeroViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray <NSString *> *arrayAnimationTypes;


@end

@implementation SDOSHeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadStyle];
    [self registerCells];
    [self loadData];
}


- (void)loadStyle {
    self.navigationController.isHeroEnabled = YES; // For Navigation Transitions
    self.isHeroEnabled = YES; // For Modal Transitions
    self.navigationItem.title = [self.navigationController isKindOfClass:[SDOSHeroNavigationController class]] ? @"Navigation" : @"Modal";
}


- (void)registerCells {
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ExampleTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ExampleTableViewCell class])];
}


- (void)loadData {
    self.arrayAnimationTypes = [SDOSHeroAnimationTypeUtil getAllAnimationTypesIdentifiers];
}


#pragma mark - Actions

- (void)actionDismiss {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayAnimationTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = NSStringFromClass([ExampleTableViewCell class]);
    
    ExampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.lbTitle.text = self.arrayAnimationTypes[indexPath.row];
    cell.lbTitle.sdosHeroID = self.arrayAnimationTypes[indexPath.row];
    [cell.lbTitle setHeroModifierStringWithHeroModifiers:@[HeroModifierArc(1)]];
    return cell;
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ExampleTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *strIdentifier = cell.lbTitle.text;
    SDOSHeroAnimationType type = [SDOSHeroAnimationTypeUtil typeForIdentifier:strIdentifier];
    
    if ([self.navigationController isKindOfClass:[SDOSHeroNavigationController class]]) {
        [((SDOSHeroNavigationController *) self.navigationController) setSDOSHeroAnimationTypeForNavigationTransitions:type];
        [self performSegueWithIdentifier:ShowDetailStoryboardSegue sender:indexPath];
    } else {
        SDOSHeroNavigationController *detailNavigationController = [self.storyboard instantiateViewControllerWithIdentifier:SDOSHeroDetailNavigationViewControllerIdentifier];
        if (detailNavigationController != nil) {
//            [detailNavigationController setModalSDOSHeroAnimationType:type];
            
            if (detailNavigationController.viewControllers.firstObject != nil && [detailNavigationController.viewControllers.firstObject isKindOfClass:[SDOSHeroDetailViewController class]]) {
                ((SDOSHeroDetailViewController *) detailNavigationController.viewControllers.firstObject).textAnimationType = self.arrayAnimationTypes[indexPath.row];
            }
            [self.tabBarController presentViewController:detailNavigationController animated:YES completion:nil];
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:ShowDetailStoryboardSegue]) {
        if ([segue.destinationViewController isKindOfClass:[SDOSHeroDetailViewController class]] && [sender isKindOfClass:[NSIndexPath class]]) {
            ((SDOSHeroDetailViewController *)segue.destinationViewController).textAnimationType = self.arrayAnimationTypes[((NSIndexPath *) sender).row];
        }
    }
}


@end
