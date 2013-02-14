//
//  ViewController.m
//  OpenCVTest
//
//  Created by Gaurub on 2/13/13.
//  Copyright (c) 2013 Gaurub. All rights reserved.
//

#import "ViewController.h"

// set this to whichever file you want to use.
NSString* const kFaceCascadeName = @"haarcascade_frontalface_alt";

#ifdef __cplusplus
CascadeClassifier face_cascade;
#endif


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:imageView];
    self.videoCamera.delegate = self;
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    [self.videoCamera start];
    
    NSString *faceCascadePath = [[NSBundle mainBundle] pathForResource:kFaceCascadeName
                                                                ofType:@"xml"];
    
#ifdef __cplusplus
    if(!face_cascade.load([faceCascadePath UTF8String])) {
        NSLog(@"Could not load face classifier!");
    }
#endif

	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Protocol CvVideoCameraDelegate
#ifdef __cplusplus
- (void) processImage:(Mat &)image
{
   
    vector<cv::Rect> faces;
    Mat frame_gray;
    
    cvtColor(image, frame_gray, CV_BGRA2GRAY);
    equalizeHist(frame_gray, frame_gray);
    
    face_cascade.detectMultiScale(frame_gray, faces, 1.1, 2, 0 | CV_HAAR_SCALE_IMAGE, cv::Size(100, 100));
    
    for(unsigned int i = 0; i < faces.size(); ++i) {
        rectangle(image, cv::Point(faces[i].x, faces[i].y),
                  cv::Point(faces[i].x + faces[i].width, faces[i].y + faces[i].height),
                  cv::Scalar(0,255,255));
    }

}
#endif

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
