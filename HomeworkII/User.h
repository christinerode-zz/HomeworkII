//
//  User.h
//  HomeworkII
//
//  Created by Christine Røde on 2/22/14.
//  Copyright (c) 2014 Christine Røde. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profileUrl;
@property (nonatomic, strong) NSString *notifText;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *icon;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)fakeUsers;


@end
