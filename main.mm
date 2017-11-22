#import "common.h"
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <objc/runtime.h>

@interface LocationDelegate : NSObject <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation LocationDelegate;
+(LocationDelegate*)shareLocationDelegate
{
    static dispatch_once_t pred;
    static LocationDelegate *locationDelegate;
    dispatch_once(&pred, ^{
        locationDelegate = [[LocationDelegate alloc]init];
    });
    
    return locationDelegate;
}
-(void)startLocation
{
	
	if (!self.locationManager)
	{
		self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	}
	
	[self.locationManager startUpdatingLocation];
	CLLocation* newLocation = [self.locationManager  location];
	CLLocationCoordinate2D newCoordinate = [newLocation coordinate];
	NSString *latitudeStr = [NSString stringWithFormat:@"%f",newCoordinate.latitude];
	NSString *longitudeStr = [NSString stringWithFormat:@"%f",newCoordinate.longitude];
	printDeviceGPS(latitudeStr,longitudeStr);

}

@end


int main(int argc, char **argv, char **envp) {
	NSArray *arguments = [[NSProcessInfo processInfo] arguments];
	if(arguments.count<=1)
	{
		LocationDelegate *delegate = [[LocationDelegate alloc] init];
		[delegate startLocation];
		return 0;
	}
	
	return 0;
}

// vim:ft=objc
