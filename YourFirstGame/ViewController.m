//
//  ViewController.m
//  YourFirstGame
//
//  Created by Andrei on 8/30/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateScore];
}

- (void)moveFunnyGuyToRandomLocation:(UIButton *)funnyGuy {
    CGRect frame = funnyGuy.frame;
    
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat viewHeight = self.view.frame.size.height;
    
    CGFloat funnyGuyWidth = funnyGuy.frame.size.width;
    CGFloat funnyGuyHeight = funnyGuy.frame.size.height;
    
    frame.origin.x = rand() % (int)(viewWidth - funnyGuyWidth);
    frame.origin.y = rand() % (int)(viewHeight - funnyGuyHeight);
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         funnyGuy.frame = frame;
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
