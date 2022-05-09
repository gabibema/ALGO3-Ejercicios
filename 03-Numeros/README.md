# **Respuestas Teóricas**

## Aporte de los mensajes de DD
- En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

El primer llamado nos aporta información sobre el receptor, mientras que el segundo nos aporta sobre el argumento. Por ejemplo, si realizamos la operacion de 1 + 1/2 (suponiendo que son números de la clase número) al que se le manda el mensaje de sumarle 1/2 es al 1 (receptor), el cual es entero. De esta manera, va a invocarse al método de + de la clase entero. Luego, a través del polimorfismo se evalúa si el parámetro (1/2) es fracción o entero entrando así al método correspondiente.

## Lógica de instanciado
- Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Dependiendo el caso, nos parece mejor tener la lógica de instanciar un objeto implementada en las subclases o no. Sería correcto hacerlo si las subclases tienen características específicas o se quieren crear objetos de diferentes formas, para también evitar que la superclase tenga información demás del objeto. Por ejemplo: Si la clase Numero tuviese un solo initialize, ésta debería contener a los colaboradores de "valor", "tipo", "denominador" y "numerador". En el caso de crear un entero, se tendrían estos dos últimos colaboradores innecesariamente.  Por eso, resulta mucho mas conveniente subclasificar en Entero y Fraccion para disminuír las responsabilidades de Numero.

## Nombres de las categorías de métodos
- Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

El primer criterio que tomamos es analizar si el método debería ser privado o público, es decir, si se supone que sólo el objeto puede acceder a él o no.
Luego, volvemos a categorizar de acuerdo con el rol que cumplen o su funcionalidad.
Por ejemplo: cuando implementamos los métodos de beAddedToAnInteger nos dimos cuenta que no tenía sentido que fuesen públicos, ya que el mensaje que se utiliza para sumar es el + y es internamente dentro de éste donde se invocan a los otros (los de beAddedTo).

## Subclass Responsibility
- Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Por más que todas las subclases sepan responder al mismo mensaje, utilizamos el “self subclassResponsibility” ya que no todas lo hacen de la misma manera, es decir hay polimorfismo. Con esto se logra que el objeto sepa responder al mensaje enviado invocando al método correspondiente que va a pertenecer a la subclase de la cual el objeto forma parte. De esta forma se lograron "eliminar" los ifs del trabajo práctico.

## No rompas
- ¿Por qué está mal/qué problemas trae romper encapsulamiento?

Esta mal romper el encapsulamiento en principio por motivos teóricos, ya que uno crea su modelo de la realidad de manera que los objetos se conozcan entre sí sólo si en la realidad lo hacen. Si uno crea una clase Numero con las subclases Entero y Fracción, es justamente para poder "encapsular" estos conceptos separadamente y poder otorgarles sus propias caractrísticas. 
En segundo lugar, dado que traería problemas, como por ejemplo hacer que un Entero responda a "numerator" o "denominator" porque no pertenecen a su clase sino que a la de Fraccion.


