//
//  Explorador.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 19/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Explorador.h"


@implementation Explorador

- (id)init
{
    self = [super init];
    if (self) {
        //Começa com 5 vidas.
        vida=5;
        //Na posição 1,1
        posicao.x=1;
        posicao.y=1;
        CCSprite* _sprite=[[CCSprite alloc] initWithFile:@"explorador.png"];
        sprite = [_sprite retain];
        [_sprite release];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [sprite release];
}


-(int) getVida
{
    return vida;
}
-(void)setVida:(int) v
{
    vida=v;
}

-(CCSprite *) getSprite
{
    return sprite;
}

-(Pos)getPos
{
    return posicao;
}
-(void)setPosX:(int)x Y:(int) y{
    posicao.x=x;
    posicao.y=y;
}
@end
