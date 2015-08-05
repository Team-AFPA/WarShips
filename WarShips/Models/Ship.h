//
//  Ship.h
//  WarShips
//
//  Created by Julien Poumarat on 05/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ship : NSObject
{
    NSArray *lengthTab; // Déclaration du lengthTab
}

@property NSInteger idType; // propriété des variables de la classe Ship classes
@property NSInteger length;
@property NSInteger nbCaseTouch;
@property BOOL isVertical;
@property NSInteger originPoint;

-(id) initWithType:(NSInteger)_type; // Constructeur de la classe Ship

-(void)affectShip:(BOOL)isVertical originPoint:(NSInteger)originPoint; // Méthode d'affectation des paramètres d'un objet Ship

@end
