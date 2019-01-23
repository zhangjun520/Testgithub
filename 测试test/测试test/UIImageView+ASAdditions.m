//
//  UIImageView+ASAdditions.m
//  测试test
//
//  Created by admin on 2019/1/17.
//  Copyright © 2019 www.ujic. All rights reserved.
//

#import "UIImageView+ASAdditions.h"

@implementation UIImageView (ASAdditions)
- (UIImageView *(^)(CGRect frame))as_frame{
    return ^(CGRect frame) {
        [self setFrame:frame];
        return self;
    };
    
}
- (UIImageView *(^)(NSString * image)) as_image {
    return ^(NSString *image) {
        [self setImage:[UIImage imageNamed:image]];
        return self;
    };
    
}
- (UIImageView *(^)(id object,SEL action)) as_action {
    return ^(id object, SEL action) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:object action:action];
        [self addGestureRecognizer:tap];
        return self;
    };
    
}

@end
