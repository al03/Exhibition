//
//  CXColor.h
//  
//
//  Created by mao kaiyin on 12-4-4.
//  Copyright (c) 2012年 infinity impression. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorWithHex) 

+(UIColor*)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha;
+(UIColor*)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha;

@end
