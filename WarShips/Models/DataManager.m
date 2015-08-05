//
//  DataManager.m
//  WarShips
//
//  Created by François Juteau on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "DataManager.h"

#define SOUS_MARIN 1
#define NBSHIP 5
#define NBGRID 100
#define SOUTH_DIRECTION 10
#define EAST_DIRECTION 1
#define LAST_LINE 89

@implementation DataManager

static DataManager *sharedDataManager = nil;

#pragma mark - Instance Methods

/**
 *  @author François  Juteau, 15-08-05 00:08:51
 *
 *  @brief  Static method to return the instancied object
 *  @return instance of DataManager
 */
+(DataManager*)sharedDataManager
{
    if (sharedDataManager == nil)
    {
        sharedDataManager = [[DataManager alloc] ini];
    }
    
    return sharedDataManager;
}

- (DataManager*)init
{
    self = [super init];
    
    if (self)
    {
        for (int i = 0; i < NBSHIP; i++)
        {
            [_shipArray addObject:[[Ship alloc] initWithType:i]];
        }
        _grid = [[NSMutableArray alloc] init:NBGRID];
    }
    
    return self;
}


#pragma mark - Methods

/**
 *  @author François  Juteau, 15-08-05 02:08:52
 *
 *  @brief  Resets ships to random positions
 */
-(void)reset
{
    NSInteger length = 0;
    int randomval;
    BOOL isSouthDirection = NO;
    NSInteger index = 0;
    
    for (int i = 0; i < NBSHIP; i++)
    {
        if (![self isShipPlacementOk:index withDirection:isSouthDirection withLength:length])
        {
            length = [[_shipArray objectAtIndex:i] length];
            randomval = rand() % 2;
            isSouthDirection = (BOOL)randomval;
            index = rand() % 100;
        }
        
    }
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
-(BOOL)isShipPlacementOk:(NSInteger)_index withDirection:(BOOL)_isSouthDirection withLength:(NSInteger)_length
{
    // If the ship is not initialized
    if (_length != 0)
    {
        if ([self isCaseEmpty:_index])
        {
            NSInteger direction;
            NSInteger newIndex = _index;
            
            if (_isSouthDirection)
            {
                direction = SOUTH_DIRECTION;
            }
            else
            {
                direction = EAST_DIRECTION;
            }
            
            for (int i = 0; i < _length; i++)
            {
                newIndex++;
                if (![self isCaseEmpty:newIndex] && [self isShipExitsGrid:newIndex withDirection:_isSouthDirection])
                {
                    return NO;
                }
            }
            return YES;
        }
        else
        {
            return NO;
        }
    
    }
    else
    {
        return NO;
    }
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
    if ( [[grid objectAtIndex:_index] isEqual:nil])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 *  @author François  Juteau, 15-08-05 05:08:02
 *
 *  @brief  Check if the next ship index will be displayed in another line
 *  @param _index            next index
 *  @param _isSouthDirection direction of the next index
 *  @return true if the ship is in parts
 */
-(BOOL)isShipExitsGrid:(NSInteger)_index withDirection:(BOOL)_isSouthDirection
{
    if (_index%10 == 0 && !_isSouthDirection)
    {
        return YES;
    }
    if (_index > LAST_LINE && _isSouthDirection)
    {
        return YES;
    }
    return NO;
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
