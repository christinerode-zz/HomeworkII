//
//  User.m
//  HomeworkII
//
//  Created by Christine Røde on 2/22/14.
//  Copyright (c) 2014 Christine Røde. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    self.name = dictionary[@"name"];
    self.profileUrl = [dictionary valueForKeyPath:@"profileUrl.small"];
    self.notifText  = [dictionary valueForKeyPath:@"notifText"];
    self.time = [dictionary valueForKeyPath:@"time"];
    self.icon = [dictionary valueForKeyPath:@"icon"];
    
    return self;
    
}

+ (NSArray *)fakeUsers {
    NSMutableArray *users = [[NSMutableArray alloc] init];
    
    NSDictionary *user1 =
        @{@"name" : @"Christine Røde",
          @"profileUrl" : @{@"small" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-frc3/t1/c7.0.320.320/p320x320/1798146_10153785534170201_401031210_n.jpg"},
          @"notifText" : @"commented on your <b>post</b>: \"Lorem ipsum dolor sit amet.\"",
          @"time" : @"Friday at 2:12 AM",
          @"icon" : @"https://facebook.com/images/litestand/bookmarks/sidebar/icons/small/icon-comment-rounded-2x.png"
        };
    
    User *user = [[User alloc] initWithDictionary:user1];
    [users addObject: user];
    
    NSDictionary *user2 =
    @{@"name" : @"Taylor Rogalski",
      @"profileUrl" : @{@"small" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash1/t1/c80.0.320.320/p320x320/998230_504408089651724_2400461_n.jpg"},
      @"notifText" : @"posted in <b>iOS Bootcamp for Designers</b>: \"Lorem ipsum dolor sit amet.\"",
      @"time" : @"Thursday at 2:12 AM",
      @"icon" : @"https://facebook.com/images/litestand/bookmarks/sidebar/icons/small/icon-announcement-2x.png"
      };
    
    user = [[User alloc] initWithDictionary:user2];
    [users addObject: user];
    
    NSDictionary *user3 =
    @{@"name" : @"Colin Deckner",
      @"profileUrl" : @{@"small" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/t1/c0.0.320.320/p320x320/1520683_10152101170817419_193251736_n.jpg"},
      @"notifText" : @"and <b>15 others</b> like a photo you're tagged in. ",
      @"time" : @"Wednesday at 2:12 AM",
      @"icon" : @"https://facebook.com/images/litestand/bookmarks/sidebar/icons/small/icon-like-2x.png"
      };
    
    user = [[User alloc] initWithDictionary:user3];
    [users addObject: user];
    
    NSDictionary *user4 =
    @{@"name" : @"Jonathan Toon",
      @"profileUrl" : @{@"small" : @"https://scontent-1.32934.fna.fbcdn.net/hprofile-prn2/t1/p200x200/1622834_10202291298597169_295719945_n.jpg"},
      @"notifText" : @"and <b>3 others</b> like your <b>post</b>: \"Lorem ipsum dolor sit amet.\"",
      @"time" : @"Friday at 2:12 AM",
      @"icon" : @"https://facebook.com/images/litestand/bookmarks/sidebar/icons/small/icon-like-2x.png"
      };
    
    user = [[User alloc] initWithDictionary:user4];
    [users addObject: user];
    
    NSDictionary *user5 =
    @{@"name" : @"Timothy Lee",
      @"profileUrl" : @{@"small" : @"https://scontent-a-sea.xx.fbcdn.net/hprofile-ash2/t1/c27.27.334.334/s200x200/216368_822384387933_45758_n.jpg"},
      @"notifText" : @"posted in <b>iOS Bootcamp for Designers</b>: \"Lorem ipsum dolor sit amet.\"",
      @"time" : @"Thursday at 2:12 AM",
      @"icon" : @"https://facebook.com/images/litestand/bookmarks/sidebar/icons/small/icon-wallpost-2x.png"
      };
    
    user = [[User alloc] initWithDictionary:user5];
    [users addObject: user];
    
    NSDictionary *user6 =
    @{@"name" : @"Kyle Meyer",
      @"profileUrl" : @{@"small" : @"https://scontent-1.32934.fna.fbcdn.net/hprofile-ash3/t1/c29.29.360.360/s200x200/546965_10100635578478038_1162724826_n.jpg"},
      @"notifText" : @"likes your <b>comment</b>: \"Lorem ipsum dolor sit amet.\"",
      @"time" : @"Wednesday at 2:12 AM",
      @"icon" : @"https://facebook.com/images/litestand/bookmarks/sidebar/icons/small/icon-like-2x.png"
      };
    
    user = [[User alloc] initWithDictionary:user6];
    [users addObject: user];
    
    return users;
    
}


@end
