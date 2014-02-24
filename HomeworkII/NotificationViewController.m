//
//  NotificationViewController.m
//  HomeworkII
//
//  Created by Christine Røde on 2/22/14.
//  Copyright (c) 2014 Christine Røde. All rights reserved.
//

#import "NotificationViewController.h"
#import "User.h"
#import "NotificationCell.h"
#import "UIImageView+AFNetworking.h"

@interface NotificationViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *users;

@end

@implementation NotificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Notifications";
        
        self.users = [User fakeUsers];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *search = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:nil action:NULL];
    UIBarButtonItem *messages = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"messages"] style:UIBarButtonItemStylePlain target:nil action:NULL];
    
    self.navigationItem.leftBarButtonItem = search;
    self.navigationItem.rightBarButtonItem = messages;

        
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 80;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    User *user = self.users[indexPath.row];
    
    // Create Profile Picture View
    UIImageView *profilePicture = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"profilepicture"]];
    NSURL *url = [NSURL URLWithString:user.profileUrl];
    [profilePicture setImageWithURL:url];
    profilePicture.frame = CGRectMake(4, 4, 70, 70);
    
    // Create Notification text
    UILabel *notificationText = [[UILabel alloc] initWithFrame: CGRectMake(82, 3, 220, 100)];
    [notificationText setFont:[UIFont fontWithName:@"Helvetica Neue" size:12]];
    //[notificationText setBackgroundColor:[UIColor redColor]];
    
    // Set HTML and CSS for the notification text
    NSString *html = [NSString stringWithFormat:@"<p><b>%@</b> %@</p>", user.name, user.notifText];
    NSString *styledHtml = [self styledHTMLwithHTML:html];
    NSAttributedString *attributedText = [self attributedStringWithHTML:styledHtml];
    notificationText.attributedText = attributedText;
    [notificationText setNumberOfLines:3];
    [notificationText sizeToFit];
    
    // Create Notification Timestamp
    UILabel *notificationTime = [[UILabel alloc] initWithFrame: CGRectMake(104, 60, 240, 11)];
    [notificationTime setFont:[UIFont fontWithName:@"Helvetica Neue" size:11]];
    [notificationTime setTextColor:[UIColor colorWithRed:(0.5) green:(0.5) blue:(0.5) alpha:1]];
    [notificationTime setNumberOfLines:1];
    notificationTime.text = user.time;
    
    // Create Icon
    UIImageView *notifIcon = [[UIImageView alloc] init];
    NSURL *iconurl = [NSURL URLWithString:user.icon];
    [notifIcon setImageWithURL:iconurl];
    notifIcon.frame = CGRectMake(82, 57, 16, 16);
    
    // Set SubViews
    [cell addSubview:profilePicture];
    [cell addSubview:notificationText];
    [cell addSubview:notificationTime];
    [cell addSubview:notifIcon];

    
    return cell;
}

- (NSString *)styledHTMLwithHTML:(NSString *)HTML {
    
    NSString *style = @"<meta charset=\"UTF-8\"><style> body { font-family: 'HelveticaNeue'; font-size: 13px; } p {line-height: 16px; margin-bottom: 0px} b {font-family: 'HelveticaNeue' !important; font-weight: bold; }</style>";
    
    return [NSString stringWithFormat:@"%@%@", style, HTML];
}

- (NSAttributedString *)attributedStringWithHTML:(NSString *)HTML {
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType };
    return [[NSAttributedString alloc] initWithData:[HTML dataUsingEncoding:NSUTF8StringEncoding] options:options documentAttributes:NULL error:NULL];
}


@end
