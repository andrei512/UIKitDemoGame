//
//  ViewController.h
//  YourFirstGame
//
//  Created by Andrei on 8/30/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UIButton *funnyGuy;

@property (nonatomic) int score;

@property (nonatomic, strong) NSDate *lastMoved;

@property (nonatomic, strong) NSTimer *timer;

- (IBAction)didTapFunnyGuy:(UIButton *)funnyGuy;

- (IBAction)didTouchView:(UITapGestureRecognizer *)tapGesture;

@end
