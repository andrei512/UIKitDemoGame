//
//  UIView+FastAccess.h
//  YourFirstGame
//
//  Created by Andrei on 8/30/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FastAccess)

- (void)setX:(CGFloat)x;
- (CGFloat)x;

- (void)setY:(CGFloat)y;
- (CGFloat)y;

- (void)setHeight:(CGFloat)height;
- (CGFloat)height;

- (void)setWidth:(CGFloat)width;
- (CGFloat)width;

- (void)setSize:(CGSize)size;
- (CGSize)size;

- (void)setOrigin:(CGPoint)origin;
- (CGPoint)origin;


@end
