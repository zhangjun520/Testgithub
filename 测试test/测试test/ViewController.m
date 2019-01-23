//
//  ViewController.m
//  测试test
//
//  Created by zj on 2016/11/12.
//  Copyright © 2016年 www.ujic. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIImageView+ASAdditions.h"
#import "SDAutoLayout.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "ViewController1.h"
@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *testLb;
@property (nonatomic, strong) UIView *testView;
@end

@implementation ViewController
- (UIView *)testView{
    if (!_testView) {
       self.testView = [[UIView alloc] init];
        _testView.backgroundColor = [UIColor redColor];
    }
    return _testView;
}
- (UILabel *)testLb{
    if (!_testLb) {
        self.testLb = [[UILabel alloc] init];
    }
    return _testLb;
}
- (void)deletefiles:(NSString *)path{
    //   1.判断文件还是目录
    NSFileManager *fileManger = [NSFileManager defaultManager];
     BOOL isDir = NO;
    BOOL isExist = [fileManger fileExistsAtPath:path isDirectory:&isDir];
    
    if(isExist){
        // 2.判断是不是目录
        if(isDir) {
           NSLog(@"你打印的是目录存在");
        }else{
            NSLog(@"你打印的是目录或者不存在");
        }
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
//    self.title = @"首页";

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.testView];
    
    self.hhhh.constant = 44 * 0.8;
    self.topHeight.constant = 100;
    [self.view addSubview:self.testLb];
    [self deletefiles:@"张俊/说话撒/750*1334.png"];
//    [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(10);
//        make.right.equalTo(self.view).with.offset(-10);
//        make.top.equalTo(self.view).with.offset(10);
//        make.bottom.equalTo(self.view).with.offset(-10);
//    }];

    
    
//    [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
    
    
//    [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//    }];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        [self.testView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(100, 100));
//        }];
//    });
    
    
//    [self.testLb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.width.lessThanOrEqualTo(@200);
//        make.height.greaterThanOrEqualTo(@(10));
//
//    }];
//
//    self.testLb.text = @"这是测试的字符串。能看到1、2、3个步骤，第一步当然是上传照片了，要上传正面近照哦。上传后，网站会自动识别你的面部，如果觉得识别的不准，你还可以手动修改一下。左边可以看到16项修改参数，最上面是整体修改，你也可以根据自己的意愿单独修改某项，将鼠标放到选项上面，右边的预览图会显示相应的位置";
//    self.testLb.numberOfLines = 0;
    


    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.as_frame(CGRectMake(100, 100, 100, 100))
             .as_image(@"timg.jpg")
             .as_action(self,@selector(clickaction));
    [self.view addSubview:imageView];
    

//    self.testView.sd_layout.widthIs(60).heightIs(60).topSpaceToView(self.view, 100).leftSpaceToView(self.view, 100);
//
//        [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(60, 60));
//            make.top.equalTo(self.view).offset(100);
//            make.left.equalTo(self.view).offset(100);
//        }];

    Class class = NSClassFromString(@"ViewController");
    UIViewController *vc = [[class alloc] init];
    NSLog(@"%@",vc);

    Class class1 = [UIViewController class];
    NSString *str = NSStringFromClass(class1);
    NSLog(@"%@",str);
    
    
    UIView *green = [[UIView alloc] initWithFrame:CGRectMake(0, 500, 100, 100)];
    green.backgroundColor = [UIColor greenColor];
    [self.view addSubview:green];
    
    [NSTimer timerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
       
        NSLog(@"哈哈");
    }];
    CIImage *beginImage = [[CIImage alloc]initWithImage:[UIImage imageNamed:@"timg.jpg"]];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
    
    [filter setValue:beginImage forKey:kCIInputImageKey];
    
    [filter setValue:[NSNumber numberWithFloat:.5] forKey:@"inputBrightness"];//亮度-1~1
    
    CIImage *outputImage = [filter outputImage];
    
    //GPU优化
    
    EAGLContext * eaglContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    
    eaglContext.multiThreaded = YES;
    
    CIContext *context = [CIContext contextWithEAGLContext:eaglContext];
    
    [EAGLContext setCurrentContext:eaglContext];
    CGImageRef ref = [context createCGImage:outputImage fromRect:outputImage.extent];
    
    UIImage *endImg = [UIImage imageWithCGImage:ref];
    
    imageView.image = endImg;
    
//    CGImageRelease(ref);//非OC对象需要手动内存释放
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"点击键盘");
    
    return YES;
}
- (IBAction)clicktf:(id)sender {
    
    NSLog(@"点击键盘");
}
- (void)clickaction{
    
    NSLog(@"点击了图片");
    
    ViewController1 *vc = [[ViewController1 alloc] init];
    
//    [self presentViewController:vc animated:YES completion:nil];
    
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
