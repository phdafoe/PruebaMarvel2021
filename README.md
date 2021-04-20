# Openbank - Mobile Test

## Definición de una arquitectura
En este apartado implemento una arquitectura 'modelo-vista-presentador', la App de ejemplo es sencilla que le permite obtener desde un servicio web una lista de elementos, mostrarlas en una UITableView, además de enseñar una vista detalle del objeto seleccionado de dicha celda de la tabla, como parte del ejemplo, se utilizan tanto UItableView con UIcollectionView, y UITableViewCell como UICollectionViewCell personalizados.

### Estructura de la App

![Estructura proyecto](https://github.com/phdafoe/EntelgyMarvel/blob/main/EstructuraEjemplo.png)

### Base MVP del proyecto

Dicho patron define la **BaseViewController** para los UIViewController en general, un **BasePresenter** que establece con [GENERICOS](https://swiftbycoding.dev/swift/genericos/) tanto la **ViewController** como el **Router**, que define la forma de navegación de la App y el **BaseRouter** con las posibilidades de navegación necesarias para la App.
~~~
// MARK: - BaseNavigationController
class BaseNavigationController: UINavigationController {
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - BaseViewController
class BaseViewController <T>: UIViewController {
     var presenter: T?
}

// MARK: - BasePresenter
class BasePresenter <T, U> {
    
    internal var viewController: T?
    internal var router: U?
    
    convenience init (viewController: T, router: U? = nil) {
        self.init()
        self.viewController = viewController
        self.router = router
    }
    
}

// MARK: - BaseRouter
class BaseRouter<P> {
    
    internal var presenter: P?
    internal var viewController: UIViewController?
    
    convenience init(presenter: P? = nil, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    internal func show(_ vc: UIViewController){
        if let navigationController = viewController?.navigationController {
            DispatchQueue.main.async {
                navigationController.pushViewController(vc, animated: true)
            }
        }
    }
    
    internal func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        if let navigationController = viewController?.navigationController {
            navigationController.present(viewControllerToPresent, animated: flag, completion: completion)
            return
        }
        viewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
~~~
## Configuración de carpetas en el proyecto

Fundamentalmente se modulariza cada funcionalidad nueva y se crea el Patrón MVP para cada modulo, esto permite flexibilidad en el momento de desarrollar, ya que pueden coexistir varios desarrolladores al tiempo.

### Carpetas Core

![CarpetasCore](https://github.com/phdafoe/EntelgyMarvel/blob/main/CarpetasCore.png)

### Carpetas Modulos(MVP)

![CarpetasModulos](https://github.com/phdafoe/EntelgyMarvel/blob/main/CarpetasModulos.png)

### Contenido Módulo

![ContenidoModulo](https://github.com/phdafoe/EntelgyMarvel/blob/main/ContenidoModulo.png)

## Implementación de Clean Code 
Este patrón permite separar la Interfza del Modelo de datos perfectamente, implementando los principios [SOLID](https://profile.es/blog/principios-solid-desarrollo-software-calidad/)

¿Cuál es el papel del presentador?
El [tío Bob](http://cleancoder.com/products) dice:

El trabajo del **ViewModel/Presenter** es volver a empaquetar OutputData en una forma visible para la vista. **ViewModel/Presenter** contiene principalmente cadenas y banderas que la vista usa para mostrar los datos. El **ViewModel/Presenter** cargará con las cadenas correspondientes ya formateadas correctamente para el usuario. etc..

## Especificaciones de la prueba

### Uso de la Api de Marvel para la App

Se utiliza la Api de [Marvel](https://developer.marvel.com/documentation/getting_started) para realizar la App, en ella es necesario crear una cuenta para obtener la clave de Api pata poder realizar la llamadas necesarias, una vez que realizas el registro, y con las claves, se monta un StoreManager que se encargará de hacer las llamadas necesarias.

![Marvel1](https://github.com/phdafoe/EntelgyMarvel/blob/main/Marvel1.png)
![Marvel2](https://github.com/phdafoe/EntelgyMarvel/blob/main/Marvel2.png)

### Dependencias y librerías
- Se tiene en cuenta la implementación de [Kingfisher](https://github.com/onevcat/Kingfisher), para cargar las imágenes.

### Instalación de dependencias (SPM)
- Se usa CocoaPods para la gestión de librerías de terceros.

### Implementación de Test Unitarios
- Se han construido algunos Test con XCTest.

