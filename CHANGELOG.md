## [3.1.1 FIX  'Hero' requires minimum platform version 10.0](https://github.com/SDOSLabs/SDOSHero/tree/v3.1.1)

- Fix: The package product 'Hero' requires minimum platform version 10.0 for the iOS platform, but this target supports 9.0

## [3.1.0 Support Swift Package Manager](https://github.com/SDOSLabs/SDOSHero/tree/v3.1.0)

- Add support for Swift Package Manager

## [3.0.0 Eliminada fachada para Objective-C](https://github.com/SDOSLabs/SDOSHero/tree/v3.0.0)

- Eliminada la fachada de la librería necesaria para Objective-C

## [2.0.0 Eliminado soporte para Objective-c](https://github.com/SDOSLabs/SDOSHero/tree/v2.0.0)

- Se ha eliminado el soporte a Objective-c por problemas de compatibilidad al usar cocoapods y use_frameworks!. La librería puede seguir siendo usada en Objective-c pero será necesario incluir los ficheros que hacían de puente en el proyecto. Para ello es necesario copiar los ficheros que se encuentran en el proyecto de ejemplo en la ruta Sample/SDOSHero/App/Others/SDOSHero

## [1.1.2 Fix animations in SDOSHeroTabBarController](https://github.com/SDOSLabs/SDOSHero/tree/v1.1.2)

- En el SDOSHeroTabBarController, al seleccionar un tab programáticamente, se respeta la dirección de la animación seteada al realizar la transición.

## [1.1.1 Open classes](https://github.com/SDOSLabs/SDOSHero/tree/v1.1.1)

- Las clases SDOSHeroTabBarController y SDOSHeroNavigationController se han marcado como 'open' para que puedan ser extensibles mediante subclases.

## [1.1.0 Hero 1.4.0](https://github.com/SDOSLabs/SDOSHero/tree/v1.1.0)

- Actualizada la librería Hero a la versión 1.4.0 que añade soporte para Swift 4.2, siendo retrocompatible con Swift 4.
- Corregido crash en el proyecto de ejemplo que ocurría en la pantalla de transiciones modales.

## [1.0.2 Animation fix](https://github.com/SDOSLabs/SDOSHero/tree/v1.0.2)

- Corregido un error que podía producir que no se respetara la animación deseada al hacer un present usando los métodos -presentViewController:usingAnimation. Lo mismo se ha hecho para los métodos -dismissViewControllerUsingAnimation:.

## [1.0.1 Swift 4](https://github.com/SDOSLabs/SDOSHero/tree/v1.0.1)

- Actualizado a Swift 4

## [1.0.0 Primera versión](https://github.com/SDOSLabs/SDOSHero/tree/v1.0.0)

- Primera versión de SDOSHero
