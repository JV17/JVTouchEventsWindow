//
//  JVViewController.m
//  JVTouchEventsWindow
//
//  Created by Jorge Valbuena on 04/20/2015.
//  Copyright (c) 2014 Jorge Valbuena. All rights reserved.
//

#import "JVViewController.h"

@interface JVViewController ()

@end

@implementation JVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.view.frame)-25, CGRectGetWidth(self.view.frame), 50)];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.numberOfLines = 1;
    label.text = @"Touch/Click Me!";
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
