<h2 align="center">Practica 4 (Arboles 🌳)</h2>

### `ESTOS EJERCICIOS SE TIENEN QUE CORREGIR`


<details>

<summary>📖 Ejemplos</summary><blockquote>
<br/>

<div align="center">

<h3 >Ejemplo árbol B, orden 5</h3>



![image](https://user-images.githubusercontent.com/55964635/168178670-2028892f-70bb-4654-87e7-0d54cecdf21c.png)

<h3 >Ejemplo árbol B+, orden 5</h3>

![image](https://user-images.githubusercontent.com/55964635/168179171-a388a148-a109-401d-b347-80bc06cc03ef.png)



</div>

**En el caso de órdenes pares se elige la menor de las claves mayores o su copia (en árbol B+) para promocionar.**

<div align="center">

<h3 >Ejemplo árbol B, orden 4:</h3>

![image](https://user-images.githubusercontent.com/55964635/168179792-380941d6-f72c-49af-abb8-e1fd5dd99590.png)


<h3 >Ejemplo árbol B+, orden 4:</h3>

![image](https://user-images.githubusercontent.com/55964635/168179892-af85f546-bb14-42ba-b6d4-f52e7dc7b286.png)

</div>

</details>



<h2 align="center">Árboles B y B+</h2>

`1)` Definir la estructura de datos correspondiente a un árbol B de orden M, que almacenará información correspondiente a alumnos de la facultad de informática de la UNLP. De los mismos deberá guardarse nombre y apellido, DNI, legajo y año de ingreso. ¿Cuál de estos datos debería seleccionarse como clave de identificación para organizar los elementos en el árbol? ¿Hay más de una opción? Justifique su elección.

<details >

<summary>📖 Resolución</summary><blockquote>
<br/>

### Definición

Los `árboles B` son árboles multicamino con una construcción especial que permite mantenerlos balanceados a bajo costo.

Un árbol B de orden M posee las siguientes propiedades básicas:

- `1)` Cada nodo del árbol puede contener, como máximo, M desendientes y M-1 elementos.
- `2)`La raíz no posee descendientes directos o tiene al menos dos.
- `3)` Un nodo con x descendientes directos contiene x-1 elementos.
- `4)` Los nodos terminales (hojas) tienen, como mínimo `[M/2]-1 elementos`, y como maximo `M-1 elementos`
- `5)` Los nodos que no son terminales ni raíz tienen, como mínimo, [M/2] elementos.
- `6)` Todos los nodos terminales se encuentran al mismo nivel


```Pas
program Ej1;
const M = 10;
type
    cadena20 = string[20];
    alumnos = record
        nombre:cadena20;
        apellido:cadena20;
        dni:cadena20;   
        legajo:integer;
        anio:integer;
    end;
    clave = record
        dni:integer;
        nrr:integer;
    end;
    nodo = record
        cant_claves:integer;
        claves: array[1..M-1] of clave;
        hijos:array[1..M] of Integer;
    end;
    arbol = file of nodo;
    archivo = file of alumnos;
var
    arbolB:arbol;
begin
end.
```
Deberian seleccionarse el `dni` y el `legajo` ya que son claves unicas.
</details>

`2)` Redefinir la estructura de datos del ejercicio anterior para un árbol B+ de orden M.

<details >

<summary>📖 Resolución</summary><blockquote>
<br/>

### Problema
Se ha discutido una solución de bajo costo, para recuperar los elementos en forma ordenada de un archivo, sin necesidad de reacomodamientos físicos costosos.

Ahora se debe encontrar un mecanismo que permite localizar los datos contenidos en los nodos, a bajo costo. La solución que presentaban los árboles B y B* debería poder aplicarse en este entorno.

### Solucion

La estructura intermedia resultante se denomina árbol B+ e incorpora las características discutidad para árboles B, ademas del tratamiento secuencial ordenado del archivo. Así, se podrán realizar búsquedas aleatorias rápidas de información, en conjunto con acceso secuencial eficiente.

### Arboles B+
Es un árbol multicamino con las siguientes propiedades:
- Cada nodo del árbol puede contener, como máximo, M desendientes y M-1 elementos.
- La raíz no posee descendientes o tiene al menos dos.
- Un nodo con x descendientes contiene x-1 elemenetos.
- Los nodos terminales tienen como minimo `([M/2]-1)` elementos y como maximo `M-1` elementos.
- Los nodos que no son terminales ni raíz tienen como minimo `[M/2]` descendientes.
- Todos los nodos terminales se encuentran al mismo nivel.
- Los nodos terminales representan un conjunto de datos y son enlazados entre ellos.


</details>

Responda detalladamente:

<details> <summary> a) ¿Cómo accede a la información para buscar al alumno con DNI 23.333.333? </summary><blockquote>
<br/>
Se accede de forma directa (indice).
</details>

<details> <summary> b) ¿Cómo accede a la información para buscar al alumno José Perez?</summary><blockquote>
<br/>
Se accese de forma secuencial ya que no es una clave.
</details>

<details> <summary> c) Indique cuáles son las ventajas que ofrece este tipo de árbol para el caso de la búsqueda planteada en el inciso b.</summary><blockquote>
<br/>
Realiza búsquedas aleatorias rápidas de información, en conjunto con acceso secuencial eficiente.
</details>

`3)` Dado el siguiente algoritmo de búsqueda en un árbol B:

```Pas
function buscar(NRR, clave, NRR_encontrado, pos_encontrada)
begin
    if (nodo = null)
        buscar := false; {clave no encontrada}
    else
        posicionarYLeerNodo(A, nodo, NRR);
    if (claveEncontrada(A, nodo, clave, pos)) then
        NRR_encontrado := NRR; {NRR actual)
        pos_encontrada := pos; {posición dentro del array}
    end
    else
    buscar(nodo.hijo[pos], clave, NRR_encontrado, pos_encontrada)
end;
```


Asuma que para la primera llamada, el parámetro NRR contiene la posición de la raíz del árbol. Responda detalladamente:

<details> <summary> a) <b>PosicionarYLeerNodo(A,nodo,NRR):</b> Indique qué hace y la forma en que deben ser enviados los parámetros (valor o referencia).</summary><blockquote>
<br/>
Posiciona al registro que corresponde a posRaiz pasado como parametro y retorna los elementos.posRaiz seria el indice del registro en el archivo

