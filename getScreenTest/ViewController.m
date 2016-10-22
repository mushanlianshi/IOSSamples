//
//  ViewController.m
//  getScreenTest
//
//  Created by 123 on 15/12/30.
//  Copyright (c) 2015年 lb. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    NSLog(@"viewDidLoad=========");
    CGRect rect=[[UIScreen mainScreen] bounds];
    NSLog(@"RECT====%f",rect.size.width);
    NSLog(@"RECT====%f",rect.size.height);
//    NSLog(@"RECT====%f",rect.origin.x);
//    NSLog(@"RECT====%f",self.view.frame.origin.x);
//    NSLog(@"RECT====%f",self.view.frame.origin.y);
    NSLog(@"RECT====%f",self.view.frame.size.height);
    NSLog(@"RECT====%f",self.view.frame.size.width);
    //NSLog(@"RECT====%@",self.view.frame.size);
    
    CGRect appRect=[[UIScreen mainScreen] applicationFrame];
    NSLog(@"appRect====%@",appRect);
    NSLog(@"appRect====%l",appRect.size.height);
    NSLog(@"appRect====%l",appRect.size.width);
    //设置背景颜色
    self.view.backgroundColor=[UIColor redColor];
    self.label.backgroundColor=[UIColor blueColor];
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [UIView beginAnimations:nil context:context];
//    [UIView setAnimationDuration:1.5f];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView commitAnimations];
    //NSLog(@"appRect====%@",self.view.frame.size);
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置输入框的键盘是数字类型的
    self.label.keyboardType=UIKeyboardTypeNumberPad;
    //当object为nil时  接收到发送消息名字为UIKeyboardWillShowNotification的 就响应selector方法   不为空时则需要接收到改对象发送的名为。。啥的消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyboardWillShowNotification:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    //设置监听隐藏键盘的消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyboardWillHideNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    self.btn=[[UIButton alloc] init];
    CGRect btnRect=CGRectMake(0,300,100,100);
    NSLog(@"btnRect %f",btnRect);
    NSLog(@"btnRect %f",btnRect.size.height);
    NSLog(@"btnRect %f",btnRect.size.width);
    NSLog(@"btnRect %f",btnRect.origin.x);
    //self.btn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame=btnRect;
    //self.btn=[[UIButton alloc] initWithFrame:btnRect];
    //[_btn setBounds:btnRect];
    //[self.btn initWithFrame:btnRect];
    self.btn.backgroundColor=[UIColor blueColor];
    [self.btn setTitle:@"kaishi" forState:UIControlStateNormal];
    //[self.btn setHidden:true];
    [self.view addSubview:self.btn];
    
    //第一种是使用缓存的加载图片  经常使用的背景图像按钮的背景图这样用可以提高效率  不经常使用的浪费资源
    self.image=[[UIImageView alloc] init];
    [self.image setBackgroundColor:[UIColor blackColor]];
    self.image.frame=CGRectMake(0, 0, 120, 120);
    //imageName的会添加缓存  对于经常使用的可以   不然会占用资源
    //UIImage *ima=[UIImage imageNamed:@"xxx.png"] ;
    [self.image setImage:[UIImage imageNamed:@"120.png"]];
    [self.view addSubview:self.image];
    
    //第二种是通过图片的路径来加载图片的
    self.image114=[[UIImageView alloc] init];
    [self.image114 setBackgroundColor:[UIColor blackColor]];
    self.image114.frame=CGRectMake(0, 120, 114, 114);
    NSString *imageP=[[NSBundle mainBundle] pathForResource:@"114" ofType:@"png"];
    UIImage *uImage=[[UIImage alloc] initWithContentsOfFile:imageP];
    [self.image114 setImage:uImage];
    [self.view addSubview:self.image114];
    
    //获得父视图
    UIView *view=[self.image superview];
    NSLog(@"the super view is %@",view);
    //获得UIWindow对象   应用只有一个UIWindow对象
    UIWindow *window=[self.image window];
    NSLog(@"the ui window is %f",window.frame.size.width);
    //获得子视图  返回一个数组
    NSArray *array=[self.view subviews];
    NSLog(@"the subviews array %@",array);
    
    self.button=[[UIButton alloc] initWithFrame:CGRectMake(200, 200, 200, 200)];
    [self.button setBackgroundColor:[UIColor blueColor]];
    [self.button setTitle:@"IM Button" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(createButtonOnSelected) forControlEvents:UIControlEventTouchDown];
    
    //给按钮添加按下事件
    [self.btn addTarget:self action:@selector(btnDown) forControlEvents:UIControlEventTouchDown];
   //创建一个定时器 0代表实时监测 可以设置时间定时器时间单位是秒
     self.timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    //定时器停止
    //[timer invalidate];
//    screen=btnRect;
   // self.view=self.label;
#if 0
    NSLog(@"SCREEN %f",screen.size.width);
    NSLog(@"SCREEN %f",screen.size.height);
    NSLog(@"SCREEN %f",screen.origin.x);
