//
//  Mato.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 19/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Mato.h"


@implementation Mato

- (id)init
{
    self = [super init];
    if (self) {
        CCSprite* _sprite = [[CCSprite alloc]initWithFile:@"mato.png"];
        sprite =[_sprite retain];
        [_sprite release ];
    }
    return self;
}

- (void)dealloc
{
        [super dealloc];
    [sprite release];

}

-(void)efeito:(Explorador*)explorador{
    //Pontos+++?
    NSLog(@"Nada acontece");
//    se for um mato, nada acontece
}
-(CCSprite*)getSprite
{
    return sprite;
}
@end
