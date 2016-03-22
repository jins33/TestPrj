//
//  BaiduMapViewController.m
//  TestPrj
//
//  Created by hjs on 16/1/8.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "BaiduMapViewController.h"

@interface BaiduMapViewController ()

@end

@implementation BaiduMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.zoomLevel = 7;//地图显示比例
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -传入定位坐标
//设置定位到得用户的位置，这里是简单的应用方法（必须打开程序时已经获取到地理位置坐标，为了解决地图定位时总是先显示天安门）
-(void)passLocationValue
{
    _mapView.showsUserLocation = YES;
    if (_locService.userLocation.location != nil)
    {
        NSLog(@"定位成功");
    }
    BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:_mapView.region];
    [_mapView setRegion:adjustedRegion animated:YES];
}

#pragma mark mapViewDelegate 代理方法
- (void)mapView:(BMKMapView *)mapView1 didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    BMKCoordinateRegion region;
    region.center.latitude  = userLocation.location.coordinate.latitude;
    region.center.longitude = userLocation.location.coordinate.longitude;
    region.span.latitudeDelta  = 0.2;
    region.span.longitudeDelta = 0.2;
    if (_mapView)
    {
        _mapView.region = region;
        NSLog(@"当前的坐标是: %f,%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    }
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
