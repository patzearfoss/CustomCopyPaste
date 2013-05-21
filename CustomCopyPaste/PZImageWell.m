//
//  PZImageWell.m
//  CustomCopyPaste
//
//  Created by Patrick Zearfoss on 3/28/13.
//  Copyright (c) 2013 Patrick Zearfoss. All rights reserved.
//

#import "PZImageWell.h"

@implementation PZImageWell

- (void)initCommon
{
    UILongPressGestureRecognizer *lpRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self addGestureRecognizer:lpRecognizer];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initCommon];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initCommon];
    }
    return self;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)cut:(id)sender
{
    [self copy:sender];
    self.image = nil;
}

- (void)copy:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setImage:self.image];
}

- (void)paste:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if (pasteboard.image) self.image = pasteboard.image;
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)sender
{
    NSLog(@"long press");

    UIMenuController *menu = [UIMenuController sharedMenuController];
    if (![menu isMenuVisible])
    {
        [self becomeFirstResponder];
        [menu setTargetRect:self.frame inView:self.superview];
        [menu setMenuVisible:YES animated:YES];
    }
    
}

@end
