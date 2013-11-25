//
//  gameViewController.m
//  smackmyface
//
//  Created by Administrator on 10/2/13.
//  Copyright (c) 2013 SCC Team. All rights reserved.
//

#import "gameViewController.h"

@interface gameViewController ()

@end


@implementation gameViewController

int count= 30;
NSTimer *timer;
NSString *imgStr, *imgStr2, *imgStr3;
int score = 0;
SystemSoundID soundID, soundID2;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //SOUND1
    [self initSounds];
    [_button1 setHidden:true];
    [_button2 setHidden:true];
    [_button3 setHidden:true];
}

-(void)start1{

    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testFunction) userInfo:nil repeats:YES];
}


-(void)testFunction{
    if(count==0){
        [timer invalidate];
        [self alertFunction];
    }else{
        count--;
        _timeh.text = [NSString stringWithFormat:@"%d",count];
        if(count%2 == 0){
            [self randomImg];
        }
    }
}

-(void)randomImg{
    imgStr = [NSString stringWithFormat:@"%d.jpg", arc4random_uniform(4) + 1];
    imgStr2 = [NSString stringWithFormat:@"%d.jpg", arc4random_uniform(4) + 1];
    imgStr3 = [NSString stringWithFormat:@"%d.jpg", arc4random_uniform(4) + 1];

    _imgView1.image = [UIImage imageNamed:imgStr];
    _imgView2.image = [UIImage imageNamed:imgStr2];
    _imgView3.image = [UIImage imageNamed:imgStr3];
    NSLog(@"tada!! %@ | %@ | %@ ", imgStr, imgStr2, imgStr3);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(UIButton *)sender {
    [timer invalidate];
    count = 30;
    score = 0;
    count = 30;
    score = 0;
    _scoreLabel.text = @"0";
    _timeh.text = @"30";
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)initSounds{
    //SOUND1
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"smack" ofType:@"wav"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
    
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl, &soundID);
    //SOUND2
    NSString *soundPath2 = [[NSBundle mainBundle] pathForResource:@"ouch" ofType:@"wav"];
    NSURL *soundUrl2 = [NSURL fileURLWithPath:soundPath2];
    
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)soundUrl2, &soundID2);
}

- (IBAction)smack1:(UIButton *)sender {
        AudioServicesPlaySystemSound(soundID);
    
        NSString *check = [NSString stringWithFormat:@"1.jpg"];
    
        if([imgStr isEqualToString:check] && count!=0){
            score = score + 5;
            NSLog(@"SCOREEEEE!!");
            AudioServicesPlaySystemSound(soundID2);
            _imgView1.image = [UIImage imageNamed:@"0.jpg"];
        }else{
            if(score != 0)
                score = score - 5;
        }
_scoreLabel.text = [NSString stringWithFormat:@"%d",score];

}

- (IBAction)smack22:(id)sender {

         AudioServicesPlaySystemSound(soundID);
        NSString *check = [NSString stringWithFormat:@"1.jpg"];
        
        if([imgStr2 isEqualToString:check] && count!=0){
            score = score + 5;
            NSLog(@"SCOREEEEE!!");
            AudioServicesPlaySystemSound(soundID2);
            _imgView2.image = [UIImage imageNamed:@"0.jpg"];
        }else{
            if(score != 0)
                score = score - 5;
        }
    _scoreLabel.text = [NSString stringWithFormat:@"%d",score];

}

- (IBAction)smack3:(UIButton *)sender {
        AudioServicesPlaySystemSound(soundID);
        NSString *check = [NSString stringWithFormat:@"1.jpg"];
        
        if([imgStr3 isEqualToString:check] && count!=0){
            score = score + 5;
            NSLog(@"SCOREEEEE!!");
            AudioServicesPlaySystemSound(soundID2);
            _imgView3.image = [UIImage imageNamed:@"0.jpg"];
        }else{
            if(score != 0)
                score = score - 5;
        }
    _scoreLabel.text = [NSString stringWithFormat:@"%d",score];

}

-(void)alertFunction{
    NSString *str = [NSString stringWithFormat:@"Nice! You smack the face %d times!\n Score: %d",score/5,score];
    UIAlertView *alertDialog;
    alertDialog= [[UIAlertView alloc]
                  initWithTitle:@"Game Over"
                  message: str
                  delegate:self
                  cancelButtonTitle:@"Restart"
                  otherButtonTitles:@"OK",nil];
    
    alertDialog.alertViewStyle=UIAlertViewStyleDefault; [alertDialog show];
    [_button1 setHidden:true];
    [_button2 setHidden:true];
    [_button3 setHidden:true];
    _startButton.enabled=true;
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{  
    //ALERTVIEW
    NSString * buttonTitle = [alertView  buttonTitleAtIndex: buttonIndex];
    
    if ([buttonTitle isEqualToString:@"OK"]) {
        [timer invalidate];
        [self backButton: nil];
    }else if([buttonTitle isEqualToString:@"Restart"]){
        count = 30;
        score = 0;
        _scoreLabel.text = @"0";
        _timeh.text = @"30";
        [self start:nil];

    }
    
}
- (IBAction)start:(UIButton *)sender {
    [self start1];
    if(count<31 && count>0){
        _startButton.enabled = false;
        [_button1 setHidden:false];
        [_button2 setHidden:false];
        [_button3 setHidden:false];
        
    }else{
        _startButton.enabled = true;
    }
}

@end
