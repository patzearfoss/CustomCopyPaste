//
//  PZMasterViewController.h
//  CustomCopyPaste
//
//  Created by Patrick Zearfoss on 3/28/13.
//  Copyright (c) 2013 Patrick Zearfoss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PZDetailViewController;

@interface PZMasterViewController : UITableViewController

@property (strong, nonatomic) PZDetailViewController *detailViewController;

@end
