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
        //Na posição 0,0 - Necessário??
        posicao.x=0;
        posicao.y=0;
        CCSprite* _sprite=[[CCSprite alloc] initWithFile:@"explorador.png"];
        sprite = [_sprite retain];
        [_sprite release];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}


-(int) getVida
{
    return vida;
}
-(void)setVida:(int) v
{
    vida+=v;
}

-(CCSprite *) getSprite
{
    return sprite;
}
@end
