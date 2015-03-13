//
//  RootViewController.m
//  AssessmentOne
//
//  Created by Sherrie Jones on 3/13/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController () 

@property (strong, nonatomic) IBOutlet UITextField *valueOne;
@property (strong, nonatomic) IBOutlet UITextField *valueTwo;
@property (strong, nonatomic) UINavigationBar *navTitle;
@property (strong, nonatomic) UIBarButtonItem *webButton;
@property (strong, nonatomic) NSString *totalValue;

@property int sumValue;
@property int valOne;
@property int valTwo;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.valOne = 0;
    self.valTwo = 0;
    self.totalValue = @"0";
    self.navigationItem.rightBarButtonItem.enabled = NO;

    if ([self.navigationItem.title  isEqual: @"Answer"]) {
        [self.navigationItem.title isEqual:self.totalValue];
    } else {
        [self.navigationItem.title isEqual: @"Answer"];
    }
}

-(IBAction)hideWebButton {
    if (self.sumValue % 5 == 0) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    } else {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
}

- (IBAction)onCalculateButtonPressed:(UIButton *)sender {

    self.valOne = [self.valueOne.text intValue];
    self.valTwo = [self.valueTwo.text intValue];
    self.sumValue = self.valOne * self.valTwo;
    self.totalValue = [NSString stringWithFormat:@"%d", self.sumValue];

    self.navigationItem.title = self.totalValue;
    //NSLog(@"TotVal: %@", self.totalValue);
    [self hideWebButton];

    // dismiss the keyboards
    [self.valueOne resignFirstResponder];
    [self.valueTwo resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *webVC = segue.destinationViewController;
    webVC.navigationItem.title = self.totalValue;
}


@end












