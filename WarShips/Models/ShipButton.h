//
//  ShipButton.h
//  WarShips
//
//  Created by François Juteau on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShipButton : UIButton
{
    BOOL isThereAShip;
}

//Getter method
-(BOOL) isThereAShip;



//Setter method
-(void) setIsThereAShip:(BOOL)_bool;

@end
