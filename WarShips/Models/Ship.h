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

@property (nonatomic) NSInteger Type; // propriété des variables de la classe Ship classes
@property (nonatomic) NSInteger Length;
@property (nonatomic) NSInteger NbCaseTouch;
@property (nonatomic) BOOL IsVertical;
@property (nonatomic) NSInteger OriginPoint;

-(id) initWithType:(NSInteger)_Type; // Constructeur de la classe Ship

-(void)affectship:(BOOL) isvertical OriginPoint:(NSInteger) originpoint; // Méthode d'affectation des paramètres d'un objet Ship

@end
