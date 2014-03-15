//
//  KKViewController.m
//  KKActionSheetExample
//
//  Created by Kirill Kunst on 15.03.14.
//  Copyright (c) 2014 Kirill Kunst. All rights reserved.
//

#import "KKViewController.h"
#import "KKActionSheet.h"

@interface KKViewController () <UIActionSheetDelegate>

- (IBAction)actionShowActionSheet:(id)sender;

@end

@implementation KKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)actionShowActionSheet:(id)sender
{
    KKActionSheet *sheet = [[KKActionSheet alloc] initWithTitle:@"Test actionsheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Button index 1",@"Button index 2", nil];
    
    [sheet setTitlesTextColor:[UIColor blackColor]];
    [sheet setTextColors:@[[UIColor redColor], [UIColor blueColor]] forButtonIndexes:@[@(0),@(1)]];
    [sheet showInView:self.view];
}
@end
