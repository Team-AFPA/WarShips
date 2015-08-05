//
//  ShipButton.m
//  WarShips
//
//  Created by François Juteau on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "ShipButton.h"

@implementation ShipButton

- (instancetype)init
{
    self = [super init];
    
    if (self != nil)
    {
        isThereAShip = NO;
    }
    
    return self;
}


-(BOOL) isThereAShip
{
    return isThereAShip;
}


-(void) setIsThereAShip:(BOOL)_bool
{
    isThereAShip= _bool;
}

@end
