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

@property (nonatomic) NSInteger type; // propriété des variables de la classe Ship classes
@property (nonatomic) NSInteger length;
@property (nonatomic) NSInteger nbCaseTouch;
@property (nonatomic) BOOL isVertical;
@property (nonatomic) NSInteger originPoint;

-(id) initWithType:(NSInteger)_type; // Constructeur de la classe Ship

-(void)affectShip:(BOOL)isVertical originPoint:(NSInteger)originPoint; // Méthode d'affectation des paramètres d'un objet Ship

@end
