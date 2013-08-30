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
    
    self.lastMoved = [NSDate date];

    [self updateScore];
    [self createAndFireTimer];
}

- (void)createAndFireTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(tick:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)tick:(NSTimer *)timer {
    if ([self timeSinceLastMoved] > 3) {
        [self moveFunnyGuyToRandomLocation:self.funnyGuy];
    }
}

#pragma mark - Helpers

- (void)moveFunnyGuyToRandomLocation:(UIButton *)funnyGuy {
    CGFloat newX = rand() % (int)(self.view.width - funnyGuy.width);
    CGFloat newY = rand() % (int)(self.view.height - funnyGuy.height);
    
    self.lastMoved = [NSDate date];
    
    const CGFloat speed = 700;
    
    CGFloat dx = funnyGuy.x - newX;
    CGFloat dy = funnyGuy.y - newY;
    
    CGFloat distance = sqrt(pow(dx, 2) + pow(dy, 2));
    
    
    [UIView animateWithDuration:distance / speed
                     animations:^{
                         funnyGuy.origin = CGPointMake(newX, newY);
                     }];
}

- (void)updateScore {
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %04d", self.score];
}

- (CGFloat)timeSinceLastMoved {
    CGFloat timeInterval = -[self.lastMoved timeIntervalSinceNow];
    
    return timeInterval;
}

#pragma mark - Actions

- (IBAction)didTapFunnyGuy:(UIButton *)funnyGuy {
    self.score += 15 / [self timeSinceLastMoved];
    [self updateScore];

    
    [self moveFunnyGuyToRandomLocation:funnyGuy];
}

- (IBAction)didTouchView:(UITapGestureRecognizer *)tapGesture {
    if (tapGesture.state == UIGestureRecognizerStateRecognized) {
        if (self.score > 0) {
            self.score = self.score * 2 / 3;
        }
        
        [self updateScore];
    }
}

@end
