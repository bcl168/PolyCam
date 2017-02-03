//
//  StatViewController.m
//  PolyCam
//
//  Created by Jerry Chen on 2/2/17.
//  Copyright © 2017 bl. All rights reserved.
//

#import "StatViewController.h"
#import "Mediator.h"

// Define RGB colors
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface StatViewController ()

@end

@implementation StatViewController
{
    Mediator *_mediator;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mediator = [Mediator sharedInstance];
    
    self.questionsTableView.dataSource = _mediator;
    self.questionsTableView.delegate = _mediator;
    
    // Define an empty UITableView's tableFooterView to hide UITableView Empty Cell
    // Separator Lines
    self.questionsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    
    // Adjust UI assets
    self.statsIconImageView.image = [self.statsIconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.statsIconImageView.tintColor = UIColorFromRGB(0x232323);
    
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    self.isScrolling = NO;
    
    self.overallAngerPercentage.text = [NSString stringWithFormat:@"%2.2f%%", _mediator.averageOverallAnger*100];
    self.overallContemptPercentage.text = [NSString stringWithFormat:@"%2.2f%%", _mediator.averageOverallContempt*100];
    self.overallFearPercentage.text = [NSString stringWithFormat:@"%2.2f%%", _mediator.averageOverallFear*100];
    self.overallSurprisePercentage.text = [NSString stringWithFormat:@"%2.2f%%", _mediator.averageOverallSurprise*100];
    
    self.overallTruthPercentage.text = [NSString stringWithFormat:@"%.0f", _mediator.truthfulness];
    
    //NSLog(@"ANG: %f", _mediator.averageOverallAnger*100);
    NSLog(@"ANG: %2.2f%%", _mediator.averageOverallAnger*100);
    NSLog(@"Con: %2.2f%%", _mediator.averageOverallContempt*100);
    NSLog(@"FEAR: %2.2f%%", _mediator.averageOverallFear*100);
    NSLog(@"Sur: %2.2f%%", _mediator.averageOverallSurprise*100);
    
    NSLog(@"Truth: %f", _mediator.truthfulness);
    
    
    self.overallAngerBarConstraint.constant =  _mediator.averageOverallAnger*100;
    self.overallContemptBarConstraint.constant = _mediator.averageOverallContempt*100;
    self.overallFearBarConstraint.constant = _mediator.averageOverallFear*100;
    self.overallSurpriseBarConstraint.constant = _mediator.averageOverallSurprise*100;
    
    
    [self.questionsTableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
