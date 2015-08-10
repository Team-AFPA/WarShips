//
//  Ship.h
//  WarShips
//
//  Created by Julien Poumarat on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ship : NSObject

@property NSInteger idType; // propriété des variables de la classe Ship classes
@property NSInteger length;
@property NSInteger nbCaseTouch;
@property BOOL isVertical;
@property BOOL isPositif;
@property NSInteger originPoint;
@property BOOL isSunk;

-(id) initWithType:(NSInteger)_type; // Constructeur de la classe Ship

-(void)affectShip:(BOOL)isVertical withPositive:(BOOL)_positive originPoint:(NSInteger)originPoint; // Méthode d'affectation des paramètres d'un objet Ship

-(BOOL)isShipSunk;

-(BOOL)isHeadshot:(NSUInteger)_index;

-(void)resetSunkStats;
@end
