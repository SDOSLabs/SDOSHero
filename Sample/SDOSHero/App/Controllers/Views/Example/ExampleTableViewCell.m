//
//  ExampleTableViewCell.m
//  SDOSHeroExample
//
//  Created by Antonio Jesús Pallares on 13/11/17.
//  Copyright © 2017 SDOS. All rights reserved.
//

#import "ExampleTableViewCell.h"


@interface ExampleTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *viewContainer;

@end

@implementation ExampleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self loadStyle];
}

- (void)loadStyle {
    [self.lbTitle loadStyleLabelExample];
    [self.viewContainer loadStyleViewBlue];
    [self.viewContainer loadStyleViewRoundedBorders];
}

@end
