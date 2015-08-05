//
//  DataManager.m
//  WarShips
//
//  Created by François Juteau on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "DataManager.h"

#define SOUS_MARIN = 1;

@implementation DataManager

#pragma mark - Instance Methods

/**
 *  @author François  Juteau, 15-08-05 00:08:51
 *
 *  @brief  Static method to return the instancied object
 *  @return instance of DataManager
 */
+(DataManager *)sharedDataManager
{
    DataManager *instance = [[DataManager alloc] init];
    return instance;
}


#pragma mark - Methods

/**
 *  @author François  Juteau, 15-08-05 02:08:52
 *
 *  @brief  Resets ships to random positions
 */
-(void)reset
{
    
    
}

/**
 *  @author François  Juteau, 15-08-05 02:08:09
 *
 *  @brief  Check if all the ship indexes are OK
 *  @param _index     ship index
 *  @param _direction ship direction
 *  @param _length    ship length
 *  @return true if the ship placement is OK
 */
-(BOOL)isShipPlacementOk:(NSInteger)_index withDirection:(BOOL)_direction withLength:(NSInteger)_length
{
    
    return YES;
}

/**
 *  @author François  Juteau, 15-08-05 02:08:12
 *
 *  @brief  Check if the case is empty
 *  @param _index index to check
 *  @return true if empty
 */
-(BOOL)isCaseEmpty:(NSInteger)_index
{
    
    return YES;
}

/**
 *  @author François  Juteau, 15-08-05 02:08:54
 *
 *  @brief  Impact the ship touch to the ship properties
 *  @param _index index of the touch
 *  @return array of indexes if the ship is sunk / nil if it's only touch
 */
-(NSArray *)shipTouch:(NSInteger)_index
{
    
    return @[];
}

/**
 *  @author François  Juteau, 15-08-05 02:08:58
 *
 *  @brief  Get all indexes for the ship in param
 *  @param _index ship index wanted
 *  @return array of indexes if the ship is sunk / nil if it's only touch
 */
-(NSArray *)getAllIndexForShipAtIndex:(NSInteger)_index
{
    
    return @[];
}

@end