#endif
    
    
    NSLog(@"create a dictionary about application ");
    //得到一个应用信息相关的字典
    NSDictionary *dic=[[NSBundle mainBundle] infoDictionary];
    NSLog(@"DIC IS %@",dic);
    //获取应用信息的对外版本号  对内是CFBundleVersion
    NSString *version=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"the application version is %@",version);
    
    
    
    
    
    NSString *pathDir = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents" ]stringByAppendingPathComponent:@"File"];
   // NSLog(@"pathDir %@",pathDir);
    
    
    
    
    
    
    //获取加路径
    NSString *homeDir = NSHomeDirectory();
   // NSLog(@"homeDir %@",homeDir);
    //获取document路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    //拼接路径
    NSString *filePath=[docDir stringByAppendingPathComponent:@"liubin.txt"];
//    NSString *filePath=[[NSString alloc] initWithFormat:@"%@/%@",docDir,@"liubin.txt"];
    //NSLog(@"test shoudong pintjie %@",filePath);
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filePath]){
        NSLog(@"file is exist read it ");
        NSString *content=[[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"file content %@",content);
    }else{
        NSLog(@"file not exist create it ");
        BOOL result=[fileManager createFileAtPath:filePath contents:nil attributes:nil];
        [@"liubiu write file" writeToFile:filePath atomically:YES];
        NSString *content=[[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"file content %@",content);
    }
    //NSLog(@"docDir %@",docDir);
    //获取cache路径
    NSArray *paths2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths2 objectAtIndex:0];
    //NSLog(@"cachesDir %@",cachesDir);
    //获取temp路径
    NSString *tmpDir = NSTemporaryDirectory();
    //NSLog(@"tmpDir %@",tmpDir);
    
    NSString *imagePath=[[NSBundle mainBundle] pathForResource:@"test" ofType:@"png"];
    //NSLog(@"imagePath is %@",imagePath);
    
    
    
    
    
    NSLog(@"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
    //plist 文件读写
    //1. 创建一个plist文件
    NSArray *filepaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[filepaths    objectAtIndex:0];
    NSLog(@"path = %@",path);
    NSString *filename=[path stringByAppendingPathComponent:@"test.txt"];
    NSFileManager *fmanager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filename]){
        NSLog(@"file is exist");
    }
    NSFileManager* fm = [NSFileManager defaultManager];
    [fm createFileAtPath:filename contents:nil attributes:nil];
    //NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    //创建一个dic，写到plist文件里
    NSDictionary* ndic = [NSDictionary dictionaryWithObjectsAndKeys:@"sina",@"1",@"163",@"2",nil];
    [ndic writeToFile:filename atomically:YES];
    
    //读文件
    NSDictionary* dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];
    NSLog(@"dic is:%@",dic2);
    
    
    
    
    
    
    
    
    // 创建一个本地推送
    
    UILocalNotification *notification = [[UILocalNotification alloc] init] ;
    //设置10秒之后
    NSDate *pushDate = [NSDate dateWithTimeIntervalSinceNow:3];
    if (notification != nil) {
        // 设置推送时间
        notification.fireDate = pushDate;
        // 设置时区
        notification.timeZone = [NSTimeZone defaultTimeZone];
        // 设置重复间隔
        notification.repeatInterval = kCFCalendarUnitDay;
        // 推送声音
        notification.soundName = UILocalNotificationDefaultSoundName;
        // 推送内容
        notification.alertBody = @"注册送礼品了";
        //显示在icon上的红色圈中的数子
        notification.applicationIconBadgeNumber = 1;
        //设置userinfo 方便在之后需要撤销的时候使用
        NSDictionary *info = [NSDictionary dictionaryWithObject:@"send local notification value"forKey:@"key"];
        notification.userInfo = info;
        //添加推送到UIApplication
        UIApplication *app = [UIApplication sharedApplication];
        [app scheduleLocalNotification:notification];
    }
    
    //delegate要设置成自己  才能处理点击事件
    UIAlertView *dialog=[[UIAlertView alloc] initWithTitle:@"注意" message:@"你确定要退出吗？" delegate:self cancelButtonTitle:@"取消"  otherButtonTitles:@"确定", nil];
    [dialog show];
    
    
    long result=(long)@"ddddd";
    NSLog(@"result   ===== %l ",result);
}


//根据被点击按钮的索引处理点击事件  索引为0是取消按钮   1是确定按钮 如果只有一个按钮 索引就是0
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"clickButtonAtIndex:%d",buttonIndex);
}

//
////AlertView的取消按钮的事件   目前没有执行
//-(void)alertViewCancel:(UIAlertView *)alertView
//{
//    NSLog(@"alertViewCancel");
//}

-(void) onTimer{
    NSLog(@"onTimer");
    [self.timer invalidate];
    
}
-(void) btnDown:(UIButton *)sender{
    [sender setTitle:@"buttonDown" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    NSLog(@"didReceiveMemoryWarning=========");
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



CGRect screen;
int height_bar = 20;
int origin_y = 1000;
UIView *view_temp = Nil;// to set the status bar's background color is black;
//接收到显示键盘的notification时调用的事件
- (void)handleKeyboardWillShowNotification:(NSNotification *)notification {
     NSLog(@"handleKeyboardWillShowNotification");
    self.label.keyboardType=UIKeyboardTypeNumberPad;
}

- (void)handleKeyboardWillHideNotification:(NSNotification *)notification {
    NSLog(@"handleKeyboardWillHideNotification");
}

-(void) createButtonOnSelected{
    NSLog(@"BUTTON DOWN");
}


@end
