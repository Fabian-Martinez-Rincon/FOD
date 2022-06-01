<h1 align="center"><img src="https://media.giphy.com/media/sXD7snjkFWKaWzNt9D/giphy.gif" height="38" /> FOD </a>
</h1>

<table>
<tr>
<td> Codigos </td> <td> Practicas </td><td> Teoria </td>
</tr>
<tr>
<td>
 
- [Listas 🧾](/Documentos/Codigos/Listas.md)
- [Vectores 📚](/Documentos/Codigos/Vectores.md)
- [Arboles 🌳](/Documentos/Codigos/Arboles.md)
- [Archivos 📁](/Documentos/Codigos/Archivos.md)
- [Indices 👈🏼](/Documentos/Codigos/Indices.md)
- [Hashing #️⃣](/Documentos/Codigos/Hashing.md)

</td>
<td>
 

- [Practica 1](/Documentos/Practicas/Practica1Nueva.md)
- [Practica 2](/Documentos/Practicas/Practica2.md)
- [Practica 3](/Documentos/Practicas/Practica3.md)
- [Practica 4](/Documentos/Practicas/Practica4.md)
 
</td>

<td>

- [Archivos 📁](/Documentos/Teoria/Archivos.md)
- [Arboles 🌳](/Documentos/Teoria/Arboles.md)
- [Hashing #️⃣](/Documentos/Teoria/Hashing.md)

</td>



</tr>
 
</table>


</div>

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