- `A` es por referencia ya que es un archivo (se supone, porque no esta en ningun lado declarado)
- `nodo` es por referencia ya que lo ¿modifico?
- `NRR` es por valor ya que la posición no la modifico

</details>

<details> <summary> b) <b>claveEncontrada(A,nodo,clave,pos):</b> Indique qué hace y la forma en que deben ser enviados los parámetros (valor o referencia). ¿Cómo lo implementaría? </summary><blockquote>
<br/>
Retorna true si el elemento se encuentra en el array de claves

- `A` por referencia
- `nodo` por valor
- `clave` por valor ya que no la puedo modificar porque es unica
- `pos` por valor ya que solo la uso como dato

</details>

<details> <summary> c) ¿Existe algún error en este código? En caso afirmativo, modifique lo que considere necesario.</summary><blockquote>
<br/>
eeeeeeeeeeee
literalmente cambie todo el codigo, los parametros estaban mal definidos, la funcion no retornaba un tipo de dato, habian variables que no estaban declaradas etc.

```Pas
//No entiendo de donde sale la variable "nodo" ya que tendria que ser un parametro
function buscar(posRaiz, clave, posRaiz_Actual,pos_encontrada:Integer):boolean;
var
    pos:integer;
begin
    if (nodo = null) then
        buscar := false {clave no encontrada}
    else
        PosicionarYLeerNodo(A, nodo, posRaiz);
    if (claveEncontrada(A, nodo, clave, pos)) then begin
        posRaiz_Actual := posRaiz; {posRaiz actual)}
        pos_encontrada := pos;     {posición dentro del array}
    end
    else
        buscar(nodo.hijo[pos], clave, posRaiz_Actual, pos_encontrada)
end;
```

