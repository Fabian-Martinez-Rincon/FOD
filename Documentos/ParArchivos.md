### 1 Archivos Secuenciales

La gerencia general de una empresa de ventas de artículos para el hogar con dos sucursales en la ciudad recibe mensualmente de cada sucursal un archivo ordenado por códigos de categoría, de marca y de modelo de productos vendidos en el mes, con la cantidad de unidades vendidas de cada uno.

Codificar un procedimiento que reciba como párametros a los dos archivos de ventas y a un archivo de texto, todos asignados y sin abrir, y reporte en el archivo de texto el total de unidades vendidas por categoria, por categoria y marca, y por categoria, marca y modelo.

Una misma marca puede tener productos de distintas categorías, y distintas marcas pueden tener productos con el mismo código de modelo.

### 1 Archivos Secuenciales

Una cadena de restaurantes posee un archivo de productos que tiene a la venta, de cada producto se registra: código de producto, nombre, descripción, código de barras, categoría de producto, stock actual y stock minimo. Diariamente el depósito debe efectuar envios a cada uno de los tres restaurantes que se encuentran en la ciudad de Laprida. Para esto, 


- [Codigos](/Documentos/Codigos.md)

### A tener en cuenta para el parcial:

#### Arboles B🌳


- Chequear de que no falta ningun nodo, en caso de que falte algun nodo, lo agrego a mi pila de NL
- Hacer la L/E de cada operación
  - Aclarar que hago las operaciones en `PreOrden`
  - Si no nos dan un arbol, el primero nodo se escribe `E0`
  - No escribimos cuando un nodo es liberado
  - Cuando un nodo es liberado, lo guardo en una pila `EJ: nl:3`
- Explicar el proceso
- Hacer el grafico
  - Cuando tengo overflow, siempre tengo que crear un nodo y promocionar otro, esta operación se llama `división y promoción :O` (en caso de que no tenga un ningun nodo en la pila) 
  - Pierdo un nivel del arbol cuando tengo que fusionar sus dos unicos hijos.
  - O cuando el andeflow se propaga a la raiz
  - Cada vez que tengo que fusionar 

#### Arboles B+🌳

- Lo mismo que con los arboles B, solo que sus elementos se encuentrar en las raises
- Cuando quiero eliminar un elemento `x` y no se encuentra en las hojas