//
//  DataManager.h
//  WarShips
//
//  Created by François Juteau on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ship.h"

@interface DataManager : NSObject

#pragma mark - Properties

/**
 *  @author François  Juteau, 15-08-05 00:08:07
 *
 *  @brief  array of ships positions
 */
@property (weak, nonatomic, readonly) NSMutableArray *grid;

/**
 *  @author François  Juteau, 15-08-05 00:08:03
 *
 *  @brief  array of every ships
 */
@property (weak, nonatomic, readonly) NSMutableArray *shipArray;


#pragma mark - Instance Methods

/**
 *  @author François  Juteau, 15-08-05 00:08:51
 *
 *  @brief  Static method to return the instancied object
 *  @return instance of DataManager
 */
+(DataManager*)sharedDataManager;


#pragma mark - Methods

/**
 *  @author François  Juteau, 15-08-05 02:08:52
 *
 *  @brief  Resets ships to random positions
 */
-(void)reset;

/**
 *  @author François  Juteau, 15-08-05 02:08:09
 *
 *  @brief  Check if all the ship indexes are OK
 *  @param _index     ship index
 *  @param _direction ship direction
 *  @param _length    ship length
 *  @return true if the ship placement is OK
 */
-(BOOL)isShipPlacementOk:(NSInteger)_index withDirection:(BOOL)_direction withLength:(NSInteger)_length;

/**
 *  @author François  Juteau, 15-08-05 02:08:12
 *
 *  @brief  Check if the case is empty
 *  @param _index index to check
 *  @return true if empty
 */
-(BOOL)isCaseEmpty:(NSInteger)_index;


/**
 *  @author François  Juteau, 15-08-05 05:08:02
 *
 *  @brief  Check if the next ship index will be displayed in another line
 *  @param _index            next index
 *  @param _isSouthDirection direction of the next index
 *  @return true if the ship is in parts
 */
-(BOOL)isShipExitsGrid:(NSInteger)_index withDirection:(BOOL)_isSouthDirection;

/**
 *  @author François  Juteau, 15-08-05 02:08:54
 *
 *  @brief  Impact the ship touch to the ship properties
 *  @param _index index of the touch
 *  @return array of indexes if the ship is sunk / nil if it's only touch
 */
-(NSMutableArray *)shipTouch:(NSInteger)_index;

/**
 *  @author François  Juteau, 15-08-05 02:08:58
 *
 *  @brief  Get all indexes for the ship in param
 *  @param _index ship index wanted
 *  @return array of indexes if the ship is sunk / nil if it's only touch
 */
-(NSMutableArray *)getAllIndexForShipAtIndex:(NSInteger)_index;

/**
 *  @author François  Juteau, 15-08-05 02:08:58
 *
 *  @brief  Get all indexes for all the ships in game
 *  @return array of all the indexes
 */
-(NSMutableArray *)getAllIndexesForAllShips;

/**
 *  @author François  Juteau, 15-08-05 07:08:40
 *
 *  @brief  Return the game status
 *  @return true if the game is ended
 */
-(BOOL)isEndOfGame;

@end
