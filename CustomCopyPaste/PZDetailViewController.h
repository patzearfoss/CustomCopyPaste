//
//  PZDetailViewController.h
//  CustomCopyPaste
//
//  Created by Patrick Zearfoss on 3/28/13.
//  Copyright (c) 2013 Patrick Zearfoss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PZDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
