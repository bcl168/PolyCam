//
//  Mediator.h
//  PolyCam
//
//  Created by bl on 2/2/17.
//  Copyright © 2017 bl. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BackEnd.h"


@protocol MediatorDelegate <NSObject>

- (void) didProcessPhoto:(Question *)question;

@end

@interface Mediator : NSObject<BackEndDelegate>

@property (nonatomic, strong) id<MediatorDelegate> delegate;

+ (Mediator *)sharedInstance;

- (void) processPhoto:(UIImage *)photo;

@end
