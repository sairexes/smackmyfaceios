//
//  gameViewController.h
//  smackmyface
//
//  Created by Administrator on 10/2/13.
//  Copyright (c) 2013 SCC Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface gameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
- (IBAction)backButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *seconds;
@property (strong, nonatomic) IBOutlet UIImageView *imgView1;
@property (strong, nonatomic) IBOutlet UIImageView *imgView2;
@property (strong, nonatomic) IBOutlet UIImageView *imgView3;
- (IBAction)smack1:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *smack2;
@property (strong, nonatomic) IBOutlet UILabel *timeh;
- (IBAction)smack22:(id)sender;
- (IBAction)smack3:(UIButton *)sender;

- (IBAction)start:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@end
