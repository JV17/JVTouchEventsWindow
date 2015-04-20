//
//  JVTouchImageViewQueue.m
//  Pods
//
//  Created by Jorge Valbuena on 2015-04-20.
//
//

#import "JVTouchImageViewQueue.h"

#define TOUCH_IMAGE @"JVTouchImage"


@interface JVTouchImageViewQueue()

@property (nonatomic, strong) NSMutableArray *backingArray;

@end

@implementation JVTouchImageViewQueue

- (instancetype)initWithTouchesCount:(NSUInteger)count
{
    if (self = [super init])
    {
        self.backingArray = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < count; i++)
        {
            UIImageView *imgView = [[UIImageView alloc] initWithImage:[JVTouchHelper bundleImageNamed:TOUCH_IMAGE]];
            [self.backingArray addObject:imgView];
        }
    }
    
    return self;
}

- (UIImageView *)popTouchImageView
{
    UIImageView *touchImageView = [self.backingArray firstObject];
    [self.backingArray removeObjectAtIndex:0];
    
    return touchImageView;
}

- (void)pushTouchImageView:(UIImageView *)touchImageView
{
    [self.backingArray addObject:touchImageView];
}


@end