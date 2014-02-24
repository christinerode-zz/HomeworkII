//
//  PostViewController.m
//  HomeworkII
//
//  Created by Christine Røde on 2/15/14.
//  Copyright (c) 2014 Christine Røde. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *scrollContent;
@property (weak, nonatomic) IBOutlet UIView *postCard;

@property (weak, nonatomic) IBOutlet UIImageView *imageAttachment;

@property (weak, nonatomic) IBOutlet UIView *UFI;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@property (weak, nonatomic) IBOutlet UIImageView *userPicture;

@property (weak, nonatomic) IBOutlet UIView *composer;

- (IBAction)buttonLike:(id)sender;
- (IBAction)buttonPost:(id)sender;
- (IBAction)onTapOut:(UITapGestureRecognizer *)sender;

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;


@end

@implementation PostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
         self.title = @"Post";
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:(0.84) green:(0.84) blue:(0.84) alpha:1]];
    
                               
    // Card styles
    self.postCard.layer.masksToBounds = NO;
    self.postCard.layer.cornerRadius = 3;
    self.postCard.layer.shadowRadius = 1;
    self.postCard.layer.shadowOffset = CGSizeMake(0, 1);
    self.postCard.layer.shadowColor = [UIColor blackColor].CGColor;
    self.postCard.layer.shadowOpacity = 0.22;
    self.postCard.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.postCard.bounds].CGPath;
    
    // Composer
    self.composer.layer.shadowRadius = 1;
    self.composer.layer.shadowOffset = CGSizeMake(0, -1);
    self.composer.layer.shadowColor = [UIColor blackColor].CGColor;
    self.composer.layer.shadowOpacity = 0.22;
    self.composer.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.postCard.bounds].CGPath;

    self.userPicture.layer.cornerRadius = 1.5;
    self.userPicture.frame = CGRectMake(12, 12, 40, 40);
    
    self.imageAttachment.layer.shadowRadius = 1;
    self.imageAttachment.layer.shadowOffset = CGSizeMake(0, 1);
    self.imageAttachment.layer.shadowColor = [UIColor blackColor].CGColor;
    self.imageAttachment.layer.shadowOpacity = 0.2;
    self.imageAttachment.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.imageAttachment.bounds].CGPath;
    
    UIBarButtonItem *messages = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"messages"] style:UIBarButtonItemStylePlain target:nil action:NULL];
    
    self.navigationItem.rightBarButtonItem = messages;
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:NO];
    
    // Set scroll container
    self.scrollView.contentSize = CGSizeMake(self.scrollContent.frame.size.width, 556);
    
    // Position composer
    self.composer.frame = CGRectMake(0, self.view.frame.size.height-self.composer.frame.size.height-self.tabBarController.tabBar.frame.size.height, 320, self.composer.frame.size.height);
    
    [self.composer setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonLike:(id)sender {
    self.likeButton.selected = !self.likeButton.selected;
}

- (IBAction)buttonPost:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onTapOut:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}


- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.composer.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.composer.frame.size.height, self.composer.frame.size.width, self.composer.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification{

    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
//    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.composer.frame = CGRectMake(0, self.view.frame.size.height-self.composer.frame.size.height-self.tabBarController.tabBar.frame.size.height, self.composer.frame.size.width, self.composer.frame.size.height);
                     }
                     completion:nil];

    
}

@end
