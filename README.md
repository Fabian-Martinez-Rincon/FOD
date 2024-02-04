<div align="center"> 

[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/Fabian-Martinez-Rincon/FOD)
[![GitHub stars](https://img.shields.io/github/stars/Fabian-Martinez-Rincon/FOD)](https://github.com/Fabian-Martinez-Rincon/FOD/stargazers/)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/Fabian-Martinez-Rincon/FOD)](https://github.com/Fabian-Martinez-Rincon/FOD)


<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=30&duration=1700&pause=800&color=28CDF7&center=true&width=435&lines=FOD"/>
 </div>

</div>


<img src= 'https://i.gifer.com/origin/8c/8cd3f1898255c045143e1da97fbabf10_w200.gif' height="20" width="100%">

<p><img width="250" align='right' src="https://media.giphy.com/media/QxSveBdhdtLgagcKdR/giphy.gif"></p>

- [Resumen teorico](https://inakilapeyre.notion.site/inakilapeyre/Fundamentos-de-Organizaci-n-de-Datos-b2375e1e8e2c441693bb98c470261c69)
- [🧾 Listas](/Documentos/Codigos/Listas.md)
- [📚 Vectores](/Documentos/Codigos/Vectores.md)
- [🌳 Arboles](/Documentos/Codigos/Arboles.md)
- [📁 Archivos](/Documentos/Codigos/Archivos.md)
- [📁 Archivos Parcial](/Documentos/ParArchivos.md)
- [Practica 1](/Documentos/Practicas/Practica1Nueva.md)
- [Practica 2](/Documentos/Practicas/Practica2.md)
- [Practica 3](/Documentos/Practicas/Practica3.md)
- [Practica 4](/Documentos/Practicas/Practica4.md)
- [PARCIALES RESUELTOS DE ARCHIVOS](/Documentos/archivos.md)

</td></tr></table>

<img src= 'https://i.gifer.com/origin/8c/8cd3f1898255c045143e1da97fbabf10_w200.gif' height="20" width="100%">

> [!IMPORTANT]  
> Las justificaciones son en base a mi criterio y tratando de reforsar con el libro (Puede haber errores)


# Finales 

> [!NOTE]  
> Es un recopilatorio de preguntas que estan marcadas por la catedra

- [Archivos](#archivos)
- [Indices]()
- [Arboles]()
- [Hashing]()

> [!TIP]
> Todas las preguntas van a estar justificadas segun el libro [Introducción a las Bases de Datos - Bertone-Thomas](/Introducción%20a%20las%20Bases%20de%20Datos%20-%20Bertone-Thomas.pdf)

## Archivos

> [!IMPORTANT]  
> Siempre se selecciona UNA SOLA respuesta

<table><tr><td>Registro de Longitud Fija</td><td>Registro de Longitud Variable</td></tr>

<tr><td>

- Marca de fin del archivo (EOF)
- Información siempre homogénea
    - Enteros (2bytes)
    - Caracteres (1bytes)
    - Registro (Suma de los campos)
- Altas y Bajas más comodas
- Desperdicio de espacio (en grandes cantidades)
- Lectura y Escritura más rápida

</td><td>

- Marca de fin del archivo (EOF)
- Cada campo debe descomponerse 
    - caracter x caracter
    - cifra x cifra
- Delimitador para Campos # y Registros @ 
- Lectura y Escritura más lenta (de a un caracter)

</td></tr>
</table>


Un archivo con registro de longitud variable

- [ ] a. Puede estar ordenado por algun criterio 
- [ ] b. Debe estar ordenado por algun criterio 
- [ ] c. Nunca puede ordenarse por algun criterio 
- [ ] d. Puede tener un carácter delimitador, por ejemplo & 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>

Algunas de las anteriores

> a, d

</details>

---


Un archivo en el cual se accede a un registro luego de acceder a su predecesor en orden físico 

- [ ] a. puede ser un archivo serie 
- [ ] b. puede ser un archivo secuencial 
- [ ] c. debe ser un archivo serie 
- [ ] d. debe ser un archivo secuencial 
- [ ] e. algunas de las anteriores son correctas 
- [ ] f. ninguna de las anteriores es correcta 

<details><summary>👀 Respuesta</summary>

Debe ser un archivo serie

> Sin ningún orden preestablecido más que el físico, donde, para acceder a un registro determinado, se deben visitar todos los registros previos en el orden en que estos fueron almacenados.

Secuencial es la forma de acceder a un archivo (no un tipo de archivo)

</details>

---

Un archivo con registro de longitud fija 

- [ ] a. Puede tener un delimitador de fin de registro 
- [ ] b. Debe tener un delimitador de fin de registro 
- [ ] c. Puede tener registros del mismo tamaño 
- [ ] d. Puede tener registros con distinto tamaño 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>

La respuesta correcta es: Ninguna de las anteriores 

No es puede tener registros del mismo tamaño, es DEBE tener registros del mismo tamaño (Estricto)

</details>