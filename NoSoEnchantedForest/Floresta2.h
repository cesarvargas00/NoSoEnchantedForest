//
//  MyClass.h
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 18/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mato.h"
#define tamanho 8
@interface Floresta2 : NSObject {
@private
    NSMutableArray *arrayMato;
}
-(Mato*) getMatoX:(int) indiceX Y:(int)indiceY;
-(id) init ;
@end
