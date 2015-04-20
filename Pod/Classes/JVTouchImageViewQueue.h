//
//  JVTouchImageViewQueue.h
//  Pods
//
//  Created by Jorge Valbuena on 2015-04-20.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface JVTouchImageViewQueue : NSObject

- (instancetype)initWithTouchesCount:(NSUInteger)count;

- (UIImageView *)popTouchImageView;
- (void)pushTouchImageView:(UIImageView *)touchImageView;

@end