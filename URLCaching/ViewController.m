//
//  ViewController.m
//  URLCaching
//
//  Created by Anas MD on 4/19/17.
//  Copyright © 2017 Anas MD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)fetchButtonPressed:(UIButton *)sender {
    self.startTime.text = @"0";
    self.endTime.text = @"0";
    self.timeTaken.text = @"X";
    self.contentLength.text = @"0";
    // Just some chunk data to add content length to file
    NSString *urlStr = @"https://github.com/ansal10/URLCaching/blob/master/URLCaching/ViewController.m";
    NSURL *url = [NSURL URLWithString:urlStr];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url ];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:0];

    NSURLSession *session = [NSURLSession sharedSession];
    NSTimeInterval startMillis = ([[NSDate date] timeIntervalSince1970] * 1000);
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          NSTimeInterval endMillis = ([[NSDate date] timeIntervalSince1970] * 1000);
                                          self.startTime.text = [NSString stringWithFormat:@"%lf", startMillis ];
                                          self.endTime.text = [NSString stringWithFormat:@"%lf", endMillis ];
                                          double d = (double)endMillis - (double)startMillis;
                                          NSString *s = [NSString stringWithFormat:@"%lf",d ];
                                          self.timeTaken.text = s;
                                          self.contentLength.text = [NSString stringWithFormat:@"%ld",[data length]];
                                      });
                                      
                                      
                                  }];
    
    [task resume];
}
@end
