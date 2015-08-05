//
//  Ship.m
//  WarShips
//
//  Created by François Juteau on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "Ship.h"

@implementation Ship


-(id) initWithType:(NSInteger)_type
{
    self = [super init];
    lengthTab= @[@"2", @"3", @"4", @"5"];
return self;
}

-(void) affectship: (NSInteger) type IsVertical:(BOOL)isvertical OriginPoint:(NSInteger)originpoint{
    _nbcasetouch = 0;
    _length = [lengthTab[_type] integerValue];
    _isvertical = isvertical;
    _originpoint = originpoint;
    
}
@end