</details>

`4)` Defina los siguientes conceptos:


<details> <summary> Overflow</summary><blockquote>
<br/>

Significa que en el nodo ya no hay capacidad disponible para almacenar un nuevo elemento de datos.

Cuando ocurre el overflow, es proceso es el siguiente:

- Se crea un nuevo nodo.
- La primera mitad de las clases se mantiene en el nodo con overflow.
- La segunda mitad de las clases se traslada al nuevo nodo.
- La menor de las claves de la segunda mitad se promociona al nodo padre

</details>

<details> <summary> Underflow</summary><blockquote>
<br/>

Significa que en el nodo tiene menos del minimo de la capacidad necesaria para almacenar un nuevo elemento de datos.

Cuando ocurre el underflow, es proceso es el siguiente:

- Primero se intenta **redistribuir** con un hermano adyacente. 

- Si la distribución no es posible, entonces se debe **fusionar** con el hermano adyacente.

`Nodos Hermanos:` Aquellos nodos que tienen el mismo nodo padre.

`Nodos adyacentes hermanos:` Aquellos nodos que, siendo hermanos, son además dependientes de punteros consecutivos del padre.



<details> <summary>📖 Politicas</summary><blockquote>
<br/>

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
</details>

</details>

<details> <summary> Redistribución</summary><blockquote>
<br/>
La redistribución es el proceso mediante el cual se trata de dejar a cada nodo lo más equitativamente cargado posible.
</details>

<details> <summary> Fusión o concatenación </summary><blockquote>
<br/>
Ocurre cuando un nodo se encuentra en `Underflow`, si el nodo adyacente hermano tiene el maximo de elementos (a preguntar)
</details>

<details> <summary> En los dos últimos casos, ¿cuándo se aplica cada uno? </summary><blockquote>
<br/>
A preguntar
</details>


```
Para los siguientes ejercicios debe:
● Indicar los nodos leídos y escritos en cada operación.
● Todas las operaciones deben estar claramente justificadas, enunciando las mismas
indefectiblemente tal cual se presenta en la materia.
● Los números de nodo deben asignarse en forma coherente con el crecimiento del
archivo. La reutilización de nodos libres se debe efectuar con política LIFO (último
en entrar, primero en salir).
```


`5)` Dado el siguiente árbol B de orden 5, mostrar como quedaría el mismo luego de realizar las siguientes operaciones: +320, -390, -400, -533. Justificar detalladamente cada operación indicando lecturas y escrituras en orden de ocurrencia. Para la resolución de underflow debe utilizar `política a izquierda`. Graficar cada operación por separado.

```
2: 0 (220) 1 (390) 4 (455) 5 (541) 3

0: (10)(150) 1: (225)(241)(331)(360) 4: (400)(407) 5: (508)(533) 3: (690)(823)

```

<details >

<summary>📖 Resolución</summary><blockquote>

#### Esquema

