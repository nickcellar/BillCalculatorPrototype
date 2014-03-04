//
//  Bill.m
//  BillCalculatorPrototype
//
//  Created by Nicholas Wong on 2/26/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import "Bill.h"

@implementation Bill

- (id)init
{
    _checkAmount = 20;
    _tipRate = 0.15;
    _taxRate = 0.08875;
    _isTaxIncluded = YES;
    [self calculate];
    return self;
}

- (id)initWithCheckAmount:(float)checkAmount tipRate:(float)tipRate taxRate:(float)taxRate isTaxIncluded:(bool)isTaxIncluded
{
    _checkAmount = checkAmount;
    _tipRate = tipRate;
    _taxRate = taxRate;
    _isTaxIncluded = isTaxIncluded;
    [self calculate];
    return self;

}

- (void)calculate
{
    // calculate charge
    float chargeWithoutTax = _checkAmount;
    if (_isTaxIncluded) {
        chargeWithoutTax /= 1 + _taxRate;
    }

    // calculate tax
    if (_isTaxIncluded) {
        _totalTax = _checkAmount - chargeWithoutTax;
    }
    else {
        _totalTax = _checkAmount * _taxRate;
    }

    // calculate tip
    _totalTip = chargeWithoutTax * _tipRate;

    // calculate total charge
    _totalCharge = chargeWithoutTax + _totalTax + _totalTip;
}

@end
