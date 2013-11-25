//
//  scoreViewController.m
//  smackmyface
//
//  Created by Administrator on 10/2/13.
//  Copyright (c) 2013 SCC Team. All rights reserved.
//

#import "scoreViewController.h"

@interface scoreViewController ()

@end

@implementation scoreViewController

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
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcredit.png"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end