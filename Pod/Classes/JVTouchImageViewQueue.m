//
//  JVTouchImageViewQueue.m
//  Pods
//
//  Created by Jorge Valbuena on 2015-04-20.
//
//

#import "JVTouchImageViewQueue.h"
#import "JVTouchHelper.h"

@interface JVTouchImageViewQueue()

@property (nonatomic, strong) NSMutableArray *queueArray;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic) CGSize size;
@property (nonatomic) NSUInteger count;

@end

@implementation JVTouchImageViewQueue

#pragma mark - Custom initializer

- (instancetype)init
{
    return [self initWithTouchesCount:TOUCH_COUNT
                        andImageColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.7]
                        withImageSize:CGSizeMake(TOUCH_SIZE, TOUCH_SIZE)];
}

- (instancetype)initWithTouchesCount:(NSUInteger)count
{
    return [self initWithTouchesCount:count
                        andImageColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.7]
                        withImageSize:CGSizeMake(TOUCH_SIZE, TOUCH_SIZE)];
}

- (instancetype)initWithTouchesCount:(NSUInteger)count andImageColor:(UIColor *)color withImageSize:(CGSize)size
{
    if (!(self = [super init]))
        return nil;
    
    // we need to make sure that we have a touch count, color for our image and the size of the image
    self.count = (count != 0.0f) ? count : TOUCH_COUNT;
    self.color = (color != nil) ? color : [[UIColor lightGrayColor] colorWithAlphaComponent:0.7];
    self.size = (size.width != 0.0f || size.height != 0.0f) ? size : CGSizeMake(TOUCH_SIZE, TOUCH_SIZE);
    
    self.queueArray = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < self.count; i++)
    {
        UIImageView *imgView = [self createImageView];
        [self.queueArray addObject:imgView];
    }
    
    return self;
}


#pragma mark - Custom getters & setters

- (UIImage *)image
{
    if(!_image)
    {
        _image = [JVTouchHelper imageWithColor:self.color];
    }
    
    return _image;
}

- (UIImageView *)createImageView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
    imageView.image = self.image;
    imageView.layer.borderWidth = 0.5;
    imageView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.7].CGColor;
    imageView.layer.cornerRadius = self.size.width/2;
    imageView.layer.masksToBounds = YES;
    
    return imageView;
}


#pragma mark - Queue helper functions

- (UIImageView *)popTouchImageView
{
    UIImageView *touchImageView = [self.queueArray firstObject];
    [self.queueArray removeObjectAtIndex:0];
    
    return touchImageView;
}

- (void)pushTouchImageView:(UIImageView *)touchImageView
{
    [self.queueArray addObject:touchImageView];
}


@end
