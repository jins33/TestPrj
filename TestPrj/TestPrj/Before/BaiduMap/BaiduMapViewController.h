//
//  BaiduMapViewController.h
//  TestPrj
//
//  Created by hjs on 16/1/8.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface BaiduMapViewController : UIViewController<BMKMapViewDelegate,BMKLocationServiceDelegate>{
    BMKLocationService* _locService;
}

@property (weak, nonatomic) IBOutlet BMKMapView *mapView;

@end
