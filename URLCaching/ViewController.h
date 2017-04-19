//
//  ViewController.h
//  URLCaching
//
//  Created by Anas MD on 4/19/17.
//  Copyright © 2017 Anas MD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)fetchButtonPressed:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *startTime;
@property (strong, nonatomic) IBOutlet UILabel *endTime;
@property (strong, nonatomic) IBOutlet UILabel *timeTaken;
@property (strong, nonatomic) IBOutlet UILabel *contentLength;

@end

