<h2 align="center">Practica 4 (Arboles 🌳)</h2>

### `Políticas para la resolución de underflow`

- #### `Política izquierda:`

Se intenta distribuir con el hermano adyacente izquierdo, si no es posible, se fusiona con hermano adyacente izquierdo.

- #### `Política derecha:`

se intenta redistribuir con el hermano adyacente derecho, si no es posible, se fusiona con hermano adyacente derecho

- #### `Política izquierda o derecha:`

Se intenta redistribuir con el hermano adyacente izquierdo, si no es posible, se intenta con el hermano adyacente derecho, si tampoco es posible, se fusiona con hermano adyacente izquierdo.

- #### `Política derecha o izquierda:`

Se intenta redistribuir con el hermano adyacente derecho, si no es posible, se intenta con el hermano adyacente izquierdo, si tampoco es posible, se fusiona con hermano adyacente derecho.

- #### `Casos especiales:`

En cualquier política si se tratase de un nodo hoja de un extremo del árbol debe intentarse redistribuir con el hermano adyacente que el mismo posea.


- #### `Aclaración:`

- En caso de underflow lo primero que se intenta `SIEMPRE` es redistribuir y el hermano adyacente se encuentra en condiciones de ceder elementos si al hacerlo no se produce underflow en el.
- En caso de overflow `SIEMPRE` se genera un nuevo nodo. Las claves se distribuyen
equitativamente entre el nodo desbordado y el nuevo.

```
En el caso de órdenes impares se debe promocionar la clave o la copia 
(en árbol B+) que se encuentra en la posición del medio.
```

<h3 align="center">Ejemplo árbol B, orden 5</h3>



![image](https://user-images.githubusercontent.com/55964635/168178670-2028892f-70bb-4654-87e7-0d54cecdf21c.png)