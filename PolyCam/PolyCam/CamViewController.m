//
//  CamViewController.m
//  PolyCam
//
//  Created by Jerry Chen on 2/2/17.
//  Copyright © 2017 bl. All rights reserved.
//

#import "CamViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CamViewController ()

@end

@implementation CamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *snapBtnImage = [UIImage imageNamed:@"snapBtn.png"];
    [self.snapBtn setImage:snapBtnImage forState:UIControlStateNormal];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.previewLayer.frame = self.cameraView.bounds; 
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Adjust on-screen assets
    self.logoWithText.image = [self.logoWithText.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.logoWithText.tintColor = [UIColor whiteColor];
    
    self.captureSession = [[AVCaptureSession alloc]init];
    self.captureSession.sessionPreset = AVCaptureSessionPreset1920x1080;
    
    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = [[NSError alloc]init];
    
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:backCamera error:nil];
    
    if ([self.captureSession canAddInput:deviceInput]) {
        [self.captureSession addInput:deviceInput];
        
         self.imageOutput = [[AVCaptureStillImageOutput alloc]init];
        self.imageOutput.outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
        
        if ([self.captureSession canAddOutput:self.imageOutput]) {
            [self.captureSession addOutput:self.imageOutput];
            
            self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.captureSession];
            [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
            [self.previewLayer.connection setVideoOrientation:AVCaptureVideoOrientationPortrait];
            
            [self.cameraView.layer addSublayer:self.previewLayer];
            
            [self.captureSession startRunning];
        }
    }
    

    
    
}

@end
