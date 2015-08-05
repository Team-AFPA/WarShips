//
//  Ship.h
//  WarShips
//
//  Created by François Juteau on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ship : NSObject
{
    NSArray *lengthTab;
}

@property (nonatomic) NSInteger type;
@property (nonatomic) NSInteger length;
@property (nonatomic) NSInteger nbcasetouch;
@property (nonatomic) BOOL isvertical;
@property (nonatomic) NSInteger originpoint;

-(id) initWithType:(NSInteger)_type;

-(void)affectship:(NSInteger)_type IsVertical:(BOOL) isvertical OriginPoint:(NSInteger) originpoint;

@end
