//
//  ViewController.m
//  ALittle
//
//  Created by Ward Penney on 6/18/14.
//  Copyright (c) 2014 wardpenney. All rights reserved.
//

#import "ViewController.h"
#import "StarGuyView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet StarGuyView *starGuyView;
@end

@implementation ViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //    [[CADisplayLink displayLinkWithTarget:self selector:@selector(updateFrame:)] addToRunLoop:[NSRunLoop mainRunLoop]
    //                                                                                     forMode:NSRunLoopCommonModes];
}

- (void)updateFrame:(CADisplayLink *)sender {
    //    self.starGuyView.topX = fmodf([sender timestamp] * 10, 160);
    //    NSLog(@"%.2f", self.starGuyView.topX);
}

@end
