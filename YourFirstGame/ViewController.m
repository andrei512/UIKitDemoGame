//
//  ViewController.m
//  YourFirstGame
//
//  Created by Andrei on 8/30/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FastAccess.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateScore];
}

- (void)moveFunnyGuyToRandomLocation:(UIButton *)funnyGuy {
    CGFloat newX = rand() % (int)(self.view.width - funnyGuy.width);
    CGFloat newY = rand() % (int)(self.view.height - funnyGuy.height);
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         funnyGuy.origin = CGPointMake(newX, newY);
                     }];
}

- (void)updateScore {
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %04d", self.score];
}

- (IBAction)didTapFunnyGuy:(UIButton *)funnyGuy {
    [self moveFunnyGuyToRandomLocation:funnyGuy];
    
    self.score += 1;
    
    [self updateScore];
}

@end
