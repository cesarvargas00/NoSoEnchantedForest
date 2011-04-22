//
//  MyClass.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 18/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Floresta.h"
#import <stdlib.h>
#import "Perigo.h"
#define tamanho 5
@implementation Floresta

- (id)init
{
    
    self = [super init];
    if (self) {
        //Aloca o array de Mato
        arrayMato = [NSMutableArray array];
        // Cria uma matriz no arrayMato alocado
        for (int i=0;i<tamanho;i++){
            [arrayMato addObject:[NSMutableArray array]];
        }
        int r;
        //Gera um número random de 0 a 3, e dependendo do número, aloca um objeto diferente.
        for(int i=0;i<tamanho;i++){
            for(int j=0;j<tamanho;j++){
                r = arc4random() % 4;
                if(r==0){
                    Mato *mato = [[Perigo alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==1)
                {
                    Mato *mato = [[Mato alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==2)
                {
                    Mato *mato = [[Mato alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }            
                else if(r==3)
                {
                    Mato *mato = [[Mato alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
            }
        }
    }
    
    return self;
}

- (void)dealloc{         
    [super dealloc];
}

-(Mato*)getMatoX:(int)indiceX Y:(int)indiceY
{
    return [[arrayMato objectAtIndex:indiceX]objectAtIndex:indiceY];
}

@end
