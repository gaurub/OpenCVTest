//
//  ViewController.h
//  OpenCVTest
//
//  Created by Gaurub on 2/13/13.
//  Copyright (c) 2013 Gaurub. All rights reserved.
//

#import <opencv2/highgui/cap_ios.h>
#import <UIKit/UIKit.h>
using namespace cv;

@interface ViewController : UIViewController<CvVideoCameraDelegate> {

    IBOutlet UIImageView* imageView;
    CvVideoCamera *_videoCamera;
    
}

@property (nonatomic, retain) CvVideoCamera *videoCamera;

@end
