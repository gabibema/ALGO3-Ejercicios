# Preguntas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

En los tests 01 y 02 nos dimos cuenta que había código repetido, por lo tanto seguimos el algoritmo para eliminar el código repetido y concluimos que la abstracción faltante era un cronómetro que nos permitiera tomar el tiempo que tardaba en realizarse una operación (añadir y eliminar, respectivamente). Al implementar esto, investigamos si ya existía en los mensajes de clase TestCase alguno que respondiera de la misma forma y encontramos que, efectivamente ya estaba implementado como "should: aClosure notTakeMoreThan: aLimit" el cual modularizaba nuestras pruebas.


## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Dentro de las funcionalidades del lenguaje SmallTalk está la representación a través de clases, que nos permiten abstraer ideas de entes de la realidad y luego modelar diferentes objetos correspondientes a esa idea abstracta a través de las instancias de una clase. Estos objetos pueden a su vez interactuar entre sí, responder mensjes y  también pueden tener colaboradores internos (los cuales a su vez modelan objetos de la realidad). En el caso del ejercicio, existe la clase CustomerBook que modela la idea de un libro de clientes, al instanciar creamos un libro particular al cual podemos empezar a tratar como un libro de clientes de la vida real que podemos gestionar agregando, suspendiendo, eliminando clientes, entre otras cosas.


## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?


Poner en tercera.
Cuando nos dieron el código ya implementado, al identificar código repetido nos tuvimos que poner a pensar en qué era lo que se estaba intentando representar, teniendo en cuenta el ente de la realidad que se intentaba modelar. Al realizar esto comprendimos el dominio del problema y nos convertimos en constructores de la teoría del programa. 
Al tener esta teoría, como programadores pudimos explicar el porqué de cada parte y elegir los principios y reglas a seguir para implementar lo necesario con el objetivo de quitar el código redundante.
Es así que la relación que encontramos entre la teoría del paper de Naur y crear abstracciones es que necesitamos de estas últimas para representar lo que nos falta de la realidad y esto es posible una vez que nos hacemos expertos en el dominio del problema.



























