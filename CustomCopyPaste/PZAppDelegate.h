//
//  PZAppDelegate.h
//  CustomCopyPaste
//
//  Created by Patrick Zearfoss on 3/28/13.
//  Copyright (c) 2013 Patrick Zearfoss. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const pasteboardIdentifier;

@interface PZAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UISplitViewController *splitViewController;

@end
