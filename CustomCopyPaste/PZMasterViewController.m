//
//  PZMasterViewController.m
//  CustomCopyPaste
//
//  Created by Patrick Zearfoss on 3/28/13.
//  Copyright (c) 2013 Patrick Zearfoss. All rights reserved.
//

#import "PZMasterViewController.h"

#import "PZDetailViewController.h"

@interface PZMasterViewController ()
@property (nonatomic, strong) NSArray *imageObjects;
@end

@implementation PZMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.imageObjects = @[[UIImage imageNamed:@"img1.jpg"], [UIImage imageNamed:@"img2.jpg"], [UIImage imageNamed:@"img3.jpg"], [UIImage imageNamed:@"img4.jpg"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.imageObjects count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"Image %d", indexPath.row];
    cell.imageView.image = [self.imageObjects objectAtIndex:indexPath.row];
//    cell.imageView.contentMode = UIViewContentModeCenter;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *img = [self.imageObjects objectAtIndex:indexPath.row];
    self.detailViewController.detailItem = img;
}

@end
