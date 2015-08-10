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
#define NB_LINES 10
#define NB_COLONS 10

@interface DataManager ()
    // ====================== //
    // ----- PROPERTIES ----- //
    // ====================== //
    #pragma mark - Properties
    /**
    *  @author François  Juteau, 15-08-05 00:08:07
    *
    *  @brief  array of ships positions
    */
    @property (strong, nonatomic, readonly) NSMutableArray *grid;

    /**
     *  @author François  Juteau, 15-08-05 00:08:03
     *
     *  @brief  array of every ships
     */
    @property (strong, nonatomic, readonly) NSMutableArray *shipArray;
@end


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


#pragma mark - Inits & resets

/**
 *  @author François  Juteau, 15-08-05 07:08:29
 *
 *  @brief  Initialize the properties
 *  @return instance of DataManager
 */
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
        _grid = [[NSMutableArray alloc] init];
        for (int j = 0; j < NBGRID; j++)
        {
            [_grid addObject:@""];
        }
        [self reset];
    }
    
    return self;
}

/**
 *  @author François  Juteau, 15-08-05 02:08:52
 *
 *  @brief  Resets ships to random positions
 */
-(void)reset
{
    for (int i = 0; i < NBGRID; i++)
    {
        [_grid replaceObjectAtIndex:i withObject:@""];
    }
    
    nbShipSunk = 0;
    
    [self replaceShips];
}


#pragma mark - External Methods

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
        return [self getAllIndexForShipAtIndex:[[_grid objectAtIndex:_index] originPoint]];
    }
    return nil;
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


#pragma mark - Intern methods

/**
 *  @author François  Juteau, 15-08-06 02:08:48
 *
 *  @brief  Manage all ships placement
 */
-(void)replaceShips
{
    NSUInteger length = 0;
    int randomval;
    BOOL isSouthDirection = NO;
    NSUInteger index = 0;
    NSUInteger direction;
    
    for (int i = 0; i < NBSHIP; i++)
    {
        length = 0;
        
        while(![self isShipPlacementOk:index withDirection:isSouthDirection withLength:length])
        {
            length = [[_shipArray objectAtIndex:i] length];
            randomval = arc4random() % 2;
            isSouthDirection = (BOOL)randomval;
            index = arc4random() % NBGRID;
        }
        [[_shipArray objectAtIndex:i] affectShip:isSouthDirection originPoint:index];
        direction = [self getDirection:isSouthDirection];
        for (int j = 0; j < length; j++)
        {
            [_grid replaceObjectAtIndex:index withObject:[_shipArray objectAtIndex:i]];
            index += direction;
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
            NSInteger direction = [self getDirection:_isSouthDirection];
            NSInteger newIndex = _index;
            
            for (int i = 0; i < _length; i++)
            {
                if (![self isCaseEmpty:newIndex] )
                {
                    return NO;
                }
                if ([self isShipExitsGrid:newIndex withDirection:_isSouthDirection])
                {
                    return NO;
                }
                newIndex += direction;
                
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
    if ( [[_grid objectAtIndex:_index] isEqual:@""])
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
    if (!_isSouthDirection && _index % NB_LINES == NB_COLONS-1 )
    {
        return YES;
    }
    if (_isSouthDirection && _index > LAST_LINE )
    {
        return YES;
    }
    return NO;
}

/**
 *  @author François  Juteau, 15-08-05 02:08:58
 *
 *  @brief  Get all indexes for the ship in param
 *  @param _index ship index wanted
 *  @return array of indexes of the ship
 */
-(NSMutableArray *)getAllIndexForShipAtIndex:(NSInteger)_index
{
    NSMutableArray *tempIndexes = [[NSMutableArray alloc] init];
    Ship *tempShip = [_grid objectAtIndex:_index];
    NSUInteger length = [tempShip length];
    BOOL isSouthDirection = [tempShip isVertical];
    NSUInteger direction;
    NSUInteger newIndex = _index;
    
    for (int i = 0; i < length; i++)
    {
        direction = [self getDirection:isSouthDirection];
        
        [tempIndexes addObject:[[NSString alloc] initWithFormat:@"%ld", newIndex]];
        newIndex += direction;
    }
    
    return tempIndexes;
}


/**
 *  @author François  Juteau, 15-08-06 00:08:15
 *
 *  @brief  Get the difference to add to an index to get to the next index
 *  @param _isSouthDirection direction index
 *  @return direction value
 */
-(NSUInteger)getDirection:(BOOL)_isSouthDirection
{
    if (_isSouthDirection)
    {
        return SOUTH_DIRECTION;
    }
    else
    {
        return EAST_DIRECTION;
    }
}


#pragma mark - DEBUG

/**
 *  @author François  Juteau, 15-08-06 00:08:43
 *
 *  @brief  Get the ship type for the ship in parameter
 *  @param _index ship index
 *  @return ship type
 */
-(NSUInteger)getShipType:(NSUInteger)_index
{
    Ship *tempShip = [_grid objectAtIndex:_index];
    return [tempShip idType];
}

@end
