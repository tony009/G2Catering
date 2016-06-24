
//
//  ScanView.m
//  G2Catering
//
//  Created by iOS  on 16/6/24.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "ScanView.h"
#import <AVFoundation/AVFoundation.h>
#import  "UIView+AdjustFrame.h"
@interface ScanView()<AVCaptureMetadataOutputObjectsDelegate>
@property (strong,nonatomic)AVCaptureDevice * device;

@property (strong,nonatomic)AVCaptureDeviceInput * input;

@property (strong,nonatomic)AVCaptureMetadataOutput * output;

@property (strong,nonatomic)AVCaptureSession * session;

@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@end
@implementation ScanView

-(void)awakeFromNib{
    
    [self initSubViews];
    
}


- (void)initSubViews{

    
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    
    //    _input = [AVCaptureDeviceInputdeviceInputWithDevice:self.deviceerror:nil];
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    
    _output = [[AVCaptureMetadataOutput alloc]init];
    
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    
    // Session
    
    _session = [[AVCaptureSession alloc]init];
    
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    
    if ([_session canAddInput:self.input])
        
    {
        
        [_session addInput:self.input];
        
    }
    
    if ([_session canAddOutput:self.output])
        
    {
        
        [_session addOutput:self.output];
        
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    
    // NSArray *arr =  self.output.availableMetadataObjectTypes;
    
    if ([self.output.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeQRCode]) {
        
        self.output.metadataObjectTypes = [NSArray arrayWithObject:AVMetadataObjectTypeQRCode];
        
    }
    
    
    
    //_output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:_session];
    
    _preview.videoGravity =AVLayerVideoGravityResizeAspectFill;
    
    _preview.frame =self.layer.bounds;
    
    _preview.transform =  CATransform3DMakeRotation(-M_PI_2,0,0,1);
    
    [self.layer insertSublayer:_preview atIndex:0];
     [self moveScanLineImageView];
     [_session startRunning];
}



-(void)moveScanLineImageView{
    
    [UIView animateWithDuration:2 animations:^{
        
        self.lineImgView.origin = CGPointMake(0,CGRectGetHeight( self.lineImgView.frame)-5);
        
    } completion:^(BOOL finished) {
        
        [self moveBackScanLineImageView];
    }];
}

-(void)moveBackScanLineImageView{
    
    [UIView animateWithDuration:2 animations:^{
        
        self.lineImgView.origin = CGPointMake(0, -10);
        
    } completion:^(BOOL finished) {
        
        [self moveScanLineImageView];
    }];
}

- (IBAction)cancelAction:(UIButton *)sender {
    
    [self removeFromSuperview];
    
}


- (IBAction)yesAction:(UIButton *)sender {
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0){
        
        //停止扫描
        
        [_session stopRunning];
        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        
        stringValue = metadataObject.stringValue;
        
        if (stringValue) {
            
             NSLog(@"stringValue:%@",stringValue);
            
            if ([self.delegate respondsToSelector:@selector(scanViewControllerdidFinishScan:result:)]) {
                [self.delegate scanViewControllerdidFinishScan:self result:stringValue];
            }
            [self removeFromSuperview];
            
        }
        
    }
    
    
}
@end
