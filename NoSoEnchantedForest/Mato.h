//
//  Mato.h
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 19/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Explorador.h"
#import "cocos2d.h"
@interface Mato : NSObject {
    Pos posicao;
    CCSprite* sprite;
    BOOL explored;
}
- (id)init;

-(void)efeito:(Explorador*)explorador;

-(CCSprite*)getSprite;
-(BOOL)isExplored;
-(void)setExplored:(BOOL) flag;
@end
