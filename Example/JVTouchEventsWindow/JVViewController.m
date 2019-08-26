//
//  JVViewController.m
//  JVTouchEventsWindow
//
//  Created by Jorge Valbuena on 04/20/2015.
//  Copyright (c) 2014 Jorge Valbuena. All rights reserved.
//

#import "JVViewController.h"

@implementation JVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // gradient background color
    CAGradientLayer *newGradient = [CAGradientLayer layer];
    newGradient.frame = self.view.frame;
    UIColor *firstColor = [self colorWithHexString:@"FB2B69"];
    UIColor *secondColor = [self colorWithHexString:@"FF5B37"];
    
    newGradient.colors = [NSArray arrayWithObjects:(id)firstColor.CGColor, (id)secondColor.CGColor, nil];
    [self.view.layer insertSublayer:newGradient atIndex:0];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.view.frame)-25, CGRectGetWidth(self.view.frame), 50)];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.numberOfLines = 1;
    label.text = @"Touch/Click Me!";
    
    [self.view addSubview:label];
}


#pragma mark - Helper functions

- (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    //converts the hex value into a colour
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    return [self colorWithRGBHex:hexNum];
}

- (UIColor *)colorWithRGBHex:(UInt32)hex
{
    //converts a hex number into a colour
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

@end
