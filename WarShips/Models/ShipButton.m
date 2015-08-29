//
//  ShipButton.m
//  WarShips
//
//  Created by François Juteau on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "ShipButton.h"

@implementation ShipButton
@synthesize thereAShip;

- (instancetype)init
{
    self = [super init];
    
    if (self != nil)
    {
        thereAShip = NO;
    }
    
    return self;
}

@end
