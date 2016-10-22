//
//  ViewController.h
//  getScreenTest
//
//  Created by 123 on 15/12/30.
//  Copyright (c) 2015年 lb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController{
    NSTimer *timer;
    UIButton *button;
}

@property (weak, nonatomic) IBOutlet UILabel *tLabel;
- (IBAction)tButton:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *innerLabel;
@property (weak, nonatomic) IBOutlet UITextField *label;
@property (nonatomic,retain)  UIButton *btn;
@property (nonatomic,retain)  UIImageView  *image;
@property (nonatomic,retain)  UIImageView  *image114;
@property (nonatomic,retain)  UIButton     *button;
@property (nonatomic,retain) NSTimer *timer;
//@property (nonatomic,retain) IBAction UIButton *b;
@end

