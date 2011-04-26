//
//  Explorador.h
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 19/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pos.h"
#import "cocos2d.h"

@interface Explorador : NSObject {
@private
    int vida;
    Pos posicao;
    CCSprite* sprite;
}
-(int) getVida;
-(void)setVida:(int) v;
-(CCSprite *) getSprite;
-(Pos)getPos;
-(void)setPosX:(int)x Y:(int) y;
@end
