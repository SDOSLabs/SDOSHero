//
//  Octopush+CoreiOS.h
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 20/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#import <Octopush/Octopush.h>

@interface Octopush (OctopushPrivate)

/**
 *  Propiedad privada de la librería para indicar el modo (Debug: "0", Preproduccion: "1", Produccion:"2")
 */
@property (nonatomic, strong) NSString *octopushMode;

@end
