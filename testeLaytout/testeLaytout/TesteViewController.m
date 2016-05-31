//
//  TesteViewController.m
//  testeLaytout
//
//  Created by Luciano Rogerio Mayer on 17/09/15.
//  Copyright (c) 2015 Luciano Rogerio Mayer. All rights reserved.
//

#import "TesteViewController.h"

@interface TesteViewController ()

@end

@implementation TesteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self adjustViewsForOrientation:[UIDevice currentDevice].orientation animation:NO];
}

-(void)viewDidAppear:(BOOL)animated{
    [self adjustViewsForOrientation:[UIDevice currentDevice].orientation animation:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [self adjustViewsForOrientation:toInterfaceOrientation animation:YES];
}

- (void) adjustViewsForOrientation:(UIInterfaceOrientation)orientation animation:(BOOL)animation{
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        
        [self animaRotationWithXib:@"TesteViewController" animation:animation];
        
    }
    else if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        [self animaRotationWithXib:@"Teste" animation:animation];
    }
}

-(void)animaRotationWithXib:(NSString*)xib animation:(BOOL)animation{
    TesteViewController* v = [TesteViewController new];
    
    UIView* view = [[[NSBundle mainBundle] loadNibNamed:xib owner:v options:nil] objectAtIndex:0];
    
    if(animation){
    [UIView animateWithDuration:0.5 animations:^{
        [self setaFrame:v];
    }];
    }
    else{
        [self setaFrame:v];
    }
}

-(void)setaFrame:(TesteViewController*)v{
    _viewVerde.frame = v.viewVerde.frame;
    _vuewVermelha.frame = v.vuewVermelha.frame;
    
    _label.frame = v.label.frame;
    _txt.frame = v.txt.frame;
    _btn.frame = v.btn.frame;
}

@end
