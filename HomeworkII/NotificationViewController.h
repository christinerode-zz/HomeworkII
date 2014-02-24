//
//  NotificationViewController.h
//  HomeworkII
//
//  Created by Christine Røde on 2/22/14.
//  Copyright (c) 2014 Christine Røde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (NSString *)styledHTMLwithHTML:(NSString *)HTML;

- (NSAttributedString *)attributedStringWithHTML:(NSString *)HTML;

@end
