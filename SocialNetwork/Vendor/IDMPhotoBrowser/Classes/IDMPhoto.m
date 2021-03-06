//
//  IDMPhoto.m
//  IDMPhotoBrowser
//
//  Created by Michael Waterfall on 17/10/2010.
//  Copyright 2010 d3i. All rights reserved.
//

#import "IDMPhoto.h"
#import "IDMPhotoBrowser.h"

 @interface IDMPhoto ()
 {
	NSString *_photoPath;
	UIImage *_underlyingImage;
}

@property (nonatomic, strong) UIImage *underlyingImage;

@end
 
@implementation IDMPhoto

@synthesize underlyingImage = _underlyingImage, photoURL = _photoURL;

 + (IDMPhoto *)photoWithImage:(UIImage *)image
 {
	return [[IDMPhoto alloc] initWithImage:image];
}

 + (NSArray *)photosWithImages:(NSArray *)imagesArray
 {
	NSMutableArray *photos = [NSMutableArray arrayWithCapacity:imagesArray.count];
	
	for (UIImage *image in imagesArray)
	{
		if ([image isKindOfClass:[UIImage class]])
		{
			IDMPhoto *photo = [IDMPhoto photoWithImage:image];
			[photos addObject:photo];
		}
	}
	
	return photos;
}

#pragma mark NSObject

 - (id)initWithImage:(UIImage *)image
 {
	if ((self = [super init]))
	{
		self.underlyingImage = image;
	}
	return self;
}

#pragma mark IDMPhoto Protocol Methods

 - (UIImage *)underlyingImage
 {
	return _underlyingImage;
}

 - (void)unloadUnderlyingImage
 {
	if (self.underlyingImage && (_photoPath || _photoURL))
	{
		self.underlyingImage = nil;
	}
}

@end
