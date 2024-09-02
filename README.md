# popularPosts
Nagarro assignment for project

## Architecture
    App uses MVVM, Modular and Clean architecture. Along with RxSwift. SOLID principles are highly considered during development.


## Moduler Network Layer
    Network layer is designed in a seperate swift package to provide modularity. Using modularity package development can be performed independently.
    
## Database Layer
    Database layer is designed in a seperate dynamic framework. Database is connected using protocols, in order to provide abstraction. Currently RealM is tried to to store posts. It's very initial phase of RealM implementation. 
    
## LoginHelper
    Assist to login. This does not performs string sanitisation. Helper is responsible for API and DB call.

## PostHelper
    Assist to posts. This does not performs string sanitisation. Helper is responsible for API and DB call.
    
