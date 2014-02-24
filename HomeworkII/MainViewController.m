//
//  MainViewController.m
//  HomeworkII
//
//  Created by Christine Røde on 2/15/14.
//  Copyright (c) 2014 Christine Røde. All rights reserved.
//

#import "MainViewController.h"
#import "PostViewController.h"

@interface MainViewController ()
- (IBAction)toFeed:(UIButton *)sender;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Feed";
        
    }

    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    


}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toFeed:(UIButton *)sender {
    PostViewController *postvc = [[PostViewController alloc] init];
    
    [self.navigationController pushViewController:postvc animated:YES];
}
@end
