//
//  JVTouchEventsWindow.m
//  Pods
//
//  Created by Jorge Valbuena on 2015-04-20.
//
//

#import "JVTouchEventsWindow.h"
#import "JVTouchImageViewQueue.h"

@interface JVTouchEventsWindow ()

@property (nonatomic, strong) JVTouchImageViewQueue *touchImageViewQueue;
@property (nonatomic, strong) NSMutableDictionary *touchImageViewsDic;

@end


@implementation JVTouchEventsWindow

- (void)sendEvent:(UIEvent *)event
{
    NSSet *touches = [event allTouches];
    
    for (UITouch *touch in touches)
    {
        switch ([touch phase])
        {
            case UITouchPhaseBegan:
                [self touchBegan:touch];
                break;
                
            case UITouchPhaseMoved:
                [self touchMoved:touch];
                break;
                
            case UITouchPhaseEnded:
            case UITouchPhaseCancelled:
                [self touchEnded:touch];
                break;
                
            default:
                break;
        }
    }
    
    [super sendEvent:event];
}


- (void)touchBegan:(UITouch *)touch
{
    UIImageView *touchImageView = [self.touchImageViewQueue popTouchImageView];
    touchImageView.center = [touch locationInView:self];
    [self addSubview:touchImageView];
    
    touchImageView.alpha = 0.0;
    touchImageView.transform = CGAffineTransformMakeScale(1.13, 1.13);
    
    [self setTouchImageView:touchImageView forTouch:touch];
    
    [UIView animateWithDuration:0.1
                     animations:^{
                        touchImageView.alpha = 1.0f;
                        touchImageView.transform = CGAffineTransformMakeScale(1, 1);
                     }];
}

- (void)touchMoved:(UITouch *)touch
{
    UIImageView *touchImageView = [self touchImageViewForTouch:touch];
    touchImageView.center = [touch locationInView:self];
}

- (void)touchEnded:(UITouch *)touch
{
    UIImageView *touchImageView = [self touchImageViewForTouch:touch];
    
    [UIView animateWithDuration:0.1
                     animations:^ {
                         touchImageView.alpha = 0.0f;
                         touchImageView.transform = CGAffineTransformMakeScale(1.13, 1.13);
                     }
                     completion:^(BOOL finished) {
                         [touchImageView removeFromSuperview];
                         touchImageView.alpha = 1.0;
                         [self.touchImageViewQueue pushTouchImageView:touchImageView];
                         [self removeTouchImageViewForTouch:touch];
                     }];
}


- (UIImageView *)touchImageViewForTouch:(UITouch *)touch
{
    NSString *touchStringHash = [NSString stringWithFormat:@"%lu", (unsigned long)[touch hash]];
    
    return self.touchImgViewsDict[touchStringHash];
}

- (void)setTouchImageView:(UIImageView *)imgView forTouch:(UITouch *)touch
{
    NSString *touchStringHash = [NSString stringWithFormat:@"%lu", (unsigned long)[touch hash]];
    
    [self.touchImgViewsDict setObject:imgView forKey:touchStringHash];
}

- (void)removeTouchImageViewForTouch:(UITouch *)touch
{
    NSString *touchStringHash = [NSString stringWithFormat:@"%lu", (unsigned long)[touch hash]];
    
    [self.touchImgViewsDict removeObjectForKey:touchStringHash];
}


#pragma mark - Custom getters & setters

- (JVTouchImageViewQueue *)touchImageViewQueue
{
    if (!_touchImageViewQueue)
    {
        _touchImageViewQueue = [[JVTouchImageViewQueue alloc] initWithTouchesCount:8];
    }
    
    return _touchImageViewQueue;
}

- (NSMutableDictionary *)touchImgViewsDict
{
    if (!_touchImageViewsDic)
    {
        _touchImageViewsDic = [[NSMutableDictionary alloc] init];
    }
    
    return _touchImageViewsDic;
}

@end