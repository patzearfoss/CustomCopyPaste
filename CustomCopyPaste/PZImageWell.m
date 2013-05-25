//
//  PZImageWell.m
//  CustomCopyPaste
//
//  Created by Patrick Zearfoss on 3/28/13.
//  Copyright (c) 2013 Patrick Zearfoss. All rights reserved.
//

#import "PZImageWell.h"
#import "PZAppDelegate.h"

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
    UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:pasteboardIdentifier create:NO];
    [pasteboard setImage:self.image];
}

- (void)paste:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:pasteboardIdentifier create:NO];
    if (pasteboard.image) self.image = pasteboard.image;
}

- (void)thumb:(id)sender
{
    UIImage *thumb = [self thumbnailFromImage:self.image];
    [[UIPasteboard pasteboardWithName:pasteboardIdentifier create:NO] setImage:thumb];
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)sender
{
    NSLog(@"long press");

    UIMenuController *menu = [UIMenuController sharedMenuController];
    if (![menu isMenuVisible])
    {
        [self becomeFirstResponder];
        UIMenuItem *item = [[UIMenuItem alloc] initWithTitle:@"Copy Thumbnail" action:@selector(thumb:)];
        menu.menuItems = @[item];
        [menu setTargetRect:self.frame inView:self.superview];
        [menu setMenuVisible:YES animated:YES];
    }
}

// http://beageek.biz/how-to-create-thumbnail-uiimage-xcode-ios/
- (UIImage *)thumbnailFromImage:(UIImage *)source
{
    CGSize originalSize = source.size;
    CGSize destSize = CGSizeMake(originalSize.width / 3, originalSize.height / 3);
    
    UIGraphicsBeginImageContext(destSize);
    [source drawInRect:(CGRect){CGPointZero, destSize}];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
