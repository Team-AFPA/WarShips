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
#define NBTYPE 4
#define NBGRID 100
#define SOUTH_DIRECTION 10
#define EAST_DIRECTION 1
#define LAST_LINE 89

@implementation DataManager
{
    NSUInteger nbShipSunk;
}
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
        sharedDataManager = [[DataManager alloc] init];
    }
    
    return sharedDataManager;
}

- (DataManager*)init
{
    self = [super init];
    
    if (self)
    {
        _shipArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < NBTYPE; i++)
        {
            [_shipArray addObject:[[Ship alloc] initWithType:i]];
            
            // We have two submarin in the game
            if (i == SOUS_MARIN)
            {
                [_shipArray addObject:[[Ship alloc] initWithType:i]];
            }
        }
        _grid = [[NSMutableArray alloc] initWithCapacity:NBGRID];
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
    for (int i = 0; i > NBGRID; i++)
    {
        [_grid replaceObjectAtIndex:i withObject:nil];
    }
    
    nbShipSunk = 0;
    
    [self replaceShips];
}

-(void)replaceShips
{
    NSMutableArray *tempIndexes = [[NSMutableArray alloc] init];
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
        else
        {
            [[_shipArray objectAtIndex:i] setLength:length];
            [[_shipArray objectAtIndex:i] setIsVertical:isSouthDirection];
            [[_shipArray objectAtIndex:i] setOriginPoint:index];
            tempIndexes = [self getAllIndexForShipAtIndex:index];
            for (int j = 0; j < length; j++)
            {
                [_grid replaceObjectAtIndex:[tempIndexes[j] integerValue] withObject:[_shipArray objectAtIndex:i]];
            }
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
    if ( [[_grid objectAtIndex:_index] isEqual:nil])
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
-(NSMutableArray *)shipTouch:(NSInteger)_index
{
    Ship *tempShip =[_grid objectAtIndex:_index];
    [tempShip setNbCaseTouch:[tempShip nbCaseTouch]+1];
    
    if ( [tempShip nbCaseTouch] == [tempShip length])
    {
        nbShipSunk++;
        return [self getAllIndexForShipAtIndex:_index];
    }
    return nil;
}

/**
 *  @author François  Juteau, 15-08-05 02:08:58
 *
 *  @brief  Get all indexes for the ship in param
 *  @param _index ship index wanted
 *  @return array of indexes if the ship is sunk / nil if it's only touch
 */
-(NSMutableArray *)getAllIndexForShipAtIndex:(NSInteger)_index
{
    NSMutableArray *tempIndexes = [[NSMutableArray alloc] init];
    NSUInteger length = [[_grid objectAtIndex:_index] length];
    BOOL isSouthDirection = [[_grid objectAtIndex:_index] isVertical];
    NSUInteger direction;
    NSUInteger newIndex = _index;
    
    for (int i = 0; i < length; i++)
    {
        
        if (isSouthDirection)
        {
            direction = SOUTH_DIRECTION;
        }
        else
        {
            direction = EAST_DIRECTION;
        }
        newIndex += direction;
        
        [tempIndexes[i] addObject:[[NSString alloc] initWithFormat:@"%ld", newIndex]];
    }
    
    return tempIndexes;
}

/**
 *  @author François  Juteau, 15-08-05 06:08:24
 *
 *  @brief  Get all indexes for all the ships in game
 *  @return array of all the indexes
 */
-(NSMutableArray *)getAllIndexesForAllShips
{
    NSMutableArray *indexes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < NBSHIP; i++)
    {
        [indexes addObjectsFromArray:[self getAllIndexForShipAtIndex:[[_shipArray objectAtIndex:i] originPoint]]];
    }
    return indexes;
}

/**
 *  @author François  Juteau, 15-08-05 07:08:40
 *
 *  @brief  Return the game status
 *  @return true if the game is ended
 */
-(BOOL)isEndOfGame
{
    if (nbShipSunk == NBSHIP)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
