<h2 align="center">Practica 4 (Arboles 🌳)</h2>



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
    nodo = record
        cant_claves:integer;
        claves: array[1..M-1] of alumnos;
        hijos:array[1..M] of Integer;
    end;
    arbol = file of nodo;
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

`2: 0 (220) 1 (390) 4 (455) 5 (541) 3`

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`0: (10)(150) 1: (225)(241)(331)(360) 4: (400)(407) 5: (508)(533) 3: (690)(823)`

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`6)` Dado el siguiente árbol B de orden 4, mostrar cómo quedaría el mismo luego de realizar las siguientes operaciones: +5, +9, +80, +51, -50, -92.

Política de resolución de underflows: derecha.

                        2: 0 (66) 1
    0: (22)(32)(50)                     1: (77) (79) (92)

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`7)` Dado el siguiente árbol B de orden 6, mostrar como quedaría el mismo luego de realizar las siguientes operaciones: +15, +71, +3, +48, -56, -71.

Política de resolución de underflows: derecha o izquierda.

`0: (34) (56) (78) (100) (176)`

<details>

<summary>📖 Resolución</summary><blockquote>
<br/>

</details>

`8)` Dado el siguiente árbol B de orden 5, mostrar como quedaría el mismo luego de realizar las siguientes operaciones: +450, -485, -511, -614.

Política de resolución de underflows: derecha.

                            2: 0 (315) 1 (485) 4 (547) 5 (639) 3
    0: (148)(223)   1: (333)(390)(442)(454)     4: (508)(511)   5: (614)(633)   3: (789)(915)

`9)` Dado un árbol B de orden 5  y con política izquierda, para cada operación dada:

<details>

<summary>Dibuje el árbol resultante</summary><blockquote>
<br/>

</details>

<details>

<summary>Explique las decisiones tomadas</summary><blockquote>
<br/>

</details>

<details>

<summary>Escriba las lecturas y escrituras</summary><blockquote>
<br/>

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

`11)` Dadas las siguientes operaciones, mostrar la construcción paso a paso de un árbol B de orden 5:

Política de resolución de underflows: izquierda.

`+80, +50, +70, +120, +23, +52, +59, +65, +30, +40, +45, +31, +34, +38, +60, +63, +64, -23, -30, -31, -40, -45, -38.`

`12)` Dado el siguiente árbol B de orden 6, mostrar como quedaría el mismo luego de realizar
las siguientes operaciones: +300, +577, -586, -570, -380, -460.

Política de resolución de underflows: izquierda o derecha

            2: 0 (216) 1 (460) 4 (570) 5 (689) 3 (777) 6

    0: (100)(159)(171)               5: (586)(599)(615)(623)(680)
    1: (222)(256)(358)(380)(423)     3: (703)(725)
    4: (505)(522)                    6: (789)(915)(1000)
    
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