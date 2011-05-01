//
//  Manga.m
//  NoSoEnchantedForest
//
//  Created by Wellington Sousa Matos on 29/04/11.
//  Copyright 2011 Mackenzie. All rights reserved.
//

#import "Manga.h"


@implementation Manga
-(id)init
{
    self = [super init];
    if (self) {
        CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"manga.png"];
        sprite=[_sprite retain];
        [_sprite release];
    }
    return self; 
}

- (void)dealloc
{
    [super dealloc];

}

-(void)efeito:(Explorador*)explorador{
    if([explorador getVida]<5)
    [explorador setVida:[explorador getVida]+1];
}

@end
