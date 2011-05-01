//
//  MyClass.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 18/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Floresta.h"
#import <stdlib.h>
#import "Cobra.h"
#import "Ra.h"
#import "Piranha.h"
#import "Jaguatirica.h"
#import "Escorpiao.h"
#import "AranhaCaran.h"
#import "Tambaqui.h"
#import "Manga.h"
#import "Cupuacu.h"

@implementation Floresta

- (id)init
{
    
    self = [super init];
    if (self) {
        //Aloca o array de Mato
        arrayMato = [[NSMutableArray alloc]init];
        // Cria uma matriz no arrayMato alocado
        for (int i=0;i<tamanho;i++){
            [arrayMato addObject:[NSMutableArray array]];
        }
        int r;
        //Gera um número random de 0 a 26, e dependendo do número, aloca um objeto diferente.
        for(int i=0;i<tamanho;i++){
            for(int j=0;j<tamanho;j++){
                r = arc4random() % 26;
                if(r<12){
                    Mato *mato = [[Mato alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==11 || r==12)
                {
                    Mato *mato = [[Tambaqui alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==13 || r==14)
                {
                    Mato *mato = [[Manga alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }            
                else if(r==15 || r==16)
                {
                    Mato *mato = [[Cupuacu alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==17)
                {
                    Mato *mato = [[Jaguatirica alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==18)
                {
                    Mato *mato = [[Piranha alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==19)
                {
                    Mato *mato = [[Cobra alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==20||r==21)
                {
                    Mato *mato = [[Ra alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==22 || r==23)
                {
                    Mato *mato = [[AranhaCaran alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
                else if(r==24 || r==25)
                {
                    Mato *mato = [[Escorpiao alloc] init];
                    [[arrayMato objectAtIndex:i]addObject:mato];
                    [mato release];
                }
            }
        }
        //Seta o último como mato:
        Mato *mato = [[Mato alloc] init];
         [[arrayMato objectAtIndex:tamanho-1]removeObjectAtIndex:tamanho-1];
        [[arrayMato objectAtIndex:tamanho-1]addObject:mato];
        [mato release];
        
    }
    
    return self;
}

- (void)dealloc{      
    
    [super dealloc];
    [arrayMato release];
}

-(Mato*)getMatoX:(int)indiceX Y:(int)indiceY
{
    return [[arrayMato objectAtIndex:indiceX]objectAtIndex:indiceY];
}

@end