![image](https://user-images.githubusercontent.com/55964635/168456796-9216c748-3cc2-4ac1-82f9-100d25fcfa2d.png)

### +320
El elemento se inserta en el nodo 1 entre los numeros "241 y 331" como ya no tiene espacio disponible, ocurre un overflow. Lo que hacemos es mantener los elementos que se encuentran a la izquierda, subir el 320 y crear otro nodo con los elementos a la derecha de donde trendria que haberse insertado el 320.

Cuando subo el 320, tambien tengo overflow en el nodo 2, tengo que subir el elemento que se encuentra en el medio que seria "390" y creo otro nodo con los elementos que se encontraban a la derecha del 320.

![1](https://user-images.githubusercontent.com/55964635/168476748-f387d459-0223-48d0-acef-cb433c64f31a.jpg)

### -390

Se remplaza por el menor elemento del subArbol derecho (en este caso es el 400). No tenemos underflow en la hoja ya que tiene la minima cantidad de elementos.

![resta](https://user-images.githubusercontent.com/55964635/168477005-a58dac78-d3e6-4ac2-9190-491e62066d1e.jpg)


### -400

Se remplaza por el menor elemento del subArbol derecho. TENEMOS UNDERFLOW  

![-400](https://user-images.githubusercontent.com/55964635/168477927-10c49f49-4f0f-4bea-9c8c-8c240987f7ad.jpg)

Como tengo "underflow" intento redistribuir con el hermano ya que tiene mas de la cantidad minima necesaria de elementos para un nodo. Es como mover todos los elementos de derecha a izquierda.

![-400Ulti](https://user-images.githubusercontent.com/55964635/168478189-022a7b84-1029-47b2-aa41-39ab0a0a80f4.jpg)


### -533

Como no puedo redistribuir ya que el hermano izquierdo tiene la minima cantidad de elementos necesarias, tengo que concatenar. Bajo el "508" al nodo "4" y elimino el nodo "5".

![-533](https://user-images.githubusercontent.com/55964635/168478806-610c4e86-d442-4bb9-a3bf-005519beea49.jpg)


</details>





`6)` Dado el siguiente árbol B de orden 4, mostrar cómo quedaría el mismo luego de realizar las siguientes operaciones: +5, +9, +80, +51, -50, -92.

Política de resolución de underflows: derecha.

                        2: 0 (66) 1
    0: (22)(32)(50)                     1: (77) (79) (92)

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

- `+5` se produce overflow en el `nodo 0`, subo el 32, creo otro nodo con el 50 y en el nodo actual dejo el 5 y 22.
- `+9` Como tengo lugar, lo agrego normal en el `nodo 0`
- `+80` se produce overflow en el `nodo 1`, subo el 80, creo otro nodo con el 92 y en el nodo actual dejo el 77 y 79
- `+51` Lo agrego normal
- `-50` Lo borro normal ya que no tengo underflow
- `-92` Lo borro pero tengo underflow, ya que el nodo me queda vacio, utilizamos la `politica de derecha` pero como el `nodo 4` es un nodo de los extremos, se intenta redistribuir con su hermano adyacente izquierdo. Y distribuimos normal ya que el `nodo 1` tiene mas del minimo de elementos necesarios.


![6_recorte](https://user-images.githubusercontent.com/55964635/168481332-2883a802-5172-41f4-88b2-bde4cca0e71f.jpg)

</details>

`7)` Dado el siguiente árbol B de orden 6, mostrar como quedaría el mismo luego de realizar las siguientes operaciones: +15, +71, +3, +48, -56, -71.

Política de resolución de underflows: derecha o izquierda.

`0: (34) (56) (78) (100) (176)`


<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

### +15,+71,+3,+48
![Documento_2022-05-15_134025](https://user-images.githubusercontent.com/55964635/168484085-03a6b9ab-da43-4d13-be0f-2a11739509cc.jpg)

### -56, -71

![restas](https://user-images.githubusercontent.com/55964635/168484751-215b6eab-55dd-46c5-a76b-3982fbcf6d0c.jpg)

</details>

`8)` Dado el siguiente árbol B de orden 5, mostrar como quedaría el mismo luego de realizar las siguientes operaciones: +450, -485, -511, -614.

Política de resolución de underflows: derecha.

                            2: 0 (315) 1 (485) 4 (547) 5 (639) 3
    0: (148)(223)   1: (333)(390)(442)(454)     4: (508)(511)   5: (614)(633)   3: (789)(915)


<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

### +450

![+450](https://user-images.githubusercontent.com/55964635/168486597-0cbbdcec-7561-4e20-8a1f-76bb8aea3666.jpg)

### -485

![-485](https://user-images.githubusercontent.com/55964635/168486899-d4e463cf-d86a-49ab-87b0-e27ad07535b2.jpg)

### -511

![-511](https://user-images.githubusercontent.com/55964635/168487230-12dad83a-65c0-42b3-9211-7451ef0be3b0.jpg)

### -614

![-614](https://user-images.githubusercontent.com/55964635/168488188-0a7ad863-3b57-4b22-a6cb-12d88f8df89e.jpg)

</details>

`9)` Dado un árbol B de orden 5  y con política izquierda, para cada operación dada:

<details >

<summary>Dibuje el árbol resultante</summary><blockquote>
<br/>



![ultima](https://user-images.githubusercontent.com/55964635/168491198-7be1977b-413c-4b27-9a6e-ddab3db437ce.jpg)

</details>

<details >

<summary>Explique las decisiones tomadas</summary><blockquote>
<br/>

- Primero armamos el esquema

![Esquema](https://user-images.githubusercontent.com/55964635/168490362-889514df-45cb-4b47-bbbf-17532b651571.jpg)

- `-76` Lo remplazamos por el elemento minimo del hijo derecho que en este caso es el 100.

![-76](https://user-images.githubusercontent.com/55964635/168490677-be293ac9-c63d-49a7-b4e4-8835e6224781.jpg)

- `-400` le damos de baja, el nodo queda con menor cantidad de elementos de la permitida. Intentamos distribuir con el hermano adyacente izquierdo pero tiene la minima cantidad de elementos. Por ultimo solo nos queda concatenar nodos. (aca tengo que bajar el 300 pero no sabria como es la definicion correcta)
- `+900` Lo agrego al nodo 3 
- `+12` Como el nodo 0 se encuentra lleno (tengo overflow), subo el elemento que se encuentra en el medio que seria el 45 y creo otro nodo con los elementos a la derecha de este.


![ultima](https://user-images.githubusercontent.com/55964635/168491198-7be1977b-413c-4b27-9a6e-ddab3db437ce.jpg)


</details>



<details>

<summary>Escriba las lecturas y escrituras</summary><blockquote>
<br/>
- `-76` L/E : L2,L4,E4,E2
- `-400` L/E : L2, L1, E1, L4,E4
- `+900` L/E : L2, L3, E3
- `+12` L/E: L2, no entendi esta cosa

</details>

```
Operaciones: -76, -400, +900, +12

- nodo 2: 3 i 0(76)4(300)1(600)3
- nodo 0: 4 h(21)(45)(46)(70)
- nodo 4: 2 h(100)(200)
- nodo 1: 1 h(400)
- nodo 3: 2 h(700)(800)
```

`10)` Dada las siguientes operaciones, mostrar la construcción paso a paso de un árbol B de orden 4: +50 , +70, +40, +15, +90, +120, +115, +45, +30, +100, +112, +77, -45, -40, -50, -90, -100.

Política de resolución de underflows: izquierda o derecha.

<details >

<summary>📖 Resolución</summary><blockquote>
<br/>

Em lugar del (6) va el (5) :0

![primeraParte](https://user-images.githubusercontent.com/55964635/168493198-3a9f29e3-f2f3-48a7-bac2-2208a6e48069.jpg)

![segundaParte](https://user-images.githubusercontent.com/55964635/168493833-e6ddf843-507d-4410-a24e-ed8541a7fb2e.jpg)

![3ra](https://user-images.githubusercontent.com/55964635/168494605-9bd7f308-6f6d-41f3-a48d-2f9ebf87dd70.jpg)

![4ta](https://user-images.githubusercontent.com/55964635/168494776-232400c7-5d05-4d22-8715-6cb971704f8c.jpg)

![5ta](https://user-images.githubusercontent.com/55964635/168495245-3d398279-87d3-4477-a50d-ed2cb2b8c33b.jpg)

![6ta](https://user-images.githubusercontent.com/55964635/168495438-087478e9-0ee0-40ab-b4bd-1db2146f7e5f.jpg)

![7ma](https://user-images.githubusercontent.com/55964635/168495606-cdff8d8b-cf22-41ca-9eca-e44f4585d3b7.jpg)

</details>



`11)` Dadas las siguientes operaciones, mostrar la construcción paso a paso de un árbol B de orden 5:

Política de resolución de underflows: izquierda.

`+80, +50, +70, +120, +23, +52, +59, +65, +30, +40, +45, +31, +34, +38, +60, +63, +64, -23, -30, -31, -40, -45, -38.`



<details open>
<summary>📖 Resolución</summary><blockquote>
<br/>

![1](https://user-images.githubusercontent.com/55964635/168496450-ad852502-61ee-4d5e-923f-2789f73e4857.jpg)

![2](https://user-images.githubusercontent.com/55964635/168497245-3c086957-40e5-4cea-a8f6-d55a239c010b.jpg)

![3](https://user-images.githubusercontent.com/55964635/168721529-2efd88b4-700d-4714-904c-ff40af292f0b.jpg)

![4](https://user-images.githubusercontent.com/55964635/168723236-7ba95fc7-1bec-4027-9a16-832263ba4152.jpg)

![5](https://user-images.githubusercontent.com/55964635/168724496-e9b9b73d-e196-4ff2-97b8-1fae95ecf229.jpg)

![6](https://user-images.githubusercontent.com/55964635/168727731-f8ae2dff-613d-42cb-b16f-a446c1c843ee.jpg)

No sabria como restar el `-38`

</details>

`12)` Dado el siguiente árbol B de orden 6, mostrar como quedaría el mismo luego de realizar
las siguientes operaciones: +300, +577, -586, -570, -380, -460.

Política de resolución de underflows: izquierda o derecha

            2: 0 (216) 1 (460) 4 (570) 5 (689) 3 (777) 6

    0: (100)(159)(171)               5: (586)(599)(615)(623)(680)
    1: (222)(256)(358)(380)(423)     3: (703)(725)
    4: (505)(522)                    6: (789)(915)(1000)
    

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`13)` Dada las siguientes operaciones, mostrar cómo se construye el árbol B de orden 4: +65, +89, +23, +45, +20, +96, +10, +55, -23, +110, +50, -10, +25, -50, -45, +120, +130, +70, +75, +73, +100, -120, -110.

Política de resolución de underflows: derecha

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`14)` Dado el siguiente árbol B + de orden 4 y con política de resolución de underflows a derecha, realice las siguientes operaciones indicando lecturas y escrituras en el orden de ocurrencia. Además, debe describir detalladamente lo que sucede en cada operación. +80, -400.


                        4: 0 (340) 1 (400) 2 (500) 3
    0: (11)(50)(77) 1   1: (340)(350)(360) 2    2: (402)(410)(420) 3    3: (520)(530) -1

`15)` Dado el siguiente árbol B+ de orden 4, mostrar como quedaría el mismo luego de
realizar las siguientes operaciones: +120, +110, +52, +70, +15, -45, -52, +22, +19, -66, -22, -19, - 23, -89.

Política de resolución de underflows: derecha.

                     2: 0 (66) 1
    0: (23)(45) 1                   1: (66) (67) (89)

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`16)` Dada las siguientes operaciones, mostrar la construcción paso a paso de un árbol B+ de orden 4:

`+67, +56, +96, +10, +28, +95, +16, +46, +23, +36, +120, +130, +60, +57, -96, -67, -95, -60, -120, -57, -56.`

Política de resolución de underflows: derecha o izquierda.

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`17)` Dada las siguientes operaciones, mostrar la construcción paso a paso de un árbol B+ de orden 6:

`+52, +23, +10, +99, +63, +74, +19, +85, +14, +73, +5, +7, +41, +100, +130, +44, -63, -73, +15, +16, -74, -52.
`

Política de resolución de underflows: izquierda.

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`18)` Dado el siguiente árbol B+ de orden 4, mostrar cómo quedaría definido el árbol luego de realizar las siguientes operaciones: -56, -23, -1.

                    2: 0 (56) 1
    0: (1)(23) 1                  1: (56) (75) (107)

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`19)` Dado un árbol B+ de orden 4  y con política izquierda o derecha, para cada operación dada:

<details>

<summary>a) Dibuje el árbol resultante.</summary><blockquote>
<br/>

</details>

<details>

<summary>b) Explique brevemente las decisiones tomadas.</summary><blockquote>
<br/>

</details>

<details>

<summary>c) Escriba las lecturas y escrituras</summary><blockquote>
<br/>

</details>

```
Operaciones: +4, +44, -94, -104
- nodo 7: 1 i 2(69)6
- nodo 2: 2 i 0(30)1(51)3
- nodo 6: 1 i 4(94)5
- nodo 0: 3 h(5)(10)(20)->1
- nodo 1: 2 h(30)(40)->3
- nodo 3: 2 h(51)(60)->4
- nodo 4: 2 h(69)(80)->5
- nodo 5: 1 h(104)->-1
```

`20)` Dado el árbol B+ que se detalla más abajo, con orden 6, es decir, capacidad de 5 claves como máximo. Muestre los estados sucesivos al realizar la siguiente secuencia de operaciones: +159, -5 y -190, además indicar nodos leídos y escritos en el orden de ocurrencia. Política de resolución underflow derecha.

```
- Nodo 2: 5, i, 0(10)1(60)3(115)4(145)5(179)6
- Nodo 0: 2, h, (1)(5) -> 1
- Nodo 1: 2, h, (34)(44) -> 3
- Nodo 3: 2, h, (60)(113) -> 4
- Nodo 4: 4, h, (120)(125)(131)(139) -> 5
- Nodo 5: 5, h, (145)(153)(158)(160)(177) -> 6
- Nodo 6: 2, h, (179)(190) -> -1
```


<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`21)` Dado un árbol B de orden 5 y con política izquierda o derecha, para cada operación
dada:


<details>

<summary>a) Dibuje el árbol resultante</summary><blockquote>
<br/>

</details>

<details>

<summary>b) Explique detalladamente las decisiones tomadas</summary><blockquote>
<br/>

</details>

<details>

<summary>c) Escriba las lecturas y escrituras</summary><blockquote>
<br/>

</details>


```
Operaciones: +165, +260, +800, -110,

Árbol: Nodo 8: 1 i 2 (150) 7

- Nodo 2: 1 i 0 (120) 3
- Nodo 7: 2 i 4 (210)6(300)1
- Nodo 0: 2 h (30)(110)
- Nodo 3: 1 h (130)
- Nodo 4: 4 h (160)(170)(180)(200)
- Nodo 6: 4 h (220)(230)(240)(250)
- Nodo 1: 4 h (400)(500)(600)(700)
```


`22)` Dado un árbol B+ de orden 5 y con política izquierda o derecha, para cada operación dada:

<details>

<summary>a) Dibuje el árbol resultante</summary><blockquote>
<br/>

</details>

<details>

<summary>b) Explique detalladamente las decisiones tomadas</summary><blockquote>
<br/>

</details>

<details>

<summary>c) Escriba las lecturas y escrituras</summary><blockquote>
<br/>

</details>


```
Operaciones: +250, -300, -40
- Árbol: nodo 8: 1 i 2(70)7
- nodo2:1 i 0(50)4
- nodo7: 4 i 5(90)6(120)3(210)9(300)1
- nodo 0: 1 h(40)->4
- nodo 4: 1 h(50)->5
- nodo 5: 2 h(70)(80)->6
- nodo 6: 2 h(90)(100)->3
- nodo 3: 2 h(120)(200)->9
- nodo 9: 4 h(210)(220)(230)(240)->1
- nodo 1: 2 h(400)(500)-> -1
```

