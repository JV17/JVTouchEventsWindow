//
//  JVTouchHelper.m
//  Pods
//
//  Created by Jorge Valbuena on 2015-04-20.
//
//

#import "JVTouchHelper.h"
#import "JVTouchEventsWindow.h"


#define RESOURCE_NAME @"JVTouchEventsWindow"

@implementation JVTouchHelper

+ (NSBundle *)myProjectResources
{
    static dispatch_once_t onceToken;
    static NSBundle *bundle = nil;
    
    dispatch_once(&onceToken, ^{
        // This bundle name must be the same as the product name for the resources bundle target
        NSURL *url = [[NSBundle bundleForClass:[JVTouchEventsWindow class]] URLForResource:RESOURCE_NAME withExtension:@"bundle"];
    
        if (!url) {
            url = [[NSBundle mainBundle] URLForResource:RESOURCE_NAME withExtension:@"bundle"];
        }
        
        bundle = [NSBundle bundleWithURL:url];
    });
    
    return bundle;
}

+ (UIImage *)bundleImageNamed:(NSString *)name
{
    UIImage *imageFromMainBundle = [UIImage imageNamed:name];
 
    if (imageFromMainBundle) {
        return imageFromMainBundle;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"%@.bundle/%@", RESOURCE_NAME, name];
    UIImage *imageFromBundle = [UIImage imageNamed:imageName];
    
    if (!imageFromBundle) {
        NSLog(@"Image not found: %@", name);
    }
    
    return imageFromBundle;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    //converts the hex value into a colour
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    return [self colorWithRGBHex:hexNum];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex
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
