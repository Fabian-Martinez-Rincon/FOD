<h1 align="center">📂 Archivos</h1>

 <details ><summary >¿Que es un archivo?</summary> <blockquote>

### Motivacion

Los datos que necesitan ser preservados más alla de la ejecución de un argoritmo deben residir en archivos. Para que esto suceda, un archivo no puede residir en la memoria RAM, sino que debe estar en dispositivos de almacenamiento permanente de información. El ejemplo es un disco rígido

### Definición

Un archivo es una estructura homogénea. Estos se caracterizan por el crecimiento y las modificaciones que se efectúan. El crecimiento indica la incorporación de nuevos elementos, y las modificaciones involucran alterar datos contenidos en el archivo, o quitarlos.

</details>



<!--_______________________________________________________-->

<details><summary> ¿Como se organiza? </summary><blockquote>
<br>

Secuencia de Bytes 

- Archivos de texto
- Se leen o recuperan caracteres
- No hay formato previo
- Una palabra se termina por un conjunto de caracteres que termina con blanco. Pero eso es una `convención`

Conjunto de Registros 

- Hay estructura.
- Los registros pueden estar conformados por campos.




</details>

<!--_______________________________________________________-->

<details><summary>¿Que formas de acceso tenemos?</summary><blockquote>
<br>

<details><summary> Secuencial Fisico </summary><blockquote>

El acceso a cada elemento de datos se realiza luego de haber accedido a su inmediato anterior. El recorrido es, entonces, desde el primero hasta el último de los elementos, siguiendo el orden físico de estos.

</blockquote></details>

<details><summary> Secuencial Indizado (Lógico) </summary><blockquote>

El acceso a los elementos es un archivo se realiza teniendo presente algún tipo de organización previa, sin tener en cuenta el orden físico.

### Ejemplo

Suponga que se dispone de un archivo con los nombres de los empleados de una empresa. Los datos de dicho archivo están almacenados en el orden en el cual fueron ingresados; sin embargo, a partir de un acceso secuencial indizado, es posible recuperar los datos en forma ordenada, es decir, como si hubiesen sido ingresados alfabéticamente.

</blockquote></details>

<details><summary> Directo </summary><blockquote>

Es posible recuperar un elemento de datos de un archivo con un solo acceso, conociendo sus características, más allá de que exista un orden físico o lógico predeterminado

</blockquote></details>



</details>

<!--
<details><summary>¿De que tipos disponemos?</summary><blockquote>


- Serie: Cada registro es accesible solo luego de procesar su antecesor, simples de acceder. En archivos (Acceso secuencial)

- Secuencial (los registros): Son accesibles en orden de alguna clave. En Indices y Arboles(Acceso indizado)

- Directo: Se accede al registro deseado. En Hashing (Acceso directo)

</blockquote></details>

</details>-->

<!--_______________________________________________________-->

<details><summary>En los lenguajes de Programación</summary><blockquote>

<details><summary> Archivos Fisicos </summary><blockquote>

x
y
z
</blockquote></details>

<details><summary> Archivos Logicos </summary><blockquote>

x
y
z
</blockquote></details>

</details>

<!--_______________________________________________________-->

<details><summary>¿Que operaciones podemos distinguir?</summary><blockquote><br>

<details><summary>Iniciales </summary><blockquote>

### Definir (assign)

El sistema operativo de la computadora es el responsable de la administración del archivo en disco. El algoritmo utiliza un tipo de datos `file`, que representa el nombre logico. Se debe indicar que el archivo logico se corresponde con el archivo fisico (que es administrado por el SO).

```Pas
program Definir;
type 
    numero = file of integer;    
Var 
    nombre_fisico:string;
    nombre_logico:numero;
begin
    nombre_fisico: 'archivo.data';
    assign (nombre_logico, nombre_fisico);
End.
```
`nombre_logico` es la variable definida por el algoritmo y `nombre_fisico` es una cadena de caracteres que representa el nombre donde quedará (o ya se encuentra) el archivo y el nombre del mismo

### Abrir para operar (reset/rewrite)

Para operar con un archivo desde un algoritmo, se debe realizar la apertura.

```Pas
program Definir;
type 
    numero = file of integer;    
Var 
    nombre_fisico:string;
    nombre_logico:numero;
begin
    nombre_fisico: 'archivo.data';
    assign (nombre_logico, nombre_fisico);
    rewrite(nombre_logico)
    reset(nombre_logico)
End.
```

La operación `rewrite` indica que el archivo va a ser creado y, por lo tanto, la única operación válida sobre el mismo es **escribir** información.

La operación `reset` indica que el archivo ya existe y , por lo tanto, las operaciones válidas sobre el mismo son **lectura/escritura** de información.

### Cierre de archivos

Una vez finalizada la operatoria sobre un archivo, el mismo debe ser cerrado. Cerrar un archivo supone una serie de eventos:

- Transferir definitivamente la información volcada sobre el archivo a disco, es decir, transferir el buffer a disco.

`close(nombre_logico);`

</details>

<details><summary>Basicas</summary><blockquote>

### Lectura y Escritura

```Pas
read(nombre_logico, var_dato);
write(nombre_logico, var_dato);
```
En ambos casos, el **nombre_logico**, es nuestra variable del archivo en donde queremos leer/escribir. La variable **var_dato** y el tipo de dato de los elementos del archivo **nombre_logico** deben coincidir. Además, en caso de que tratemos con registros, no es necesaria la lectura/escritura campo a campo.

</details>

<details><summary>Adicionales</summary><blockquote>

<br>

<details><summary>Controlar el fin</summary>

Para poder recorrer un archivo de datos existente, se debe realizar la lectura de cada uno de sus elementos (Ya que son de acceso secuencial). De esta forma, los datos son obtenidos en el orden en el que fueron ingresados 

</details>

<details><summary>Ir a un lugar especifico</summary>


</details>

<details><summary>Saber la cantidad de registros</summary>


</details>

<details><summary>Saber la posición de trabajo actual</summary>


</details>

</details>

</details>

<!--_______________________________________________________-->

<details><summary>Maestro</summary>


</details>

<details><summary>Corte de Control</summary>


</details>

<details><summary>Merge</summary>


</details>




<!--

## Nested

<details><summary> root </summary><blockquote>

<details><summary> bin </summary><blockquote>

<details><summary> nest1 </summary><blockquote>

~~~
a
b
c
~~~
</blockquote></details>
<details><summary> nest2 </summary><blockquote>

a
b
c
</blockquote></details>

~~~
file1
file2
file3
~~~
</blockquote></details>

<details><summary> boot </summary><blockquote>

x
y
z
</blockquote></details>

<details><summary> dev </summary><blockquote>

p
q
r
</blockquote></details>

<details><summary> etc </summary><blockquote>

e
t
c
</blockquote></details>

<details><summary> home </summary><blockquote>

me
you
everyone
</blockquote></details>

<details><summary> lib </summary><blockquote>

lib
er
ate
</blockquote></details>

</blockquote></details>


</details>

-->

