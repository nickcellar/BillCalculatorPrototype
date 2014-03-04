//
//  Bill.h
//  BillCalculatorPrototype
//
//  Created by Nicholas Wong on 2/26/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bill : NSObject

@property float checkAmount;
@property float taxRate;
@property float tipRate;
@property bool isTaxIncluded;
@property(readonly) float totalCharge;
@property(readonly) float totalTip;
@property(readonly) float totalTax;

- (id)initWithCheckAmount:(float)checkAmount tipRate:(float)tipRate taxRate:(float)taxRate isTaxIncluded:(bool)isTaxIncluded;

- (void)calculate;

@end
