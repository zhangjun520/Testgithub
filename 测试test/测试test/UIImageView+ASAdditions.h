//
//  UIImageView+ASAdditions.h
//  测试test
//
//  Created by admin on 2019/1/17.
//  Copyright © 2019 www.ujic. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ASAdditions)
/**
 * 链式编程设置frame
 */
- (UIImageView *(^)(CGRect frame))as_frame;
/**
 * 链式编程设置image
 */
- (UIImageView *(^)(NSString * imageStr))as_image;
/**
 * 链式编程设置点击事件
 */
- (UIImageView *(^)(id object,SEL action))as_action;




@end

NS_ASSUME_NONNULL_END


