document.write("<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>");
document.write("<script type='text/javascript' src='js/jquery-ui-1.7.2.custom.min.js'></script>");
/*FUNCION QUE HACE EL EFECTO DE TITILACION CUANDO SE QUIERE INSERTAR UN ELEMENTO QUE YA EXISTE EN EL ARBOL*/
function marcarElementoExistente(altura,nodo,posicion){
	 var idElementoExistente=""+altura+nodo+posicion;
	 $("#"+idElementoExistente+"").effect("pulsate",{times:5},500,ejecutarProximaAnimacion);
}


/*FUNCION QUE DEVUELVE LA POSICION REAL DE UN ELEMENTO EN LA PANTALLA (POSICION ABSOLUTA)*/
function position(element) 
{
	if (typeof element == "string")
		element = document.getElementById(element)
	if (!element) 
		return { top:0,left:0 };
	var y = 0;
	var x = 0;
	while (element.offsetParent) 
	{
		x += element.offsetLeft;
		y += element.offsetTop;
		element = element.offsetParent;
	}
	return {top:y,left:x};
}

/*FUNCION QUE ROTULA A LOS NODOS DEL ARBOL CON EL NUEMRO QUE LE CORRESPONDE*/
function rotularNodo(divPadre,posicionContenedor)
{
	var idNodoPadre=divPadre.id;
	contexto.fillStyle= "green";
	contexto.font="bold 11px Arial";
	if(idNodoPadre=="N00")
	{
		var posicionNodo=position(divPadre);
		var coordenadaXNodo=parseFloat(posicionNodo.left)-parseFloat(posicionContenedor.left)-50;
		var coordenadaYNodo=parseFloat(posicionNodo.top)-parseFloat(posicionContenedor.top)+15;		
		contexto.fillText(" Nodo "+divPadre.style.zIndex,coordenadaXNodo,coordenadaYNodo);
	}
	var hijo=divPadre.firstChild.nextSibling;
	for(var x=1;x<=divPadre.childNodes.length-1;x++)
	{
		var posicionNodo=position(hijo);
		var coordenadaXNodo=parseFloat(posicionNodo.left)-parseFloat(posicionContenedor.left)-50;
		var coordenadaYNodo=parseFloat(posicionNodo.top)-parseFloat(posicionContenedor.top)+15;			
		contexto.fillText(" Nodo "+hijo.style.zIndex,coordenadaXNodo,coordenadaYNodo);
		if(hijo.nextSibling!=undefined)
		{
			hijo=hijo.nextSibling;
		}
	}
	
}

/*FUNCION QUE DIBUJA LAS LINEAS ENTRE LOS NODOS UTILIZANDO LA ETIQUETA CANVAS HTML5*/
function dibujarEnlaceEntreNodos(divPadre,posicionContenedor)
{
	if((divPadre.childNodes.length-1) <= ordenGlobal)
	{
			//me quedo con el div que representa a los elementos
			var divElementos=divPadre.firstChild;
			var puntero=divElementos.firstChild;
			var hijo=divPadre.firstChild.nextSibling;
			for(var x=1;x<=divPadre.childNodes.length-1;x++)
			{
					var posicionPuntero=position(puntero);
					var posicionHijo=position(hijo);
					//Dibujo en el contexto del canvas
					var coordenadaXPuntero=parseFloat(posicionPuntero.left)-parseFloat(posicionContenedor.left);
					var coordenadaYPuntero=parseFloat(posicionPuntero.top)-parseFloat(posicionContenedor.top)+30;
					contexto.moveTo(coordenadaXPuntero,coordenadaYPuntero);
	  				var coordenadaXHijo=parseFloat(posicionHijo.left)-parseFloat(posicionContenedor.left)+(parseFloat((anchoTotalNodo/2)));
					var coordenadaYHijo=parseFloat(posicionHijo.top)-parseFloat(posicionContenedor.top);
					contexto.lineTo(coordenadaXHijo,coordenadaYHijo);
					contexto.stroke();
					if(puntero.nextSibling != undefined)
					{
						puntero=puntero.nextSibling.nextSibling;
					}
					if(hijo.nextSibling!=undefined)
					{
						hijo=hijo.nextSibling;
					}
			}
	}else
	{
			//me quedo con el div que representa a los elementos
			var divElementos=divPadre.firstChild;
			var puntero=divElementos.firstChild;
			var hijo=divPadre.firstChild.nextSibling;
			for(var x=1;x<=divPadre.childNodes.length-2;x++)
			{
					var posicionPuntero=position(puntero);
					var posicionHijo=position(hijo);
					//Dibujo en el contexto del canvas
					var coordenadaXPuntero=parseFloat(posicionPuntero.left)-parseFloat(posicionContenedor.left);
					var coordenadaYPuntero=parseFloat(posicionPuntero.top)-parseFloat(posicionContenedor.top)+30;
					contexto.moveTo(coordenadaXPuntero,coordenadaYPuntero);
	  				var coordenadaXHijo=parseFloat(posicionHijo.left)-parseFloat(posicionContenedor.left)+parseFloat((anchoTotalNodo/2));
					var coordenadaYHijo=parseFloat(posicionHijo.top)-parseFloat(posicionContenedor.top);
					contexto.lineTo(coordenadaXHijo,coordenadaYHijo);
					contexto.stroke();
					if(puntero.nextSibling != undefined)
					{
						puntero=puntero.nextSibling.nextSibling;
					}
					if(hijo.nextSibling!=undefined)
					{
						hijo=hijo.nextSibling;
					}
			}
	}		
}

/*FUNCION QUE DIBUJA LAS LINEAS ENTRE LOS NODOS UTILIZANDO CANVAS HTML5*/
function dibujarEnlaces()
{
	divCanvas.width =divCanvas.width;
	var container=document.getElementById("contenedor");
	var posicionContenedor=position(container);
	contexto.beginPath();
	$("#contenedor").find("div").each(function(i){
			var idActual=$(this).attr("id");
			var primerPos=idActual[0];
			if(primerPos=="N")
			{
				//me quedo con el div padre
				var divPadre=document.getElementById(idActual);
				rotularNodo(divPadre,posicionContenedor);
				if(divPadre.childNodes.length > 1)//el nodo tiene hijos
				{
					dibujarEnlaceEntreNodos(divPadre,posicionContenedor);	
				}
			}
     })
	contexto.closePath();
	//habilito los botones de operaciones
	habilitarBotones();
	ejecutarProximaAnimacion();
}

/*FUNCION QUE BORRA LAS LINEAS DEL ARBOL REINICIANDO EL CANVAS - MODIFICANDO EL WIDTH SE REINICIA EL CANVAS*/
function borrarEnlaces()
{
	divCanvas.width=divCanvas.width;
}


/*FUNCION QUE MUESTRA EN EL HISTORIAL EL MENSAJE RECIBIDO COMO PARAMETRO*/
function mostrarMensajeOperacion(mensaje)
{
	var divExplicacion=document.getElementById('explicacionHistorial');
	if(divExplicacion.hasChildNodes())
	{
		var primerExplicacion=divExplicacion.firstChild;
		var parrafoNuevo=document.createElement('p');
		parrafoNuevo.appendChild(document.createTextNode(mensaje));
		divExplicacion.insertBefore(parrafoNuevo,primerExplicacion);
	}else
	{
		var parrafoNuevo=document.createElement('p');
		parrafoNuevo.appendChild(document.createTextNode(mensaje));
		divExplicacion.appendChild(parrafoNuevo);
	}
}


/*FUNCION QUE MARCA EL CAMINO HACIA UN ELEMENTO CAMBIANDO DE COLOR CADA ELEMENTO E INDICANDO SI SE MUEVE A DERECHA O IZQUIERDA EN FUNCION DE SI EL ELEMENTO ES MAYOR O MENOS AL ELEMENTO EN QUE SE ENCUENTRA EN UN MOMENTO DADO LA BUSQUEDA*/
function marcarCaminoBusqueda(elemento,ultimoElemento,existeElemento)
{
	for(var x=0;x<=vectorCamino.length;x++)
	{
		var idNodoAMarcar=vectorCamino[x];
		var nodoAMarcar=document.getElementById(idNodoAMarcar);
		if(nodoAMarcar!=undefined)
		{
			if(nodoAMarcar.hasChildNodes())
			{
					if(nodoAMarcar.firstChild.nodeValue==elemento)
					{								  
						nodoAMarcar.style.backgroundColor='#3CC';
						$("#"+idNodoAMarcar+"").effect("pulsate",{times:5});
					}else
					{
						if(nodoAMarcar.firstChild.nodeValue < elemento)
						{
							if(existeElemento==true)
							{
								nodoAMarcar.style.backgroundColor='#3CC';
							}else
							{
								if(nodoAMarcar.firstChild.nodeValue==ultimoElemento)
								{
									nodoAMarcar.style.backgroundColor='#F9F';
								}else
								{
									nodoAMarcar.style.backgroundColor='#F9F';
								}
							}
						}else
						{
							if(existeElemento==true)
							{
								nodoAMarcar.style.backgroundColor='#3CC';
							}else
							{
				    			if(nodoAMarcar.firstChild.nodeValue==ultimoElemento)
								{
									nodoAMarcar.style.backgroundColor='#F9F';
								}else
								{
									nodoAMarcar.style.backgroundColor='#F9F';
								}
							}
						}
					}
				}
			}
		}
}

/*FUNCION QUE VUELVE EL ARBOL AL ESTADO ANTERIOR A REALIZAR UNA BUSQUEDA, RESETENADO LOS COLORES Y ELIMINANDO LAS EXPLICACIONES INCORPORADAS EN FUNCION MARCARCAMINODEBUSQUEDA*/
function rollBack()
{
	var longitudVector=vectorCamino.length;
	for(var x=0;x<=longitudVector;x++)
	{
		var idNodoAMarcar=vectorCamino[x]
		var nodoAMarcar=document.getElementById(idNodoAMarcar);
		if(nodoAMarcar!=undefined)
		{	
			nodoAMarcar.style.backgroundColor='#D1DFDE';
		}	
	}
	for(var i=0;i<=longitudVector;i++)
	{
		vectorCamino[i]=null;
		vectorCamino.length=0;
	}
	var divExplicacionBusqueda=document.getElementById("explicacionBusqueda");
	divExplicacionBusqueda.removeChild(divExplicacionBusqueda.lastChild);
}

/*FUNCION QUE MUESTRA LA CREACION DEL ARBOL EN FUNCION DEL ORDEN QUE LLEGA COMO PARAMETRO CREANDO UN ARBOL VACIO PREPARADO PARA PODER EMPEZAR A INSERTAR, BORRAR Y BUSCAR ELEMENTOS*/
function crearArbol(orden,maxElementos)
{
	
	vectorNumeracion=new Array();//vector utilizado para almacenar los numeros de nodos a reutilizar
	contadorNumeroNodo=0;
	/*seteo la variable global que representa el ancho total de un nodo*/
	anchoTotalNodo=(anchoElemento*maxElementos)+(anchoPuntero*(maxElementos+1));
	/*creo el div que me representa el nodo raiz*/
	var divNodo=document.createElement('div');
	divNodo.id='N00';
	divNodo.style.position='relative';
	divNodo.style.zIndex=contadorNumeroNodo;//utilizo el zindex solo para guardar el numero de nodo	
	divNodo.style.width=anchoTotalNodo+170;
	/*creo el div que me representa el conjunto de elmentos de la raiz*/
	var divElementos=document.createElement('div');
	divElementos.id="E00";
	divNodo.appendChild(divElementos);
	/*creo los divs que representan los punteros y los elementos*/
	for(var x=0;x<=maxElementos-1;x++)
	{
		var divPuntero=document.createElement('div');
		divPuntero.id='P00'+x;
		divPuntero.style.width=anchoPuntero;
		divPuntero.style.height=30;
		divPuntero.className='puntero';	
		divPuntero.style.position='relative';
		divPuntero.style.cssFloat='left';
		divElementos.appendChild(divPuntero);
		var elementoNuevo=document.createElement('div');
		elementoNuevo.className="elemento";
		elementoNuevo.id='00'+x;
		elementoNuevo.style.width=anchoElemento;
		elementoNuevo.style.height=25;
		elementoNuevo.style.backgroundColor=color_nodo;
		elementoNuevo.style.color=color_texto_nodo;
		elementoNuevo.style.border=borde_elemento;
		elementoNuevo.style.position='relative';
		elementoNuevo.style.cssFloat='left';
		divElementos.appendChild(elementoNuevo);	
	}
	/*creo el ultimo puntero*/
	divPuntero=document.createElement('div');
	divPuntero.id='P00'+x;
	divPuntero.style.width=anchoPuntero;
	divPuntero.style.height=30;
	divPuntero.className='puntero';	
	divPuntero.style.position='relative';
	divPuntero.style.cssFloat='left';
	divElementos.appendChild(divPuntero);
	var contenedor=document.getElementById('contenedor');
	contenedor.style.width=(anchoTotalNodo*3)+500;
	contenedor.appendChild(divNodo);
	var movimientoArbol=(2*anchoTotalNodo)+(2*anchoElemento);
	$('#N00').animate({top:0, left:movimientoArbol},1250,function(){//rotulo raiz con numero Nodo 0
																	contexto.beginPath();
																	contexto.fillStyle= "green";
																	contexto.font="bold 11px Arial";
																	var posicionNodo=position(divNodo);
																	var container=document.getElementById("contenedor");
																	var posicionContenedor=position(container);
																	var coordenadaXNodo=parseFloat(posicionNodo.left)-parseFloat(posicionContenedor.left)-50;
																	var coordenadaYNodo=parseFloat(posicionNodo.top)-parseFloat(posicionContenedor.top)+15;		
																	contexto.fillText(" Nodo 0",coordenadaXNodo,coordenadaYNodo);
																	contadorNumeroNodo++;
																	ejecutarProximaAnimacion();
																	});
	
	
}

/*FUNCION QUE MUESTRA LA INSERCION DE UN ELEMENTO SIN PRODUCIRSE OVERFLOW*/
function insertarSinOverFlow(altura,nodo,posicion,elemento)
{
	/*me quedo con el div donde hay que insertar el elementos*/
	var idInsercion=""+altura+nodo+posicion;
	var divInsercion=document.getElementById(idInsercion);
	if(divInsercion.hasChildNodes())
	{
		ordenarNodo(altura,nodo,elemento);
	}else
	{
		divInsercion.appendChild(document.createTextNode(elemento));
	}
	var idNodo="N"+altura+nodo;
	var nodoMensaje=document.getElementById(idNodo);
	var numeroNodoAMostrar=parseFloat(nodoMensaje.style.zIndex);
	var mensaje="- Inserci\u00f3n  elemento "+elemento+" en el nodo "+numeroNodoAMostrar;
	mostrarMensajeOperacion(mensaje);
}


/*FUNCION QUE ORDENA LOS ELEMENTOS DENTRO DE UN NODO (OBVIAMENTE ORDEN MENOR A MAYOR)*/
function ordenarNodo(altura,pos,elemento)
{
	for(var x=0;x<=maxElementos-1;x++)
	{
		var idPosicion=""+altura+pos+x;
		var posicion=document.getElementById(idPosicion);
		if(posicion.hasChildNodes())
		{
			if(parseInt(elemento) < parseInt(posicion.firstChild.nodeValue))
			{
				var elementoAuxiliar=posicion.firstChild.nodeValue;
				posicion.removeChild(posicion.firstChild);
				posicion.appendChild(document.createTextNode(elemento));
				elemento=elementoAuxiliar;
			}
		}else
		{
			if(elemento!=undefined)
			{
				posicion.appendChild(document.createTextNode(elemento));
				elemento=undefined;
			}
		}
	}
}


/*FUNCION QUE INSERTA EL ULTIMO ELEMENTO QUE PRODUCE OVERFLOW HACIENDO TITILAR TODO EL NODO QUE ENTRA EN OVERFLOW*/
function insertarConOverflow(altura,nodo,posicion,elemento)
{
	deshabilitarBotones();
	/*me quedo con el div que representa el nodo*/
	var idNodoAInsertar="E"+altura+nodo;
	var nodoAInsertar=document.getElementById(idNodoAInsertar);
	/*me quedo con el elemento mas grande del nodo*/
	var ultimoPuntero=nodoAInsertar.lastChild;
	var numeroMasGrande=ultimoPuntero.previousSibling.lastChild.nodeValue;
	/*creo el div que me hara desbordar el nodo*/
	if(elemento < numeroMasGrande)
	{
		elementoNuevoDiv=numeroMasGrande;
	}else
	{
		elementoNuevoDiv=elemento;
	}
	ordenarNodo(altura,nodo,elemento);
	var nuevoDiv=document.createElement('div');
	nuevoDiv.className="elemento";
	nuevoDiv.id='desborde';
	nuevoDiv.style.width=anchoElemento;
	nuevoDiv.style.height=25;
	nuevoDiv.style.backgroundColor=color_nodo;
nuevoDiv.style.color=color_texto_nodo;
	nuevoDiv.style.border=borde_elemento;
	nuevoDiv.style.position='relative';
	nuevoDiv.style.cssFloat='left';
	nuevoDiv.appendChild(document.createTextNode(elementoNuevoDiv));
	nodoAInsertar.appendChild(nuevoDiv);
	/*function que marca el el grafico que el nodo esta desbordado*/
	efectoTitilacion(idNodoAInsertar);
}


/*FUNCION QUE HACE TITILAR EL ELEMENTO CON ID IGUAL A IDNODOATITILAR*/
function efectoTitilacion(idNodoATitilar)
{
	$("#"+idNodoATitilar+"").effect("pulsate",{times:5},700,ejecutarProximaAnimacion);
}


/*FUNCION QUE MUESTRA EN EL GRAFICO CUANDO SE PARTE LA RAIZ DEL ARBOL POR EFECTO DE UN SOBREFLUJO*/
function partirRaiz(elementoAPromocionar)
{
	borrarEnlaces();
	//me quedo con el nodo raiz
	var nodoRaiz=document.getElementById('N00');
	//guardo el numero de la raiz para reutilizar
	vectorNumeracion.push(parseFloat(nodoRaiz.style.zIndex));
	vectorNumeracion.sort(function(a,b){return a-b;});
	/*si la raiz tiene hijos debo bajar su altura para darle lugar a los nuevos nodos que nacen por la division de la raiz*/
	if(nodoRaiz.childNodes.length > 1) //la raiz tiene hijos
	{
	    	//modifico los id de todos los nodos que se encuentran en el nivel 1 y los paso al nivel 2 del arbol
			var nodoAModificar=nodoRaiz.firstChild.nextSibling;
			for(var i=0;i<=nodoRaiz.childNodes.length-2;i++)
			{
				modificarAlturaHijosRaiz(nodoAModificar);
				nodoAModificar=nodoAModificar.nextSibling;
			}
			/*creo el nodo izquierdo*/
			var numeroNodo="N10";
			var nuevoTop=alturaEntreNodos;
			var posIzquierda=(anchoElemento+anchoPuntero+(maxElementos*30)+((maxElementos+1)*20));
			var nuevoLeftIzquierdo=-posIzquierda;
			crearNuevoNodo(numeroNodo,nuevoTop,nuevoLeftIzquierdo,"izquierdo");
			/*creo el nodo derecho*/
			numeroNodo="N11";
			nuevoTop=alturaEntreNodos;
			nuevoLeftDerecho=(anchoElemento+anchoPuntero+(maxElementos*30)+((maxElementos+1)*20));
			crearNuevoNodo(numeroNodo,nuevoTop,nuevoLeftDerecho,"derecho");
			/*distribuyo los hijos de la raiz entre los dos nuevos nodos creado*/
			distribuirHijos('N00','N10','N11',elementoAPromocionar);
			/*distribuyo los elementos del nodo desbordado a ambos nodos creados*/
			distribuirElementos("E00","E10","E11",elementoAPromocionar);
			centrarHijosEnFuncionAPadre("N10");
			centrarHijosEnFuncionAPadre("N11");
			setTimeout("centrarHijosEnFuncionAPadre('N00')",3500);
			setTimeout("finalizarDistribucion('E00','E10','E11',elementoAPromocionar)",velocidad_transicion);	
	}else
	{
		
		/*creo el nodo izquierdo*/
		var numeroNodo="N10";
		var nuevoTop=alturaEntreNodos;
		var posIzquierda=(anchoElemento+anchoPuntero+(maxElementos*30)+((maxElementos+1)*20));
		var nuevoLeft=-posIzquierda;
		crearNuevoNodo(numeroNodo,nuevoTop,nuevoLeft,"izquierdo");
		/*creo el nodo derecho*/
		numeroNodo="N11";
		nuevoTop=alturaEntreNodos;
		nuevoLeft=(anchoElemento+anchoPuntero+(maxElementos*30)+((maxElementos+1)*20));
		/*distribuyo los elementos del nodo desbordado a ambos nodos creados*/
		crearNuevoNodo(numeroNodo,nuevoTop,nuevoLeft,"derecho");
		distribuirElementos("E00","E10","E11",elementoAPromocionar);
		centrarHijosEnFuncionAPadre("N00");
		setTimeout("finalizarDistribucion('E00','E10','E11',elementoAPromocionar)",velocidad_transicion);
	}
	if(vectorNumeracion.length == 0)
	{
		nodoRaiz.style.zIndex=contadorNumeroNodo;
		contadorNumeroNodo++;
	}else
	{
		var rotulo=vectorNumeracion.shift();
		nodoRaiz.style.zIndex=rotulo;
	}
	var mensaje="- Divisi\u00f3n de la ra\u00edz, aumento de altura";
	mostrarMensajeOperacion(mensaje);
}



/*FUNCION QUE RETORNA LA CANTIDAD DE NODOS HOJAS QUE CUELGAN DEL NODO QUE LLEGA COMO PARAMETRO*/
function calcularCantidadHijosRama(rama)
{
	var cantidadHijos=0;
	var id=rama.id;
	$("#"+id).find("div").each(function(i){
			var idActual=$(this).attr("id");
			var primerPosicion=idActual[0];
			if(primerPosicion=="N")
			{
				var divParcial=document.getElementById(idActual);
				if(divParcial.childNodes.length == 1)
				{
					cantidadHijos=cantidadHijos +1;
				}
			}
        });
	return cantidadHijos;
}



/*FUNCION QUE DECREMENTA LA ALTURA DEL NODO QUE LLEGA COMO PARAMETRO Y TODOS SUS HIJOS. LA ALTURA ES EL PRIMER DIGITO DEL ID DE CADA ELEMENTO QUE REPRESENTA UN NODO*/
function decrementarAltura(nodo)
{
	var idNodo=nodo.id;
	var alturaActual=idNodo[1];
	var alturaDecrementada=parseInt(alturaActual)-1;
	nodo.id="N"+alturaDecrementada+idNodo.substr(2,idNodo.length-2);
	idNodo=nodo.id;
	$("#"+idNodo).find("div").each(function(i){
			var idActual=$(this).attr("id");
			var primerPos=idActual[0];
			if(primerPos=="E")
			{
				var alturaElemento=idActual[1];
				var alturaElementoDecrementada=parseInt(alturaElemento)-1;
				var valor="E"+alturaElementoDecrementada+idActual.substr(2,idActual.length-2);
				$(this).attr("id",valor);
			}else
			{
				if(primerPos=="P")
				{
					var alturaPuntero=idActual[1];
					var alturaPunteroDecrementada=parseInt(alturaPuntero)-1;
					var valor="P"+alturaPunteroDecrementada+idActual.substr(2,idActual.length-3)+idActual.substr(idActual.length-1);
					$(this).attr("id",valor);
				}else
				{
					if(primerPos=="N")
					{
						var alturaActual=idActual[1];
						var alturaDecrementada=parseInt(alturaActual)-1;
						var valor="N"+alturaDecrementada+idActual.substr(2,idActual.length-2);
						$(this).attr("id",valor);
					}else
					{
						var alturaContenido=idActual[0];
						var alturaContenidoDecrementada=parseInt(alturaContenido)-1;
						var valor=alturaContenidoDecrementada+idActual.substr(1,idActual.length-2)+idActual.substr(idActual.length-1);
						$(this).attr("id",valor);
					}
				}
			}
        })
}

/*FUNCION QUE PONE EN 2 LA ALTURA DE TODOS LOS NODOS QUE SE ENCONTRABAN EN EL NIVEL 1 - RECORDAR QUE LA ALTURA ESTA INDICADA EN EL PRIMER DIGITO DEL ID DE CADA NODO*/
function modificarAlturaHijosRaiz(nodo)
{
	var idNodo=nodo.id;
	var alturaActual=idNodo[1];
	var alturaIncrementada=parseInt(alturaActual)+1;
	nodo.id="N"+alturaIncrementada+idNodo.substr(2,idNodo.length-2);
	idNodo=nodo.id;
	$("#"+idNodo).find("div").each(function(i){
			var idActual=$(this).attr("id");
			var primerPos=idActual[0];
			if(primerPos=="E")
			{
				var alturaElemento=idActual[1];
				var alturaElementoIncrementada=parseInt(alturaElemento)+1;
				var valor="E"+alturaElementoIncrementada+idActual.substr(2,idActual.length-2);
				$(this).attr("id",valor);
			}else
			{
				if(primerPos=="P")
				{
					var alturaPuntero=idActual[1];
					var alturaPunteroIncrementada=parseInt(alturaPuntero)+1;
					var valor="P"+alturaPunteroIncrementada+idActual.substr(2,idActual.length-3)+idActual.substr(idActual.length-1);
					$(this).attr("id",valor);
				}else
				{
					if(primerPos=="N")
					{
						var alturaActual=idActual[1];
						var alturaIncrementada=parseInt(alturaActual)+1;
						var valor="N"+alturaIncrementada+idActual.substr(2,idActual.length-2);
						$(this).attr("id",valor);
					}else
					{
						var alturaContenido=idActual[0];
						var alturaContenidoIncrementada=parseInt(alturaContenido)+1;
						var valor=alturaContenidoIncrementada+idActual.substr(1,idActual.length-2)+idActual.substr(idActual.length-1);
						$(this).attr("id",valor);
					}
				}
			}
        })
}


/*FUNCION QUE CREA UN NUEVO DIV QUE REPRESENTA UN NUEVO NODO EN EL ARBOL*/
function crearNuevoNodo(numeroNodo,nuevoTop,nuevoLeft,posicionNodo)
{
	/*me quedo con el div padre*/
	var divPadre=document.getElementById('N00');
	/*creo el div que me representa el nodo*/
	var divNuevoNodo=document.createElement('div');
	divNuevoNodo.id=numeroNodo;
	if(vectorNumeracion.length == 0)
	{
			divNuevoNodo.style.zIndex=contadorNumeroNodo;//utilizo el zindex solo para guardar el numero de nodo	
			contadorNumeroNodo++;
	}else
	{
			var rotulo=vectorNumeracion.shift();
			divNuevoNodo.style.zIndex=rotulo;
	}
	divNuevoNodo.style.position='absolute';
	divNuevoNodo.style.height=30;
	divNuevoNodo.style.width=anchoTotalNodo+170;;
	/*creo el div que me representa el conjunto de elmentos del nodo*/
	var divElementos=document.createElement('div');
	divElementos.id="E"+numeroNodo[1]+numeroNodo[2];
	/*creo los divs que representan los punteros y los elementos*/
	for(var x=0;x<=maxElementos-1;x++)
	{
		var divPuntero=document.createElement('div');
		divPuntero.id='P'+numeroNodo[1]+numeroNodo[2]+x;
		divPuntero.style.width=anchoPuntero;
		divPuntero.style.height=30;
		divPuntero.className='puntero';	
		divPuntero.style.cssFloat='left';
		divElementos.appendChild(divPuntero);
		var elementoNuevo=document.createElement('div');
		elementoNuevo.className="elemento";
		elementoNuevo.id=''+numeroNodo[1]+numeroNodo[2]+x;
		elementoNuevo.style.width=anchoElemento;
		elementoNuevo.style.height=25;
		elementoNuevo.style.backgroundColor=color_nodo;
		elementoNuevo.style.color=color_texto_nodo;
		elementoNuevo.style.border=borde_elemento;
		elementoNuevo.style.cssFloat='left';
		divElementos.appendChild(elementoNuevo);	
	}
	/*creo el ultimo puntero*/
	divPuntero=document.createElement('div');
	divPuntero.id='P'+numeroNodo[1]+numeroNodo[2]+x;
	divPuntero.style.width=anchoPuntero;
	divPuntero.style.height=30;
	divPuntero.className='puntero';	
	divPuntero.style.cssFloat='left';
	divElementos.appendChild(divPuntero);
	/*creo un div que indica la explicacion de la creacion del nodo*/
	var divExplicacion=document.createElement('div');
	divExplicacion.style.backgroundColor=color_explicacion_nuevo_nodo;
	divExplicacion.style.border=borde_explicacion_nuevo_nodo;
	divExplicacion.style.width=120;
	divExplicacion.appendChild(document.createTextNode("Nuevo Nodo"));
	if(posicionNodo=="izquierdo")
	{
		divExplicacion.id="explicacionNuevoNodoIzquierdo";
	}else
	{
		divExplicacion.id="explicacionNuevoNodoDerecho";
	}
	divElementos.appendChild(divExplicacion);
	divNuevoNodo.appendChild(divElementos);
	divPadre.appendChild(divNuevoNodo);
	$('#'+numeroNodo).animate({top:nuevoTop, left:nuevoLeft},1250);
	
}

/*FUNCION QUE DISTRIBUYE LOS ELEMENTOS DE UN NODO A 2 NUEVOS NODOS CUYO ID LLEGA COMO PARAMETRO*/
function distribuirElementos(idNodoOverFlow,idNodoIzquierdo,idNodoDerecho,elementoAPromocionar)
{
	/*me quedo con el nodo que desbordo*/
	var nodoOverFlow=document.getElementById(idNodoOverFlow);
	/*me quedo con el nodo izquierdo*/
	var nodoIzquierdo=document.getElementById(idNodoIzquierdo);
	var divParcialIzquierdo=nodoIzquierdo.firstChild.nextSibling;
	/*me quedo con el nodo derecho*/
	var nodoDerecho=document.getElementById(idNodoDerecho);
	var divParcialDerecho=nodoDerecho.firstChild.nextSibling;
	var divParcial=nodoOverFlow.firstChild;
	for(var x=0;x<=nodoOverFlow.childNodes.length-1;x++)
	{
		if(divParcial.hasChildNodes())
		{
			if(divParcial.firstChild.nodeValue < elementoAPromocionar)
			{
				divParcial.style.backgroundColor=color_division_izquierda;
				divParcialIzquierdo.style.backgroundColor=color_division_izquierda;
				divParcialIzquierdo.appendChild(document.createTextNode(divParcial.firstChild.nodeValue));
				divParcialIzquierdo=divParcialIzquierdo.nextSibling.nextSibling;
			}else
			{
				if(divParcial.firstChild.nodeValue > elementoAPromocionar)
				{
					divParcial.style.backgroundColor=color_division_derecha;
					divParcialDerecho.style.backgroundColor=color_division_derecha;
					divParcialDerecho.appendChild(document.createTextNode(divParcial.firstChild.nodeValue));
					divParcialDerecho=divParcialDerecho.nextSibling.nextSibling;
				}
			}
		}
		divParcial=divParcial.nextSibling;
	}
}


/*FUNCION QUE BORRA LAS EXPLICACIONES AGREGADAS EN EL EFECTO DE PARTIR RAIZ. SE FINALIZA EL PARTIR RAIZ Y SE DEJA EL ARBOL PREPARADO PARA LA PROXIMA OPERACION A REALIZAR*/
function finalizarDistribucion(idNodoOverFlow,idNodoIzquierdo,idNodoDerecho,elementoAPromocionar)
{
	/*me quedo con el nodo que desbordo*/
	var nodoOverFlow=document.getElementById(idNodoOverFlow);
	/*me quedo con el nodo izquierdo*/
	var nodoIzquierdo=document.getElementById(idNodoIzquierdo);
	var divParcialIzquierdo=nodoIzquierdo.firstChild.nextSibling;
	/*me quedo con el nodo derecho*/
	var nodoDerecho=document.getElementById(idNodoDerecho);
	var divParcialDerecho=nodoDerecho.firstChild.nextSibling;
	var divParcial=nodoOverFlow.firstChild;
	for(var x=0;x<=nodoOverFlow.childNodes.length-1;x++)
	{
		if(divParcial.hasChildNodes())
		{
			if(divParcial.firstChild.nodeValue < elementoAPromocionar)
			{
				divParcial.style.backgroundColor=color_nodo;
				divParcialIzquierdo.style.backgroundColor=color_nodo;
				divParcial.removeChild(divParcial.firstChild);
				divParcialIzquierdo=divParcialIzquierdo.nextSibling.nextSibling;
			}else
			{
				if(divParcial.firstChild.nodeValue > elementoAPromocionar)
				{
					divParcial.style.backgroundColor=color_nodo;
					divParcialDerecho.style.backgroundColor=color_nodo;
					divParcial.removeChild(divParcial.firstChild);
					divParcialDerecho=divParcialDerecho.nextSibling.nextSibling;
				}else
				{
					divParcial.removeChild(divParcial.firstChild);
					}
			}
		}
		divParcial=divParcial.nextSibling;
	}
	/*reacomodo el elemento que pasa a ser separador*/
	nodoOverFlow.firstChild.nextSibling.appendChild(document.createTextNode(elementoAPromocionar));
	/*borro los elementos de explicacion*/
	var divElementoOverFlow=document.getElementById('desborde');
	nodoOverFlow.removeChild(divElementoOverFlow);
	var divNuevoNodoIzquierdo=document.getElementById('explicacionNuevoNodoIzquierdo');
	nodoIzquierdo.removeChild(divNuevoNodoIzquierdo);
	var divNuevoNodoDerecho=document.getElementById('explicacionNuevoNodoDerecho');
	nodoDerecho.removeChild(divNuevoNodoDerecho);
	var terminoMoverParaScroll=moverArbolParaScroll();
	var botonInsertar=document.getElementById("insertar");
	
}

/*FUNCION QUE MUESTRA CUANDO SE CREAN DOS NUEVOS NODOS POR UN DESBORDE*/
function partirNodo(altura,nodo,posicionAPromocionar,elementoAPromocionar,posicionPadre,vuelta)
{
	borrarEnlaces();
	/*me quedo con el nodo desbordado*/
	 idNodoDesbordado="E"+altura+nodo;
	/*modifico los id de los nodos que se encuentran a la altura del nodo desbordado por la creacion de los nuevos nodos*/
	divNodoDesbordado=document.getElementById(idNodoDesbordado);
	numeroNodoDesbordado=idNodoDesbordado;
	numeroNodoDesbordado=parseInt(numeroNodoDesbordado.substr(2,numeroNodoDesbordado.length-2));
	//incremento el id de todos los hermanos mayores al nodo derecho creado por la division
	incrementarIdDivsHermanos(numeroNodoDesbordado,altura);
	/*me quedo con el div que engloba al nodo desbordado*/
	 divEnglobaDesbordado=divNodoDesbordado.parentNode;
	 idDivEnglobaDesbordado=divEnglobaDesbordado.id;
	 divPadreNodoDesbordado=divNodoDesbordado.parentNode.parentNode;
	/*cambio todos los id del nodo que se parte en dos y todos sus hijos*/
	divEnglobaDesbordado.id=idDivEnglobaDesbordado+"Provisorio";
	divNodoDesbordado.id=idNodoDesbordado+"Provisorio";
	divProvisorio=divNodoDesbordado.firstChild;
	for(var x=0;x<=divNodoDesbordado.childNodes.length-1;x++)
	{
		divProvisorio.id=divProvisorio.id+"Provisorio";
		divProvisorio=divProvisorio.nextSibling;
	}
	/*me quedo con el div que engloba el nodo desbordado provisorio*/
	 divEnglobaDesbordadoProvisorio=document.getElementById(idNodoDesbordado+"Provisorio");
	/*creo los dos divs que me representan la division*/
	/*creo el nodo izquierdo*/
	 numeroNodo=idNodoDesbordado;
	 ancho=((maxElementos/2)*anchoElemento) + ((maxElementos/2)*anchoPuntero)+anchoPuntero;
	 nuevoLeftIzquierdo=-ancho;
	 nuevoTop=35;
	crearNuevoNodoDivision(numeroNodo,nuevoTop,nuevoLeftIzquierdo,"izquierdo",idNodoDesbordado+"Provisorio",idDivEnglobaDesbordado+"Provisorio",idDivEnglobaDesbordado);
	/*creo el nodo derecho*/
	 proximoNodo=nodo+1;
	idEnglobaDesbordadoDerecho="N"+altura+proximoNodo;
	 nuevoTopDerecho=35;
	 nuevoLeftDerecho=((maxElementos/2)*anchoElemento) + ((maxElementos/2)*anchoPuntero)+anchoElemento+2*anchoPuntero;
	crearNuevoNodoDivision(numeroNodo,nuevoTopDerecho,nuevoLeftDerecho,"derecho",idNodoDesbordado+"Provisorio",idDivEnglobaDesbordado+"Provisorio",idEnglobaDesbordadoDerecho);
	/*distribuyo los elementos del nodo que desbordo a los nuevos nodos crados por la division*/
	 idDivEnglobaDesbordadoParametro="E"+idEnglobaDesbordadoDerecho[1]+idEnglobaDesbordadoDerecho.substr(2,idEnglobaDesbordadoDerecho.length-2);
	distribuirElementos(idNodoDesbordado+"Provisorio",idNodoDesbordado,idDivEnglobaDesbordadoParametro,elementoAPromocionar);	
	/*distribuyo los hijos del nodo desbordado si tiene*/
	if(divEnglobaDesbordadoProvisorio.childNodes.length > 3)
	{
		if(altura==0)
		{
			distribuirHijos(idDivEnglobaDesbordado,idNodoDesbordado,idEnglobaDesbordadoDerecho,elementoAPromocionar);
			
		}else
		{
			distribuirHijos(idDivEnglobaDesbordado+"Provisorio",idDivEnglobaDesbordado,idEnglobaDesbordadoDerecho,elementoAPromocionar);
		}
	}
	/*marco el nodo que promociona*/
	 idNodoPromocion=""+altura+nodo+posicionAPromocionar+"Provisorio";
	 $("#"+idNodoPromocion+"").effect("pulsate",{times:5},700);
	/*promociono el elemento*/
	 alturaNodoPadre=parseInt(altura)-1;
	 divPadreNodo=divEnglobaDesbordado.parentNode.firstChild;
	if(divPadreNodo.lastChild.previousSibling.firstChild == undefined)//significa que el nodo a donde promociona no desborda
	{
		idDivPadreNodo=divPadreNodo.id;
		pos=idDivPadreNodo.substr(2,idDivPadreNodo.length-2);
		setTimeout("ordenarNodo(alturaNodoPadre,pos,elementoAPromocionar)",5000);
	}
	/*finalizo la division y promocion*/
	 idPadreNodoDesbordado=divPadreNodoDesbordado.id;	
	 numeroNodo=nodo;
	 alturaNodo=altura;
	setTimeout("finalizarPartirNodo(idDivEnglobaDesbordado+'Provisorio',idDivEnglobaDesbordado,idEnglobaDesbordadoDerecho,idPadreNodoDesbordado,numeroNodo,alturaNodo)",velocidad_transicion);
	var idNodoMensaje="N"+altura+nodo+"Provisorio";
	var nodoMensaje=document.getElementById(idNodoMensaje);
	var numeroNodoMensaje=nodoMensaje.style.zIndex;
	var mensaje="- Desborde del nodo "+numeroNodoMensaje+". Divisi\u00f3n y promoci\u00f3n del elemento "+elementoAPromocionar;
	mostrarMensajeOperacion(mensaje);
}


/**FUNCION QUE CREA UN NUEVO NODO POR EL EFECTO DE DESBORDE*/
function crearNuevoNodoDivision(numeroNodo,nuevoTop,nuevoLeft,posicionNodo,idNodoPosterior,idDivEnglobaProvisorio,idDivEngloba)
{
	/*me quedo con el nodo que engloba al nodo desbordado*/
	var divEnglobaDesbordadoProvisorio=document.getElementById(idDivEnglobaProvisorio);
	/*me quedo con el div padre*/
	var divPadre=divEnglobaDesbordadoProvisorio.parentNode;
	/*creo el div que me engloba al nodo*/
	var divEnglobaDesbordadoNuevo=document.createElement('div');
	divEnglobaDesbordadoNuevo.id=idDivEngloba;
	if(posicionNodo=="izquierdo")
	{
		divEnglobaDesbordadoNuevo.style.zIndex=divEnglobaDesbordadoProvisorio.style.zIndex;
	}else
	{
		if(vectorNumeracion.length==0)
		{
			divEnglobaDesbordadoNuevo.style.zIndex=contadorNumeroNodo;
			contadorNumeroNodo++;
		}else
		{
			var rotulo=vectorNumeracion.shift();
			divEnglobaDesbordadoNuevo.style.zIndex=rotulo;
		}
	}
	divEnglobaDesbordadoNuevo.style.position='absolute';
	divEnglobaDesbordadoNuevo.style.height=30;
	divEnglobaDesbordadoNuevo.style.width=anchoTotalNodo+170;
	/*creo el div que me representa el conjunto de elmentos del nodo*/
	var divElementos=document.createElement('div');
	divElementos.id="E"+idDivEngloba[1]+idDivEngloba.substr(2,idDivEngloba.length-2);	
	/*creo los divs que representan los punteros y los elementos*/
	for(var x=0;x<=maxElementos-1;x++)
	{
		var divPuntero=document.createElement('div');
		divPuntero.id='P'+idDivEngloba[1]+idDivEngloba.substr(2,idDivEngloba.length-2)+x;
		divPuntero.style.width=10;
		divPuntero.style.height=30;
		divPuntero.className='puntero';	
		divPuntero.style.position='relative';
		divPuntero.style.cssFloat='left';
		divElementos.appendChild(divPuntero);
		var elementoNuevo=document.createElement('div');
		elementoNuevo.className="elemento";
		elementoNuevo.id=''+idDivEngloba[1]+idDivEngloba.substr(2,idDivEngloba.length-2)+x;
		elementoNuevo.style.width=30;
		elementoNuevo.style.height=25;
		elementoNuevo.style.backgroundColor=color_nodo;
elementoNuevo.style.color=color_texto_nodo;
		elementoNuevo.style.border=borde_elemento;
		elementoNuevo.style.position='relative';
		elementoNuevo.style.cssFloat='left';
		divElementos.appendChild(elementoNuevo);	
	}
	/*creo el ultimo puntero*/
	divPuntero=document.createElement('div');
	divPuntero.id='P'+idDivEngloba[1]+idDivEngloba.substr(2,idDivEngloba.length-2)+x;
	divPuntero.style.width=10;
	divPuntero.style.height=30;
	divPuntero.className='puntero';	
	divPuntero.style.position='relative';
	divPuntero.style.cssFloat='left';
	divElementos.appendChild(divPuntero);
	/*creo un div que indica el la explicacion de la creacion del nodo*/
	var divExplicacion=document.createElement('div');
	divExplicacion.style.backgroundColor=color_explicacion_nuevo_nodo;
	divExplicacion.style.border=borde_explicacion_nuevo_nodo;
	divExplicacion.style.width=120;
	divExplicacion.appendChild(document.createTextNode("Nuevo Nodo"));
	if(posicionNodo=="izquierdo")
	{
		divExplicacion.id="explicacionNuevoNodoIzquierdo";
	}else
	{
		divExplicacion.id="explicacionNuevoNodoDerecho";
	}
	divElementos.appendChild(divExplicacion);
	divEnglobaDesbordadoNuevo.appendChild(divElementos);
	divEnglobaDesbordadoProvisorio.appendChild(divEnglobaDesbordadoNuevo);
	$('#'+idDivEngloba).animate({top:nuevoTop, left:nuevoLeft},1250);
	
}

/*FUNCION QUE CALCULA EL ANCHO TOTAL DE LA RAMA REPRESENTADA EN EL DIV QUE LLEGA COMO PARAMETRO*/
function calcularAnchoADerechoRama(div)
{
	var raiz=document.getElementById("N00");
	var divParcial=div;
	var ancho=parseFloat(raiz.style.left)+parseFloat(divParcial.style.left);
	while(divParcial.childNodes.length > 1)
	{
		ancho=ancho + parseFloat(divParcial.lastChild.style.left);
		divParcial=divParcial.lastChild;		
		
	}
	//le sumo el ancho del ultimo nodo
	ancho=ancho+anchoTotalNodo;
	return ancho;
}

/*FUNCION QUE CALCULA EL ANCHO TOTAL DE LA RAMA REPRESENTADA EN EL DIV QUE LLEGA COMO PARAMETRO*/
function calcularAnchoAIzquierdoRama(div)
{
	var raiz=document.getElementById("N00");
	var divParcial=div;
	var ancho=parseFloat(raiz.style.left)+parseFloat(divParcial.style.left);
	while(divParcial.childNodes.length > 1)
	{
		ancho=ancho + parseFloat(divParcial.firstChild.nextSibling.style.left);
		divParcial=divParcial.firstChild.nextSibling;		
	}
	return ancho;
}


/*FUNCION QUE ACOMODA LAS RAMAS ES PROBABLE QUE SE BORRE*/
function acomodarRamas()
{
	var raiz=document.getElementById("N00");
	if(raiz.firstChild.nextSibling.childNodes.length > 1)
	{
		if(raiz.childNodes.length == 3)//la raiz tiene solo dos hijos
		{
			//calculo los limites derechos e izquierdos que deben respetar las ramas izquierda y derecha
			var limiteIzquierdo=parseFloat(raiz.style.left) - distanciaEntreRamas;
			var limiteDerecho=parseFloat(raiz.style.left) + anchoTotalNodo + distanciaEntreRamas
			var anchoRamaIzquierda=calcularAnchoADerechoRama(raiz.firstChild.nextSibling);
			var anchoRamaDerecha=calcularAnchoAIzquierdoRama(raiz.lastChild);
			//calculo el movimiento de la rama izquierda
			if(anchoRamaIzquierda > limiteIzquierdo)
			{
				var movimientoIzquierdo=anchoRamaIzquierda-limiteIzquierdo;
				//acomodo la rama izquierda
				var idRamaIzquierda=raiz.firstChild.nextSibling.id;
				$('#'+idRamaIzquierda).animate({left:"-="+movimientoIzquierdo+"px"},1000);
				//acomodo el arbol
				$('#N00').animate({left:"+="+movimientoIzquierdo+"px"},1250);
			}else
			{
				var movimientoIzquierdo=limiteIzquierdo-anchoRamaIzquierda;
				var idRamaIzquierda=raiz.firstChild.nextSibling.id;
				$('#'+idRamaIzquierda).animate({left:"+="+movimientoIzquierdo+"px"},1000);
			}
			//calculo el movimiento de la rama derecha
			if(anchoRamaDerecha < limiteDerecho)
			{
				var movimientoDerecho=limiteDerecho - anchoRamaDerecha;
				//acomodo la rama derecha
				var idRamaDerecha=raiz.lastChild.id;
				$('#'+idRamaDerecha).animate({left:"+="+movimientoDerecho+"px"},1000);
			}else
			{
				
				var movimientoDerecho=anchoRamaDerecha-limiteDerecho;
				//acomodo la rama derecha
				var idRamaDerecha=raiz.lastChild.id;
				$('#'+idRamaDerecha).animate({left:"-="+movimientoDerecho+"px"},1000);
			}
		}else
		{
			var hijo=raiz.firstChild.nextSibling;
			for(var x=1;x<=raiz.childNodes.length-2;x++)
			{
				var anchoRamaIzquierda=calcularAnchoADerechoRama(hijo);
				var anchoRamaDerecha=calcularAnchoAIzquierdoRama(hijo.nextSibling);
				var limiteIzquierdo=parseFloat(anchoRamaDerecha) - distanciaEntreRamas;
				if(anchoRamaIzquierda > limiteIzquierdo)
				{
					var movimiento=anchoRamaIzquierda - limiteIzquierdo + distanciaEntreRamas;
					var hijoParcial=raiz.firstChild.nextSibling;
					var id=hijoParcial.id;
					for(var i=1;i<=x;i++)
					{
						$('#'+id).animate({left:"-="+movimiento+"px"},1000);
						hijoParcial=hijoParcial.nextSibling;
					}
					$('#N00').animate({left:"+="+movimiento+"px"},1250);
				}
				hijo=hijo.nextSibling;
			}
		}
	}
	return true;
}

/*FUNCION QUE ACOMODA EL ARBOL PARA QUE NO SE VAYA DE PANTALLA*/
function moverArbolParaScroll()
{
	var conteiner=document.getElementById("contenedor");
	var posicionContenedor=position(conteiner);
	var limiteIzquierdoPantalla= ((posicionContenedor.left) + (anchoTotalNodo/2));
	//busco el nodo mas extremo de la rama izquierda
	var contenedor=document.getElementById("wrapperContenedor");
	var hijoIzquierdo=document.getElementById("N10");
	var idHijoExtremoIzquierdo=obtenerHijoMasIzquierdodelArbol(hijoIzquierdo);
	var posicionReal = $('#'+idHijoExtremoIzquierdo).offset();
	var posicionConDezplasamiento=parseInt(posicionReal.left)+parseInt(contenedor.scrollLeft);
	if(parseInt(posicionConDezplasamiento) < limiteIzquierdoPantalla )
	{
		var movimientoArbolCompleto=(limiteIzquierdoPantalla - parseInt(posicionConDezplasamiento))+anchoElemento;
		$('#N00').animate({left:"+="+movimientoArbolCompleto+"px"},1250,function(){dibujarEnlaces();});
	}else
	{
		var movimientoArbolCompleto=parseInt(posicionConDezplasamiento) - limiteIzquierdoPantalla - anchoElemento;
		$('#N00').animate({left:"-="+movimientoArbolCompleto+"px"},1250,function(){dibujarEnlaces();});
	}
	return true;
}

/*FUNCION RECURSIVA QUE OBTIENE EL NODO MAS EXTREMO IZQUIERDO DEL NODO QUE LLEGA COMO PARAMETRO*/
function obtenerHijoMasIzquierdodelArbol(hijoIzquierdo)
{
	if(hijoIzquierdo.childNodes.length > 1)
	{
		id=obtenerHijoMasIzquierdodelArbol(hijoIzquierdo.firstChild.nextSibling);
		return id;
	}else
	{
		return hijoIzquierdo.id;
	}
}

/*FUNCION MUY IMPORTANTE!!!! QUE RESIBE UN NODO Y CENTRA SUS HIJOS EN FUNCION A EL. ESTA FUNCION ES UTILIZADA PARA RENDERIZAR EL ARBOL*/
function centrarHijosEnFuncionAPadre(idNodoPadre)
{
	var padre=document.getElementById(idNodoPadre);
	var cantidadHijos=calcularCantidadHijosRama(padre);
	var ancho=(cantidadHijos * anchoTotalNodo)+((cantidadHijos-1)*distanciaEntreNodos);
	var medio=parseFloat(ancho / 2);
	var posicionHijoMasIzquierdo=medio*(-1);
	//me quedo con el nodo del extremo mas izquierdo del arbol
	var extremoIzquierdo=padre.firstChild.nextSibling;
	while(extremoIzquierdo.childNodes.length > 1)
	{
		extremoIzquierdo=extremoIzquierdo.firstChild.nextSibling;
	}
	var hijoIzquierdo=padre.firstChild.nextSibling;
	//me quedo con la posicion real del nodo mas extremo del arbol
	var posExtremoIzquierdo=position(extremoIzquierdo);
	var leftExtremoIzquierdo=posExtremoIzquierdo.left;
	//me quedo con la posicion real del primer hijo del padre
	var posHijoIzquierdo=position(hijoIzquierdo);
	var leftHijoIzquierdo=posHijoIzquierdo.left;
	//calculo la distancia entre ambos nodos
	var distancia=leftHijoIzquierdo-leftExtremoIzquierdo;
	//acomodo los hijos
	posicionHijoMasIzquierdo=posicionHijoMasIzquierdo+distancia+(anchoTotalNodo/2);
	hijoIzquierdo.style.left=posicionHijoMasIzquierdo;
	corrimientoADerecha(hijoIzquierdo.id);
}

/*FUNCION QUE MUEVE A LA DERECHA UN NODO EN FUNCION DEL ANCHO DE SU HERMANO IZQUIERDO*/
function corrimientoADerecha(idDivNuevoNodoDerecho)
{
	/*me quedo con el div a partir del cual hay que realizar el corrimiento*/
	var divLimite=document.getElementById(idDivNuevoNodoDerecho);
	var numeroNodoLimite=idDivNuevoNodoDerecho;
	numeroNodoLimite=parseInt(numeroNodoLimite.substr(2,numeroNodoLimite.length-2));
	/*me quedo con el div padre*/
	var divPadre=divLimite.parentNode;
	/*realizo el corrimiento*/
	var divACorrer=divPadre.firstChild.nextSibling;
	if(divACorrer.childNodes.length == 1)
	{
		for(var x=0;x<=divPadre.childNodes.length-2;x++)
		{
			var numeroNodoACorrer=divACorrer.id;
			numeroNodoACorrer=parseInt(numeroNodoACorrer.substr(2,numeroNodoACorrer.length-2));
			if(parseInt(numeroNodoACorrer) > parseInt(numeroNodoLimite))
			{
				var movimiento=parseInt(divACorrer.previousSibling.style.left)+anchoTotalNodo+distanciaEntreNodos;
				divACorrer.style.left=movimiento;
			}
			divACorrer=divACorrer.nextSibling;
		}
	}else
	{
		for(var x=0;x<=divPadre.childNodes.length-2;x++)
		{
			var idDivACorrer=divACorrer.id;
			var numeroNodoACorrer=parseInt(idDivACorrer.substr(2,idDivACorrer.length-2));
			if(parseInt(numeroNodoACorrer) > parseInt(numeroNodoLimite))
			{
				var movimiento=calcularMovimientoEnFuncionAHijosIzquierdos(idDivACorrer);
				divACorrer.style.left=movimiento;
			}
			divACorrer=divACorrer.nextSibling;
		}
	}
}

/*FUNCION QUE SE FIJA EL ANCHO DEL HERMANO IZQUIERDO Y RETORNA EL MOVIMIENTO QUE DEBE REALIZAR EL NODO QUE LLEGA COMO PARAMETRO*/
function calcularMovimientoEnFuncionAHijosIzquierdos(numeroACorrer)
{
	//me quedo con el div a correr
	var divACorrer=document.getElementById(numeroACorrer);
	//me quedo con el hermano izquierdo del div a correr
	var divHermanoIzquierdo=divACorrer.previousSibling;
	//obtengo el nodo del extremo mas derecho del hermano izquierdo
	var divExtremoDerecho=divHermanoIzquierdo.lastChild;
	while(divExtremoDerecho.childNodes.length > 1)
	{
		divExtremoDerecho=divExtremoDerecho.lastChild;
	}
	//obtengo el nodo del extremo mas izquierdo del nodo a correr
	var divExtremoIzquierdo=divACorrer.firstChild.nextSibling;
	while(divExtremoIzquierdo.childNodes.length > 1)
	{
		divExtremoIzquierdo=divExtremoIzquierdo.firstChild.nextSibling;
	}
	//obtengo la posicion real del nodo mas derecho del hermano izquierdo
	var posDivExtremoDerecho=position(divExtremoDerecho);
	var leftDivExtremoDerecho=posDivExtremoDerecho.left + anchoTotalNodo;
	//obtengo la posicion real del nodo mas izquierdo del nodo a correr
	var posDivExtremoIzquierdo=position(divExtremoIzquierdo);
	var leftDivExtremoIzquierdo=posDivExtremoIzquierdo.left;
	//obtengo la distancia entre ambos extremos
	var distanciaEntreExtremos=leftDivExtremoIzquierdo-leftDivExtremoDerecho;
	if(distanciaEntreExtremos < 0)
	{
		var movimiento=parseFloat(divACorrer.style.left)+(leftDivExtremoDerecho-leftDivExtremoIzquierdo)+distanciaEntreNodos;
	}else
	{
		if(distanciaEntreExtremos > distanciaEntreNodos)
		{
			var movimiento=distanciaEntreExtremos-distanciaEntreNodos;
			movimiento=parseFloat(divACorrer.style.left)-movimiento;
		}else
		{
			var movimiento=parseFloat(divACorrer.style.left)+(distanciaEntreNodos-distanciaEntreExtremos);
		}
	}
	return movimiento;									   
}


function corrimientoAIzquierda(idDivNuevoNodoIzquierdo)
{
	/*me quedo con el div a partir del cual hay que realizar el corrimiento*/
	var divLimite=document.getElementById(idDivNuevoNodoIzquierdo);
	var numeroNodoLimite=idDivNuevoNodoIzquierdo;
	numeroNodoLimite=parseInt(numeroNodoLimite.substr(2,numeroNodoLimite.length-2));
	/*me quedo con el div padre*/
	var divPadre=divLimite.parentNode;
	/*realizo el corrimiento*/
	var divACorrer=divPadre.lastChild;
	if(divACorrer.childNodes.length ==1)
	{
		for(var x=0;x<=divPadre.childNodes.length-2;x++)
		{
			numeroNodoACorrer=divACorrer.id;
			numeroNodoACorrer=parseInt(numeroNodoACorrer.substr(2,numeroNodoACorrer.length-2));
			if(parseInt(numeroNodoACorrer) < parseInt(numeroNodoLimite))
			{
				idCorrimiento=divACorrer.id;
				movimiento=parseInt(divACorrer.nextSibling.style.left)-anchoTotalNodo-distanciaEntreNodos;
				divACorrer.style.left=movimiento;
			}
			divACorrer=divACorrer.previousSibling;
		}
	}else
	{
		for(var x=0;x<=divPadre.childNodes.length-2;x++)
		{
			idDivACorrer=divACorrer.id;
			numeroNodoACorrer=parseInt(idDivACorrer.substr(2,idDivACorrer.length-2));
			if(parseInt(numeroNodoACorrer) < parseInt(numeroNodoLimite))
			{
				movimiento=calcularMovimientoEnFuncionAHijosDerechos(idDivACorrer);
				divACorrer.style.left=movimiento;
			}
			divACorrer=divACorrer.previousSibling;
		}
	}
}


function calcularMovimientoEnFuncionAHijosDerechos(numeroACorrer)
{
	//me quedo con el div a correr
	var divACorrer=document.getElementById(numeroACorrer);
	//me quedo con el hermano derecho del div a correr
	var divHermanoDerecho=divACorrer.nextSibling;
	//obtengo el nodo del extremo mas izquierdo del hermano derecho
	var divExtremoIzquierdo=divHermanoDerecho.firstChild.nextSibling;
	while(divExtremoIzquierdo.childNodes.length > 1)
	{
		divExtremoIzquierdo=divExtremoIzquierdo.firstChild.nextSibling;
	}
	//obtengo el nodo del extremo mas derecho del nodo a correr
	var divExtremoDerecho=divACorrer.lastChild;
	while(divExtremoDerecho.childNodes.length > 1)
	{
		divExtremoDerecho=divExtremoDerecho.lastChild;
	}
	//obtengo la posicion real del nodo mas izquierdo del hermano derecho
	var posDivExtremoIzquierdo=position(divExtremoIzquierdo);
	var leftDivExtremoIzquierdo=posDivExtremoIzquierdo.left;
	//obtengo la posicion real del nodo mas derecho del nodo a correr
	var posDivExtremoDerecho=position(divExtremoDerecho);
	var leftDivExtremoDerecho=posDivExtremoDerecho.left+anchoTotalNodo;
	//obtengo la distancia entre ambos extremos
	var distanciaEntreExtremos=leftDivExtremoIzquierdo-leftDivExtremoDerecho;
	if(distanciaEntreExtremos < 0)
	{
		var movimiento=parseFloat(divACorrer.style.left)-((leftDivExtremoDerecho-leftDivExtremoIzquierdo)+distanciaEntreNodos);
	}else
	{
		if(distanciaEntreExtremos > distanciaEntreNodos)
		{
			var movimiento=distanciaEntreExtremos-distanciaEntreNodos;
			movimiento=parseFloat(divACorrer.style.left)+movimiento;
		}else
		{
			var movimiento=parseFloat(divACorrer.style.left)-((distanciaEntreNodos-distanciaEntreExtremos));
		}
	}
	return movimiento;
}


/*FUNCION QUE REPARTE LOS ELEMENTOS DEL NODO CON IDNODODESNORDADO EN LOS NUEVOS NODOS CREADOS POR LA EXPLOCION. LOS NUEVOS NODOS SON LOS QUE TIENE IDNODOIZQUIERDO Y IDNODODERECHO RESPECTIVAMENTE*/
function distribuirHijos(idNodoDesbordado,idNodoIzquierdo,idNodoDerecho,elementoAPromocionar)
{
	//me quedo con el nodo desbordado
	var divDesbordado=document.getElementById(idNodoDesbordado);
	//me quedo con el nodo izquierdo
	var divIzquierdo=document.getElementById(idNodoIzquierdo);
	//me quedo con el nodo derecho
	var divDerecho=document.getElementById(idNodoDerecho);
	var divParcial=divDesbordado.firstChild.nextSibling;
	/*me quedo con la cantidad de hijos del nodo desbordado*/
	var cantHijos=parseInt(divDesbordado.childNodes.length)-3;
	for(var x=1;x<=cantHijos;x++)
	{
		elemento=divParcial.firstChild.firstChild.nextSibling.firstChild.nodeValue;
		if(elemento < elementoAPromocionar)//el hijo va al nodo izquierdo
		{
			divTemporal=document.createElement('div');
			divTemporal.id='temporal';
			divIzquierdo.appendChild(divTemporal);
			divAuxiliar=divParcial.nextSibling;
			divIzquierdo.replaceChild(divParcial,divTemporal);
		}else
		{
			if(elemento > elementoAPromocionar)
			{
				divTemporal=document.createElement('div');
				divTemporal.id='temporal';
				divDerecho.appendChild(divTemporal);
				if(divParcial.nextSibling!=undefined)
				{
					divAuxiliar=divParcial.nextSibling;
				}
				divDerecho.replaceChild(divParcial,divTemporal);
			}
		}
		divParcial=divAuxiliar;
	}
}


/*FUNCION QUE INCREMENTA LOS ID DE LOS NODOS QUE SE ENCUENTRAN A LA MISMA ALTURA DEL NODO CON EL ID QUE LLEGA COMO PARAMETRO*/
function incrementarIdDivsHermanos(numeroNodoDesbordado,altura)
{
	
	for(var j=81;j!=0;j--)
	{
		
		var idHermano="N"+altura+j;
		var divHermano=document.getElementById(idHermano);
		if(divHermano != undefined)
		{
			if(j > parseInt(numeroNodoDesbordado))
			{
				divHermano.id="N"+altura+parseInt(j+1);
				divElementos=divHermano.firstChild;
				divElementos.id="E"+altura+parseInt(j+1);
				divElemento=divElementos.firstChild;
				for(var h=0;h<=divElementos.childNodes.length-1;h++)
				{
					idElemento=divElemento.id;
					if(idElemento[0]=="P")
					{
						divElemento.id="P"+altura+parseInt(j+1)+idElemento[idElemento.length-1];
					}else
					{
						divElemento.id=""+altura+parseInt(j+1)+idElemento[idElemento.length-1];
					}
					divElemento=divElemento.nextSibling;
				}
			}
		}
	}
}

/*************************OPERACIONES DE BORRADO DE ELEMENTOS**************************************************/

/*FUNCION QUE BORRA UN ELEMENTO DE LA RAIZ SIN UNDERFLOW*/
function borrarElementoDeRaiz(altura,nodo,posicionElemento)
{
	
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	var elementoAEliminar=divElementoAEliminar.firstChild.nodeValue;
	divElementoAEliminar.removeChild(divElementoAEliminar.lastChild);
	//me quedo con el div siguiente al que se borro
	divPosterior=divElementoAEliminar.nextSibling.nextSibling;
	if(divPosterior.hasChildNodes())
	{
		ordenarNodoEliminacion(altura,nodo,posicionElemento,elementoAEliminar);
	}
	var mensaje="- Eliminaci\u00f3n del elemento "+elementoAEliminar+" de la ra\u00edz.";
	mostrarMensajeOperacion(mensaje);
}

/*FUNCION QUE BORRA UN ELEMENTO DE UN NODO HOJA SIN PRODUCIR UNDERFLOW*/
function borrarElementoDeNodoHojaSinUnder(altura,nodo,posicionElemento)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	var elementoAEliminar=divElementoAEliminar.firstChild.nodeValue;
	divElementoAEliminar.removeChild(divElementoAEliminar.lastChild);
	//me quedo con el div siguiente al que se borro
	if(divElementoAEliminar.nextSibling.nextSibling!=undefined)
	{
		var divPosterior=divElementoAEliminar.nextSibling.nextSibling;
		if(divPosterior.hasChildNodes())
		{
			ordenarNodoEliminacion(altura,nodo,posicionElemento,elementoAEliminar);
		}
	}
	var idNodoMensaje="N"+altura+nodo;
	var nodoMensaje=document.getElementById(idNodoMensaje);
	var numeroNodoMensaje=nodoMensaje.style.zIndex;
	var mensaje="- Eliminaci\u00f3n del elemento "+elementoAEliminar+" del nodo "+numeroNodoMensaje+".";
	mostrarMensajeOperacion(mensaje);
}

/*FUNCION QUE DEJA EL NODO ORDENADO LUEGO DE ELIMINAR UN ELEMENTO*/
function ordenarNodoEliminacion(altura,nodo,posicionElemento,elementoAEliminar)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	var contenedorElementos=divElementoAEliminar.parentNode;
	var divElemento=contenedorElementos.firstChild.nextSibling;
	for(var x=1;x<=maxElementos;x++)
	{
		if(divElemento.hasChildNodes())
		{
			if(parseInt(divElemento.firstChild.nodeValue) > parseInt(elementoAEliminar) )
			{
				var elemento=divElemento.firstChild.nodeValue;
				divElemento.removeChild(divElemento.lastChild);
				var divElementoAnterior=divElemento.previousSibling.previousSibling;
				divElementoAnterior.appendChild(document.createTextNode(elemento));
			}
			
		}
		if(divElemento.nextSibling!=undefined)
		{
				var divElemento=divElemento.nextSibling.nextSibling;
		}
	}
}

/*FUNCION QUE BORRA UN ELEMENTO PRODUCIENDOSE UNDERFLOW Y EL HERMANO IZQUIERDO PUEDE CEDERLE UN ELEMENTO*/
function borrarElementoDeNodoIntermedioConUnderADer(altura,nodo,posicionElemento,elementoIntermedioPadre)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	var elementoAEliminar=divElementoAEliminar.firstChild.nodeValue;
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano izquierdo del nodo donde se produce underflow
	var nodoHermanoIzquierdo=nodoElementos.previousSibling;
	var idNodoHeremanoIzquierdo=nodoHermanoIzquierdo.id;
	//me quedo con el padre de los nodos que estan redistribuyendo
	var contenedorElementos=divElementoAEliminar.parentNode;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//realizo la redistribucion
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	var idContenedorElementos=contenedorElementos.id;
	//me quedo con el contenedor de elementos del hermano izquierdo
	var contenedorElementosHermanoIzquierdo=nodoHermanoIzquierdo.firstChild;
	var idContenedorElementosHermanoIzquierdo=contenedorElementosHermanoIzquierdo.id;
	//me quedo con el div del elemento del padre que pasa al nodo en underflow
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	var alturaDivElementoPadre=idDivElementoPadre[0];
	var nodoDivElementoPadre=idDivElementoPadre.substr(1,idDivElementoPadre.length-2);
	var posicionDivElementoPadre=idDivElementoPadre.substr(idDivElementoPadre.length-1);
	//me quedo con el div del elemento del hermano Izquierdo que pasa al padre
	var divElementoHermanoIzquierdo=obtenerUltimoElementoDeNodo(contenedorElementosHermanoIzquierdo);
	var elementoHermanoIzquierdo=divElementoHermanoIzquierdo.firstChild.nodeValue;
	var idElementoHermanoIzquierdo=divElementoHermanoIzquierdo.id;
	var alturaDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo[0];
	var nodoDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo.substr(1,idElementoHermanoIzquierdo.length-2);
	var posicionDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo.substr(idElementoHermanoIzquierdo.length-1);
	
	divElementoAEliminar.removeChild(divElementoAEliminar.lastChild);
	//me quedo con el div siguiente al que se borro
	var divPosterior=divElementoAEliminar.nextSibling.nextSibling;
	if(divPosterior.hasChildNodes())
	{
		ordenarNodoEliminacion(altura,nodo,posicionElemento,elementoAEliminar);
	}
	
	$("#"+idContenedorElementos+"").effect("pulsate",{times:5},700);
	$("#"+idContenedorElementosHermanoIzquierdo+"").effect("pulsate",{times:5},700,ejecutarProximaAnimacion);	
}

/*FUNCION QUE BORRA UN ELEMENTO PRODUCIENDOSE UNDERFLOW Y EL HERMANO DERECHO PUEDE CEDERLE UN ELEMENTO*/
function borrarElementoDeNodoIntermedioConUnderAIzq(altura,nodo,posicionElemento,elementoIntermedioPadre)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	var elementoAEliminar=divElementoAEliminar.firstChild.nodeValue;
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano derecho del nodo donde se produce underflow
	var nodoHermanoDerecho=nodoElementos.nextSibling;
	var idNodoHeremanoDerecho=nodoHermanoDerecho.id;
	//me quedo con el padre de los nodos que estan redistribuyendo
	var contenedorElementos=divElementoAEliminar.parentNode;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//realizo la redistribucion
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	var idContenedorElementos=contenedorElementos.id;
	//me quedo con el contenedor de elementos del hermano derecho
	var contenedorElementosHermanoDerecho=nodoHermanoDerecho.firstChild;
	var idContenedorElementosHermanoDerecho=contenedorElementosHermanoDerecho.id;
	//me quedo con el div del elemento del padre que pasa al nodo en underflow
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	var alturaDivElementoPadre=idDivElementoPadre[0];
	var nodoDivElementoPadre=idDivElementoPadre.substr(1,idDivElementoPadre.length-2);
	var posicionDivElementoPadre=idDivElementoPadre.substr(idDivElementoPadre.length-1);
	//me quedo con el div del elemento del hermano derecho que pasa al padre
	var divElementoHermanoDerecho=contenedorElementosHermanoDerecho.firstChild.nextSibling;
	var elementoHermanoDerecho=divElementoHermanoDerecho.firstChild.nodeValue;
	var idElementoHermanoDerecho=divElementoHermanoDerecho.id;
	var alturaDivElementoHermanoDerecho=idElementoHermanoDerecho[0];
	var nodoDivElementoHeramnoDerecho=idElementoHermanoDerecho.substr(1,idElementoHermanoDerecho.length-2);
	var posicionDivElementoHermanoDerecho=idElementoHermanoDerecho.substr(idElementoHermanoDerecho.length-1);
	
	divElementoAEliminar.removeChild(divElementoAEliminar.lastChild);
	//me quedo con el div siguiente al que se borro
	var divPosterior=divElementoAEliminar.nextSibling.nextSibling;
	if(divPosterior.hasChildNodes())
	{
		ordenarNodoEliminacion(altura,nodo,posicionElemento,elementoAEliminar);
	}
	$("#"+idContenedorElementos+"").effect("pulsate",{times:5},700);
	$("#"+idContenedorElementosHermanoDerecho+"").effect("pulsate",{times:5},700,ejecutarProximaAnimacion);
	var idNodoMensaje="N"+altura+nodo;
	var nodoMensaje=document.getElementById(idNodoMensaje);
	var numeroNodoMensaje=nodoMensaje.style.zIndex;
	var mensaje="- Eliminaci\u00f3n del elemento "+elementoAEliminar+". Underflow del nodo "+numeroNodoMensaje+". Redistribuci\u00f3n a Izquierda";
	mostrarMensajeOperacion(mensaje);
}

/*FUNCION QUE BORRA UN ELEMENTO DE UN NODO HOJA PRODUCIENDOSE UNDERFLOW Y EL HERMANO IZQUIERDO PUEDE CEDERLE UN ELEMENTO*/
function borrarElementoDeNodoHojaConUnderADer(altura,nodo,posicionElemento,elementoIntermedioPadre)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	var elementoAEliminar=divElementoAEliminar.firstChild.nodeValue;
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano izquierdo del nodo donde se produce underflow
	var nodoHermanoIzquierdo=nodoElementos.previousSibling;
	var idNodoHermanoIzquierdo=nodoHermanoIzquierdo.id;
	//me quedo con el padre de los nodos que estan redistribuyendo
	var contenedorElementos=divElementoAEliminar.parentNode;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//realizo la redistribucion
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	//me quedo con el contenedor de elementos del hermano izquierdo
	var contenedorElementosHermanoIzquierdo=nodoHermanoIzquierdo.firstChild;
	//me quedo con el div del elemento del padre que pasa al nodo en underflow
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	var alturaDivElementoPadre=idDivElementoPadre[0];
	var nodoDivElementoPadre=idDivElementoPadre.substr(1,idDivElementoPadre.length-2);
	var posicionDivElementoPadre=idDivElementoPadre.substr(idDivElementoPadre.length-1);
	//me quedo con el div del elemento del hermano Izquierdo que pasa al padre
	var divElementoHermanoIzquierdo=obtenerUltimoElementoDeNodo(contenedorElementosHermanoIzquierdo);
	var elementoHermanoIzquierdo=divElementoHermanoIzquierdo.firstChild.nodeValue;
	var idElementoHermanoIzquierdo=divElementoHermanoIzquierdo.id;
	var alturaDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo[0];
	var nodoDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo.substr(1,idElementoHermanoIzquierdo.length-2);
	var posicionDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo.substr(idElementoHermanoIzquierdo.length-1);
	divElementoAEliminar.removeChild(divElementoAEliminar.lastChild);
	//me quedo con el div siguiente al que se borro
	var divPosterior=divElementoAEliminar.nextSibling.nextSibling;
	if(divPosterior.hasChildNodes())
	{
		ordenarNodoEliminacion(altura,nodo,posicionElemento,elementoAEliminar);
	}
	$("#"+idNodoElementos+"").effect("pulsate",{times:5},700);
	$("#"+idNodoHermanoIzquierdo+"").effect("pulsate",{times:5},700,ejecutarProximaAnimacion);
}
 

/*FUNCION QUE BORRA UN ELEMENTO DE UN NODO HOJA PRODUCIENDOSE UNDERFLOW Y EL HERMANO DERECHO PUEDE CEDERLE UN ELEMENTO*/
function borrarElementoDeNodoHojaConUnderAIzq(altura,nodo,posicionElemento,elementoIntermedioPadre)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	var elementoAEliminar=divElementoAEliminar.firstChild.nodeValue;
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano derecho del nodo donde se produce underflow
	var nodoHermanoDerecho=nodoElementos.nextSibling;
	var idNodoHermanoDerecho=nodoHermanoDerecho.id;
	//me quedo con el padre de los nodos que estan redistribuyendo
	var contenedorElementos=divElementoAEliminar.parentNode;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//realizo la redistribucion
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	//me quedo con el contenedor de elementos del hermano derecho
	var contenedorElementosHermanoDerecho=nodoHermanoDerecho.firstChild;
	//me quedo con el div del elemento del padre que pasa al nodo en underflow
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	var alturaDivElementoPadre=idDivElementoPadre[0];
	var nodoDivElementoPadre=idDivElementoPadre.substr(1,idDivElementoPadre.length-2);
	var posicionDivElementoPadre=idDivElementoPadre.substr(idDivElementoPadre.length-1);
	//me quedo con el div del elemento del hermano derecho que pasa al padre
	var divElementoHermanoDerecho=contenedorElementosHermanoDerecho.firstChild.nextSibling;
	var elementoHermanoDerecho=divElementoHermanoDerecho.firstChild.nodeValue;
	var idElementoHermanoDerecho=divElementoHermanoDerecho.id;
	var alturaDivElementoHermanoDerecho=idElementoHermanoDerecho[0];
	var nodoDivElementoHermanoDerecho=idElementoHermanoDerecho.substr(1,idElementoHermanoDerecho.length-2);
	var posicionDivElementoHermanoDerecho=idElementoHermanoDerecho.substr(idElementoHermanoDerecho.length-1);
	divElementoAEliminar.removeChild(divElementoAEliminar.lastChild);
	//me quedo con el div siguiente al que se borro
	var divPosterior=divElementoAEliminar.nextSibling.nextSibling;
	if(divPosterior.hasChildNodes())
	{
		ordenarNodoEliminacion(altura,nodo,posicionElemento,elementoAEliminar);
	}
	$("#"+idNodoElementos+"").effect("pulsate",{times:5},700);
	$("#"+idNodoHermanoDerecho+"").effect("pulsate",{times:5},700,ejecutarProximaAnimacion);
}

/*FUNCION QUE REDISTRIBUYE PORQUE UN NODO HA QUEDADO EN UNDERFLOW Y EL HERMANO DERECHO PUEDE CEDER ELEMENTOS*/
function redistribuirAIzq(altura,nodo,posicionElemento,elementoIntermedioPadre,posicionNodo)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano derecho del nodo donde se produce underflow
	var nodoHermanoDerecho=nodoElementos.nextSibling;
	var idNodoHeremanoDerecho=nodoHermanoDerecho.id;
	//me quedo con el padre de los nodos que estan redistribuyendo
	var contenedorElementos=divElementoAEliminar.parentNode;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//realizo la redistribucion
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	//me quedo con el contenedor de elementos del hermano derecho
	var contenedorElementosHermanoDerecho=nodoHermanoDerecho.firstChild;
	//me quedo con el div del elemento del padre que pasa al nodo en underflow
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	var alturaDivElementoPadre=idDivElementoPadre[0];
	var nodoDivElementoPadre=idDivElementoPadre.substr(1,idDivElementoPadre.length-2);
	var posicionDivElementoPadre=idDivElementoPadre.substr(idDivElementoPadre.length-1);
	//me quedo con el div del elemento del hermano derecho que pasa al padre
	var divElementoHermanoDerecho=contenedorElementosHermanoDerecho.firstChild.nextSibling;
	var elementoHermanoDerecho=divElementoHermanoDerecho.firstChild.nodeValue;
	var idElementoHermanoDerecho=divElementoHermanoDerecho.id;
	var alturaDivElementoHermanoDerecho=idElementoHermanoDerecho[0];
	var nodoDivElementoHeramnoDerecho=idElementoHermanoDerecho.substr(1,idElementoHermanoDerecho.length-2);
	var posicionDivElementoHermanoDerecho=idElementoHermanoDerecho.substr(idElementoHermanoDerecho.length-1);
	//borro el elemento del hermano derecho que pasa al padre
	borrarElementoDeNodoHojaSinUnder(alturaDivElementoHermanoDerecho,nodoDivElementoHeramnoDerecho,posicionDivElementoHermanoDerecho);
	//borro el elemento del padre que pasa al nodo en underflow
	borrarElementoDeNodoHojaSinUnder(alturaDivElementoPadre,nodoDivElementoPadre,posicionDivElementoPadre);
	//inserto el elemento del hermano derecho en el padre
	ordenarNodo(alturaDivElementoPadre,nodoDivElementoPadre,elementoHermanoDerecho);
	//inserto el elemento del padre en el nodo en underflow
	ordenarNodo(altura,nodo,elementoIntermedioPadre);
	if(posicionNodo=="extremo")
	{
		var mensaje="- Redistribuci\u00f3n a izquierda.";
	}else
	{
		var mensaje="- Redistribuci\u00f3n a izquierda.";
	}
	mostrarMensajeOperacion(mensaje);
	habilitarBotones();
}

/*FUNCION QUE REDISTRIBUYE PORQUE UN NODO HA QUEDADO EN UNDERFLOW Y EL HERMANO IZQUIERDO PUEDE CEDER ELEMENTOS*/
function redistribuirADer(altura,nodo,posicionElemento,elementoIntermedioPadre,posicionNodo)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano izquierdo del nodo donde se produce underflow
	var nodoHermanoIzquierdo=nodoElementos.previousSibling;
	var idNodoHeremanoIzquierdo=nodoHermanoIzquierdo.id;
	//me quedo con el padre de los nodos que estan redistribuyendo
	var contenedorElementos=divElementoAEliminar.parentNode;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//realizo la redistribucion
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	//me quedo con el contenedor de elementos del hermano derecho
	var contenedorElementosHermanoIzquierdo=nodoHermanoIzquierdo.firstChild;
	//me quedo con el div del elemento del padre que pasa al nodo en underflow
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	var alturaDivElementoPadre=idDivElementoPadre[0];
	var nodoDivElementoPadre=idDivElementoPadre.substr(1,idDivElementoPadre.length-2);
	var posicionDivElementoPadre=idDivElementoPadre.substr(idDivElementoPadre.length-1);
	//me quedo con el div del elemento del hermano derecho que pasa al padre
	var divElementoHermanoIzquierdo=obtenerUltimoElementoDeNodo(contenedorElementosHermanoIzquierdo);
	var elementoHermanoIzquierdo=divElementoHermanoIzquierdo.firstChild.nodeValue;
	var idElementoHermanoIzquierdo=divElementoHermanoIzquierdo.id;
	var alturaDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo[0];
	var nodoDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo.substr(1,idElementoHermanoIzquierdo.length-2);
	var posicionDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo.substr(idElementoHermanoIzquierdo.length-1);
	//borro el elemento del hermano izquierdo que pasa al padre
	borrarElementoDeNodoHojaSinUnder(alturaDivElementoHermanoIzquierdo,nodoDivElementoHermanoIzquierdo,posicionDivElementoHermanoIzquierdo);
	//borro el elemento del padre que pasa al nodo en underflow
	borrarElementoDeNodoHojaSinUnder(alturaDivElementoPadre,nodoDivElementoPadre,posicionDivElementoPadre);
	//inserto el elemento del hermano izquierdo en el padre
	ordenarNodo(alturaDivElementoPadre,nodoDivElementoPadre,elementoHermanoIzquierdo);
	//inserto el elemento del padre en el nodo en underflow
	ordenarNodo(altura,nodo,elementoIntermedioPadre);
	if(posicionNodo=="extremo")
	{
		var mensaje="- Redistribuci\u00f3n a derecha.";
	}else
	{
		var mensaje="- Redistribuci\u00f3n a derecha."
	}
	mostrarMensajeOperacion(mensaje);
	habilitarBotones();
}


/*FUNCION QUE REDISTRIBUYE PORQUE UN NODO HA QUEDADO EN UNDERFLOW Y EL HERMANO DERECHO PUEDE CEDER ELEMENTOS. EL NODO QUE CEDE TIENE HIJOS*/
function redistribuirAIzqConHijos(altura,nodo,posicionElemento,elementoIntermedioPadre,posicionNodo)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano derecho del nodo donde se produce underflow
	var nodoHermanoDerecho=nodoElementos.nextSibling;
	var idNodoHeremanoDerecho=nodoHermanoDerecho.id;
	//me quedo con el padre de los nodos que estan redistribuyendo
	var contenedorElementos=divElementoAEliminar.parentNode;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//realizo la redistribucion
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	//me quedo con el contenedor de elementos del hermano derecho
	var contenedorElementosHermanoDerecho=nodoHermanoDerecho.firstChild;
	//me quedo con el div del elemento del padre que pasa al nodo en underflow
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	var alturaDivElementoPadre=idDivElementoPadre[0];
	var nodoDivElementoPadre=idDivElementoPadre.substr(1,idDivElementoPadre.length-2);
	var posicionDivElementoPadre=idDivElementoPadre.substr(idDivElementoPadre.length-1);
	//me quedo con el div del elemento del hermano derecho que pasa al padre
	var divElementoHermanoDerecho=contenedorElementosHermanoDerecho.firstChild.nextSibling;
	var elementoHermanoDerecho=divElementoHermanoDerecho.firstChild.nodeValue;
	var idElementoHermanoDerecho=divElementoHermanoDerecho.id;
	var alturaDivElementoHermanoDerecho=idElementoHermanoDerecho[0];
	var nodoDivElementoHeramnoDerecho=idElementoHermanoDerecho.substr(1,idElementoHermanoDerecho.length-2);
	var posicionDivElementoHermanoDerecho=idElementoHermanoDerecho.substr(idElementoHermanoDerecho.length-1);
	//borro el elemento del hermano derecho que pasa al padre
	borrarElementoDeNodoHojaSinUnder(alturaDivElementoHermanoDerecho,nodoDivElementoHeramnoDerecho,posicionDivElementoHermanoDerecho);
	//borro el elemento del padre que pasa al nodo en underflow
	borrarElementoDeNodoHojaSinUnder(alturaDivElementoPadre,nodoDivElementoPadre,posicionDivElementoPadre);
	//inserto el elemento del hermano derecho en el padre
	ordenarNodo(alturaDivElementoPadre,nodoDivElementoPadre,elementoHermanoDerecho);
	//inserto el elemento del padre en el nodo en underflow
	ordenarNodo(altura,nodo,elementoIntermedioPadre);
	//borro los enlaces
	borrarEnlaces();
	//debo pasar la rama que colgaba del elemento que roto como hijo del hermano izquierdo
	//me quedo con la rama que debe rotar
	var ramaRota=nodoHermanoDerecho.firstChild.nextSibling;
	//elimino la rama del nodo que cede
	nodoHermanoDerecho.removeChild(ramaRota);
	centrarHijosEnFuncionAPadre(nodoHermanoDerecho.id);
	//inserto la rama que estaba en el nodo derecho
	nodoElementos.appendChild(ramaRota);
	centrarHijosEnFuncionAPadre(nodoElementos.id);
	//centro el arbol
	centrarArbol(padreNodos);
	setTimeout("moverArbolParaScroll()",2000);
	if(posicionNodo=="extremo")
	{	
		var mensaje="- Redistribuci\u00f3n a izquierda.";
	}else
	{
		var mensaje="- Redistribuci\u00f3n a izquierda.";
	}
	mostrarMensajeOperacion(mensaje);
}

/*FUNCION QUE REDISTRIBUYE PORQUE UN NODO HA QUEDADO EN UNDERFLOW Y EL HERMANO IZQUIERDO PUEDE CEDER ELEMENTOS. EL NODO QUE CEDE TIENE HIJOS*/
function redistribuirADerConHijos(altura,nodo,posicionElemento,elementoIntermedioPadre,posicionNodo)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano izquierdo del nodo donde se produce underflow
	var nodoHermanoIzquierdo=nodoElementos.previousSibling;
	var idNodoHeremanoIzquierdo=nodoHermanoIzquierdo.id;
	//me quedo con el padre de los nodos que estan redistribuyendo
	var contenedorElementos=divElementoAEliminar.parentNode;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//realizo la redistribucion
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	//me quedo con el contenedor de elementos del hermano derecho
	var contenedorElementosHermanoIzquierdo=nodoHermanoIzquierdo.firstChild;
	//me quedo con el div del elemento del padre que pasa al nodo en underflow
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	var alturaDivElementoPadre=idDivElementoPadre[0];
	var nodoDivElementoPadre=idDivElementoPadre.substr(1,idDivElementoPadre.length-2);
	var posicionDivElementoPadre=idDivElementoPadre.substr(idDivElementoPadre.length-1);
	//me quedo con el div del elemento del hermano izquierdo que pasa al padre
	var divElementoHermanoIzquierdo=obtenerUltimoElementoDeNodo(contenedorElementosHermanoIzquierdo);
	var elementoHermanoIzquierdo=divElementoHermanoIzquierdo.firstChild.nodeValue;
	var idElementoHermanoIzquierdo=divElementoHermanoIzquierdo.id;
	var alturaDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo[0];
	var nodoDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo.substr(1,idElementoHermanoIzquierdo.length-2);
	var posicionDivElementoHermanoIzquierdo=idElementoHermanoIzquierdo.substr(idElementoHermanoIzquierdo.length-1);
	//borro el elemento del hermano izquierdo que pasa al padre
	borrarElementoDeNodoHojaSinUnder(alturaDivElementoHermanoIzquierdo,nodoDivElementoHermanoIzquierdo,posicionDivElementoHermanoIzquierdo);
	//borro el elemento del padre que pasa al nodo en underflow
	borrarElementoDeNodoHojaSinUnder(alturaDivElementoPadre,nodoDivElementoPadre,posicionDivElementoPadre);
	//inserto el elemento del hermano izquierdo en el padre
	ordenarNodo(alturaDivElementoPadre,nodoDivElementoPadre,elementoHermanoIzquierdo);
	//inserto el elemento del padre en el nodo en underflow
	ordenarNodo(altura,nodo,elementoIntermedioPadre);
	//borro los enlaces
	borrarEnlaces();
	//debo pasar la rama que colgaba del elemento que roto como hijo del hermano derecho
	//me quedo con la rama que debe rotar
	var ramaRota=nodoHermanoIzquierdo.lastChild;
	//elimino la rama del nodo que cede
	nodoHermanoIzquierdo.removeChild(ramaRota);
	centrarHijosEnFuncionAPadre(nodoHermanoIzquierdo.id);
	//me quedo con el primer hijo de la rama derecha
	var primerHijo=nodoElementos.firstChild.nextSibling;
	//inserto la rama que estaba en el nodo en underflow
	nodoElementos.insertBefore(ramaRota,primerHijo);
	centrarHijosEnFuncionAPadre(nodoElementos.id);
	centrarArbol(padreNodos);
	setTimeout("moverArbolParaScroll()",1000);
	if(posicionNodo=="extremo")
	{
		var mensaje="- Redistribuci\u00f3n a derecha.";
	}else
	{
		var mensaje="- Redistribuci\u00f3n a derecha.";
	}
	mostrarMensajeOperacion(mensaje);
	
}

/*FUNCION QUE DEVUELVE EL ELEMENTO DEL PADRE QUE HACE DE DIVISOR ENTRE DOS NODOS*/
function buscarDivElementoDivisor(contenedor,elemento)
{
	var divActual=contenedor.firstChild.nextSibling;
	var elementoADevolver;
	for(var x=1;x<=maxElementos;x++)
	{
		if(divActual.firstChild.nodeValue == elemento)
		{
			elementoADevolver=divActual.id;
			break;
		}
		if(divActual.nextSibling!=undefined)
		{
			divActual=divActual.nextSibling.nextSibling;
		}
	}
	return elementoADevolver;
}

function obtenerUltimoElementoDeNodo(contenedor)
{
	var divActual=contenedor.firstChild.nextSibling;
	var ultimoElemento;
	for(var x=1;x<=maxElementos;x++)
	{
		if(divActual.hasChildNodes())
		{
			ultimoElemento=divActual;
		}
		if(divActual.nextSibling!=undefined)
		{
			divActual=divActual.nextSibling.nextSibling;
		}
	}
	return ultimoElemento;
}

function borrarFusionConHermanoDerecho(altura,nodo,posicionElemento,elementoIntermedioPadre)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	var elementoAEliminar=divElementoAEliminar.firstChild.nodeValue;
	divElementoAEliminar.removeChild(divElementoAEliminar.lastChild);
	//me quedo con el div siguiente al que se borro
	var divPosterior=divElementoAEliminar.nextSibling.nextSibling;
	if(divPosterior.hasChildNodes())
	{
		ordenarNodoEliminacion(altura,nodo,posicionElemento,elementoAEliminar);
	}
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el contenedor de elementos de nodo donde se esta borrando
	var contenedorElementos=nodoElementos.firstChild;
	var idContenedorElementos=contenedorElementos.id;
	//me quedo con el hermano derecho del nodo donde se produce underflow
	var nodoHermanoDerecho=nodoElementos.nextSibling;
	var idNodoHermanoDerecho=nodoHermanoDerecho.id;
	//me quedo con el contenedor de elementos del hermano derecho
	var contenedorElementosHermanoDerecho=nodoHermanoDerecho.firstChild;
	var idContenedorElementosHermanoDerecho=contenedorElementosHermanoDerecho.id;
	//me quedo con el padre de los nodos que estan fusionando
	var contenedorElementos=divElementoAEliminar.parentNode;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	$("#"+idContenedorElementos+"").effect("pulsate",{times:5},1000);
	$("#"+idContenedorElementosHermanoDerecho+"").effect("pulsate",{times:5},1000);
	$("#"+idDivElementoPadre+"").effect("pulsate",{times:5},1000,ejecutarProximaAnimacion);
}

function borrarFusionConHermanoIzquierdo(altura,nodo,posicionElemento,elementoIntermedioPadre)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	var elementoAEliminar=divElementoAEliminar.firstChild.nodeValue;
	divElementoAEliminar.removeChild(divElementoAEliminar.lastChild);
	//me quedo con el div siguiente al que se borro
	var divPosterior=divElementoAEliminar.nextSibling.nextSibling;
	if(divPosterior.hasChildNodes())
	{
		ordenarNodoEliminacion(altura,nodo,posicionElemento,elementoAEliminar);
	}
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano izquierdo del nodo donde se produce underflow
	var nodoHermanoIzquierdo=nodoElementos.previousSibling;
	var idNodoHermanoIzquierdo=nodoHermanoIzquierdo.id;
	//me quedo con el contenedor de elementos del hermano derecho
	var contenedorElementosHermanoIzquierdo=nodoHermanoIzquierdo.firstChild;
	var idContenedorElementosHermanoIzquierdo=contenedorElementosHermanoIzquierdo.id;
	//me quedo con el padre de los nodos que estan fusionando
	var contenedorElementos=divElementoAEliminar.parentNode;
	var idContenedorElementos=contenedorElementos.id;
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	var idDivElementoPadre=buscarDivElementoDivisor(contenedorElementosPadre,elementoIntermedioPadre);
	$("#"+idContenedorElementos+"").effect("pulsate",{times:5},1000);
	$("#"+idContenedorElementosHermanoIzquierdo+"").effect("pulsate",{times:5},1000);
	$("#"+idDivElementoPadre+"").effect("pulsate",{times:5},1000,ejecutarProximaAnimacion);
}


function fusionConHermanoDerecho(altura,nodo,posicionElemento,elementoIntermedioPadre)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano derecho del nodo donde se produce underflow
	var nodoHermanoDerecho=nodoElementos.nextSibling;
	var idNodoHermanoDerecho=nodoHermanoDerecho.id;
	//me quedo con el contenedor de elementos del hermano derecho
	var contenedorElementosHermanoDerecho=nodoHermanoDerecho.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	//me quedo con el padre de los nodos que estan fusionando
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//pregunto si el nodo donde se produjo underflow tiene hijos
	if(nodoElementos.childNodes.length == 1)//no tiene hijos
	{
		
		if((padreNodos.childNodes.length==3)&&(altura==1))//el padre tiene solo dos hijos que son los que estan fusionando y estan en la altura uno
		{
			//paso los elementos de los nodos que fusionan al padre
			pasarElementosDeNodo(contenedorElementos,contenedorElementosPadre);
			pasarElementosDeNodo(contenedorElementosHermanoDerecho,contenedorElementosPadre);
			//borro los enlaces
			borrarEnlaces();
			//guardo el numero de nodo a borrar para reutilizarlo
			vectorNumeracion.push(parseFloat(nodoHermanoDerecho.style.zIndex));
			vectorNumeracion.push(parseFloat(padreNodos.style.zIndex));
			vectorNumeracion.sort(function(a,b){return a-b;});
			//actualizo el numero de nodo
			padreNodos.style.zIndex=nodoElementos.style.zIndex;
			//realizo el efecto de fusion
			$('#'+idNodoElementos).animate({top:0,left:0},1250,function(){padreNodos.removeChild(nodoElementos)});
			$('#'+idNodoHermanoDerecho).animate({top:0,left:0},1250,function(){padreNodos.removeChild(nodoHermanoDerecho);var container=document.getElementById("contenedor"); posicionContenedor=position(container);rotularNodo(padreNodos,posicionContenedor);});
			var mensaje="- Fusi\u00f3n con hermano derecho. Disminuci\u00f3n de altura.";
			mostrarMensajeOperacion(mensaje);
			habilitarBotones();
			
		}else//el padre tiene mas de dos hijos o es altura mayor a uno
		{
			//paso los elementos que quedaron al nodo derecho del nodo que produjo underflow
			pasarElementosDeNodo(contenedorElementos,contenedorElementosHermanoDerecho);
			//paso el elemento divisor del padre al nodo derecho
			idContenedorElementosHermanoDerecho=contenedorElementosHermanoDerecho.id;
			var alturaDivDestino=idContenedorElementosHermanoDerecho[1];
			var nodoDivDestino=idContenedorElementosHermanoDerecho.substr(2,idContenedorElementosHermanoDerecho.length-2);
			ordenarNodo(alturaDivDestino,nodoDivDestino,elementoIntermedioPadre);
			borrarEnlaces();
			//guardo el numero de nodo reutilizable
			vectorNumeracion.push(parseFloat(nodoHermanoDerecho.style.zIndex));
			vectorNumeracion.sort(function(a,b){return a-b;});
			nodoHermanoDerecho.style.zIndex=nodoElementos.style.zIndex;
			//realizo el efecto de fusion y elimino el nodo en underflow
			var movimientoAIzquierda=parseFloat(nodoElementos.style.left);
			$('#'+idNodoHermanoDerecho).animate({left:movimientoAIzquierda},1250,function()
				{	padreNodos.removeChild(nodoElementos);
					//decremento todos los id de los nodos que quedaron
					decrementarIdAHermanosPosteriores(nodo,altura);
					var divAbuelo=padreNodos.parentNode;
					centrarArbol(padreNodos);
					setTimeout("moverArbolParaScroll()",1000);
				}
			);
			var mensaje="- Fusi\u00f3n con hermano derecho.";
			mostrarMensajeOperacion(mensaje);
		}
	}else
	{
		if((padreNodos.childNodes.length==3)&&(altura==1))//el padre tiene solo dos hijos que son los que estan fusionando y estan en la altura uno
		{
			borrarEnlaces();
			//paso los elementos que quedaron al nodo derecho del nodo que produjo underflow
			pasarElementosDeNodo(contenedorElementos,contenedorElementosHermanoDerecho);
			//paso el elemento divisor del padre al nodo derecho
			idContenedorElementosHermanoDerecho=contenedorElementosHermanoDerecho.id;
			var alturaDivDestino=idContenedorElementosHermanoDerecho[1];
			var nodoDivDestino=idContenedorElementosHermanoDerecho.substr(2,idContenedorElementosHermanoDerecho.length-2);
			ordenarNodo(alturaDivDestino,nodoDivDestino,elementoIntermedioPadre);
			//paso los hijos del nodo en underflow al hermano derecho
			var divHijo=nodoElementos.lastChild;
			for(var x=0;x<=nodoElementos.childNodes.length-1;x++)
			{
				var primerHijo=nodoHermanoDerecho.firstChild.nextSibling;
				//inserto en la primer posicion
				var divAuxiliar=divHijo.previousSibling;
				nodoHermanoDerecho.insertBefore(divHijo,primerHijo);
				divHijo=divAuxiliar;
			}
			//guardo los numeros de nodos reutilizables
			vectorNumeracion.push(parseFloat(nodoHermanoDerecho.style.zIndex));
			vectorNumeracion.push(parseFloat(padreNodos.style.zIndex));
			vectorNumeracion.sort(function(a,b){return a-b;});
			nodoHermanoDerecho.style.zIndex=nodoElementos.style.zIndex;
			centrarHijosEnFuncionAPadre(nodoHermanoDerecho.id);
			//borro el nodo en underflow
			padreNodos.removeChild(nodoElementos);
			contenedor=document.getElementById("contenedor");
			padreNodos.removeChild(nodoHermanoDerecho);
			contenedor.appendChild(nodoHermanoDerecho);
			var topNuevo=parseFloat(padreNodos.style.top);
			var leftNuevo=parseFloat(padreNodos.style.left);
			contenedor.removeChild(padreNodos);
			$('#'+idNodoHermanoDerecho).animate({top:topNuevo,left:leftNuevo},1250,function()
				{	
					decrementarIdAHermanosPosteriores(nodo,altura);
					decrementarAltura(nodoHermanoDerecho);
					setTimeout("moverArbolParaScroll()",1000);
				}
			);
			var mensaje="- Fusi\u00f3n con hermano derecho. Disminuci\u00f3n de altura.";
			mostrarMensajeOperacion(mensaje);
		}else
		{
			if((padreNodos.childNodes.length==3)&&(altura!=1))//el padre tiene solo dos hijos que son los que estan fusionando y estan en altura mayor a 1
			{
				//uno los elementos del nodo en underflow en el nodo de la derecha, en este nodo quedan todos los hijos, borro el nodo en underflow, dismuniyo en uno los id de los nodos mayores de la misma altura, pongo el nodo que unio en left 0, espero la proxima accion de la recursion 
				borrarEnlaces();
				//paso los elementos que quedaron al nodo derecho del nodo que produjo underflow
				pasarElementosDeNodo(contenedorElementos,contenedorElementosHermanoDerecho);
				//paso el elemento divisor del padre al nodo derecho
				idContenedorElementosHermanoDerecho=contenedorElementosHermanoDerecho.id;
				var alturaDivDestino=idContenedorElementosHermanoDerecho[1];
				var nodoDivDestino=idContenedorElementosHermanoDerecho.substr(2,idContenedorElementosHermanoDerecho.length-2);
				ordenarNodo(alturaDivDestino,nodoDivDestino,elementoIntermedioPadre);
				//paso los hijos del nodo en underflow al hermano derecho
				var divHijo=nodoElementos.lastChild;
				for(var x=0;x<=nodoElementos.childNodes.length-1;x++)
				{
					var primerHijo=nodoHermanoDerecho.firstChild.nextSibling;
					//inserto en la primer posicion
					var divAuxiliar=divHijo.previousSibling;
					nodoHermanoDerecho.insertBefore(divHijo,primerHijo);
					divHijo=divAuxiliar;
				}
				//guardo el numero de nodo reutilizable
				vectorNumeracion.push(parseFloat(nodoHermanoDerecho.style.zIndex));
				vectorNumeracion.sort(function(a,b){return a-b;});
				nodoHermanoDerecho.style.zIndex=nodoElementos.style.zIndex;
				//borro el nodo en underflow
				padreNodos.removeChild(nodoElementos);
				decrementarIdAHermanosPosteriores(nodo,altura);
				nodoHermanoDerecho.style.left=0;
				centrarHijosEnFuncionAPadre(nodoHermanoDerecho.id);
				centrarArbol(padreNodos);
				setTimeout("moverArbolParaScroll()",1000);
				var mensaje="- Fusi\u00f3n con hermano derecho.";
				mostrarMensajeOperacion(mensaje);
			}else
			{
				//uno los elementos del nodo en underflow en el nodo de la derecha, en este nodo quedan todos los hijos, borro el nodo en underflow, dismuniyo en uno los id de los nodos mayores de la misma altura, renderizo al padre teniendo cuidado con la posicion de los hijos
				borrarEnlaces();
				//paso los elementos que quedaron al nodo derecho del nodo que produjo underflow
				pasarElementosDeNodo(contenedorElementos,contenedorElementosHermanoDerecho);
				//paso el elemento divisor del padre al nodo derecho
				idContenedorElementosHermanoDerecho=contenedorElementosHermanoDerecho.id;
				var alturaDivDestino=idContenedorElementosHermanoDerecho[1];
				var nodoDivDestino=idContenedorElementosHermanoDerecho.substr(2,idContenedorElementosHermanoDerecho.length-2);
				ordenarNodo(alturaDivDestino,nodoDivDestino,elementoIntermedioPadre);
				//paso los hijos del nodo en underflow al hermano derecho
				var divHijo=nodoElementos.lastChild;
				for(var x=0;x<=nodoElementos.childNodes.length-1;x++)
				{
					var primerHijo=nodoHermanoDerecho.firstChild.nextSibling;
					//inserto en la primer posicion
					var divAuxiliar=divHijo.previousSibling;
					nodoHermanoDerecho.insertBefore(divHijo,primerHijo);
					divHijo=divAuxiliar;
				}
				//guardo el numero de nodo reutilizable
				vectorNumeracion.push(parseFloat(nodoHermanoDerecho.style.zIndex));
				vectorNumeracion.sort(function(a,b){return a-b;});
				nodoHermanoDerecho.style.zIndex=nodoElementos.style.zIndex;
				//borro el nodo en underflow
				padreNodos.removeChild(nodoElementos);
				decrementarIdAHermanosPosteriores(nodo,altura);
				centrarHijosEnFuncionAPadre(nodoHermanoDerecho.id);
				centrarArbol(padreNodos);
				setTimeout("moverArbolParaScroll()",1000);
				var mensaje="- Fusi\u00f3n con hermano derecho.";
				mostrarMensajeOperacion(mensaje);
			}
			
		}
	}
}

function fusionConHermanoIzquierdo(altura,nodo,posicionElemento,elementoIntermedioPadre,posicionNodo)
{
	var idElementoAEliminar=""+altura+nodo+posicionElemento;
	var divElementoAEliminar=document.getElementById(idElementoAEliminar);
	//me quedo con el nodo donde esta el elemento a borrar
	var nodoElementos=divElementoAEliminar.parentNode.parentNode;
	var idNodoElementos=nodoElementos.id;
	//me quedo con el hermano izquierdo del nodo donde se produce underflow
	var nodoHermanoIzquierdo=nodoElementos.previousSibling;
	var idNodoHermanoIzquierdo=nodoHermanoIzquierdo.id;
	//me quedo con el contenedor de elementos del hermano izquierdo
	var contenedorElementosHermanoIzquierdo=nodoHermanoIzquierdo.firstChild;
	//me quedo con el contenedor de elementos del nodo que borre elemento
	var contenedorElementos=nodoElementos.firstChild;
	//me quedo con el padre de los nodos que estan fusionando
	var padreNodos=contenedorElementos.parentNode.parentNode;
	//me quedo con el contenedor de elementos del padre
	var contenedorElementosPadre=padreNodos.firstChild;
	//pregunto si el nodo donde se produjo underflow tiene hijos
	if(nodoElementos.childNodes.length == 1)//no tiene hijos
	{
		
		if((padreNodos.childNodes.length==3)&&(altura==1))//el padre tiene solo dos hijos que son los que estan fusionando
		{
			//paso los elementos de los nodos que fusionan al padre
			pasarElementosDeNodo(contenedorElementos,contenedorElementosPadre);
			pasarElementosDeNodo(contenedorElementosHermanoIzquierdo,contenedorElementosPadre);
			//borro los enlaces
			borrarEnlaces();
			//guardo el numero de nodo a borrar para reutilizarlo
			vectorNumeracion.push(parseFloat(nodoElementos.style.zIndex));
			vectorNumeracion.push(parseFloat(padreNodos.style.zIndex));
			vectorNumeracion.sort(function(a,b){return a-b;});
			//actualizo el numero de nodo
			padreNodos.style.zIndex=nodoHermanoIzquierdo.style.zIndex;
			//realizo el efecto de fusion
			$('#'+idNodoElementos).animate({top:0,left:0},1250,function(){padreNodos.removeChild(nodoElementos)});
			$('#'+idNodoHermanoIzquierdo).animate({top:0,left:0},1250,function(){padreNodos.removeChild(nodoHermanoIzquierdo);var container=document.getElementById("contenedor"); posicionContenedor=position(container);rotularNodo(padreNodos,posicionContenedor);});
			if(posicionNodo=="extremo")
			{
				var mensaje="- Fusi\u00f3n con hermano izquierdo. Disminuci\u00f3n de altura.";
			}else
			{
				var mensaje="- Fusi\u00f3n con hermano izquierdo. Disminuci\u00f3n de altura.";
			}
			mostrarMensajeOperacion(mensaje);
			habilitarBotones();
			
		}else//el padre tiene mas de dos hijos o la altura es mayor a uno
		{
			//paso los elementos que quedaron al nodo izquierdo del nodo que produjo underflow
			pasarElementosDeNodo(contenedorElementos,contenedorElementosHermanoIzquierdo);
			//paso el elemento divisor del padre al nodo izquierdo
			idContenedorElementosHermanoIzquierdo=contenedorElementosHermanoIzquierdo.id;
			var alturaDivDestino=idContenedorElementosHermanoIzquierdo[1];
			var nodoDivDestino=idContenedorElementosHermanoIzquierdo.substr(2,idContenedorElementosHermanoIzquierdo.length-2);
			ordenarNodo(alturaDivDestino,nodoDivDestino,elementoIntermedioPadre);
			borrarEnlaces();
			//guardo el numero de nodo reutilizable
			vectorNumeracion.push(parseFloat(nodoElementos.style.zIndex));
			vectorNumeracion.sort(function(a,b){return a-b;});
			//realizo el efecto de fusion y elimino el nodo en underflow
			var movimientoAIzquierda=parseFloat(nodoHermanoIzquierdo.style.left);
			$('#'+idNodoElementos).animate({left:movimientoAIzquierda},1250,function()
				{	padreNodos.removeChild(nodoElementos);
					decrementarIdAHermanosPosteriores(nodo,altura);
					centrarArbol(padreNodos);
					setTimeout("moverArbolParaScroll()",1000);
				}
			);
			if(posicionNodo=="extremo")
			{
				var mensaje="- Fusi\u00f3n con hermano Izquierdo.";
			}else
			{
				var mensaje="- Fusi\u00f3n con hermano Izquierdo.";
			}
			mostrarMensajeOperacion(mensaje);
		}
	}else
	{
		if((padreNodos.childNodes.length==3)&&(altura==1))//el padre tiene solo dos hijos que son los que estan fusionando y estan en la altura uno
		{
			//tengo que pasar los elementos y los hijos a alguno de los dos y reemplazar la raiz por este nodo teniendo en cuneta los id de los divs que tienen que decrementar su altura
			borrarEnlaces();
			//paso los elementos que quedaron al nodo izquierdo del nodo que produjo underflow
			pasarElementosDeNodo(contenedorElementos,contenedorElementosHermanoIzquierdo);
			//paso el elemento divisor del padre al nodo izquierdo
			idContenedorElementosHermanoIzquierdo=contenedorElementosHermanoIzquierdo.id;
			var alturaDivDestino=idContenedorElementosHermanoIzquierdo[1];
			var nodoDivDestino=idContenedorElementosHermanoIzquierdo.substr(2,idContenedorElementosHermanoIzquierdo.length-2);
			ordenarNodo(alturaDivDestino,nodoDivDestino,elementoIntermedioPadre);
			//paso los hijos del nodo en underflow al hermano izquierdo
			var divHijo=nodoElementos.firstChild.nextSibling;
			for(var x=0;x<=nodoElementos.childNodes.length-1;x++)
			{
				//inserto en la ultima posicion
				if(divHijo.nextSibling!=undefined)
				{
					var divAuxiliar=divHijo.nextSibling;
				}
				nodoHermanoIzquierdo.appendChild(divHijo);
				divHijo=divAuxiliar;	
			}
			//guardo los numeros de nodos reutilizables
			vectorNumeracion.push(parseFloat(nodoElementos.style.zIndex));
			vectorNumeracion.push(parseFloat(padreNodos.style.zIndex));
			vectorNumeracion.sort(function(a,b){return a-b;});
			centrarHijosEnFuncionAPadre(nodoHermanoIzquierdo.id);
			//borro el nodo en underflow
			padreNodos.removeChild(nodoElementos);
			var contenedor=document.getElementById("contenedor");
			padreNodos.removeChild(nodoHermanoIzquierdo);
			contenedor.appendChild(nodoHermanoIzquierdo);
			var topNuevo=parseFloat(padreNodos.style.top);
			var leftNuevo=parseFloat(padreNodos.style.left);
			contenedor.removeChild(padreNodos);
			$('#'+idNodoHermanoIzquierdo).animate({top:topNuevo,left:leftNuevo},1250,function()
				{	
					decrementarIdAHermanosPosteriores(nodo,altura);
					decrementarAltura(nodoHermanoIzquierdo);
					setTimeout("moverArbolParaScroll()",1000);
				}
			);
			if(posicionNodo=="extremo")
			{
				var mensaje="- Fusi\u00f3n con hermano izquierdo. Disminuci\u00f3n de altura.";
			}else
			{
				var mensaje="- Fusi\u00f3n con hermano izquierdo. Disminuci\u00f3n de altura.";
			}
			mostrarMensajeOperacion(mensaje);

		}else
		{
			if((padreNodos.childNodes.length==3)&&(altura!=1))//el padre tiene solo dos hijos que son los que estan fusionando y estan en altura mayor a 1
			{
				//uno los elementos del nodo en underflow en el nodo de la izquierda, en este nodo quedan todos los hijos, borro el nodo en underflow, dismuniyo en uno los id de los nodos mayores de la misma altura, pongo el nodo que unio en left 0, espero la proxima accion de la recursion 
				borrarEnlaces();
				//paso los elementos que quedaron al nodo izquierdo del nodo que produjo underflow
				pasarElementosDeNodo(contenedorElementos,contenedorElementosHermanoIzquierdo);
				//paso el elemento divisor del padre al nodo izquierdo
				var idContenedorElementosHermanoIzquierdo=contenedorElementosHermanoIzquierdo.id;
				var alturaDivDestino=idContenedorElementosHermanoIzquierdo[1];
				var nodoDivDestino=idContenedorElementosHermanoIzquierdo.substr(2,idContenedorElementosHermanoIzquierdo.length-2);
				ordenarNodo(alturaDivDestino,nodoDivDestino,elementoIntermedioPadre);
				//paso los hijos del nodo en underflow al hermano izquierdo
				var divHijo=nodoElementos.firstChild.nextSibling;
				for(var x=0;x<=nodoElementos.childNodes.length-1;x++)
				{
					//inserto en la ultima posicion
					if(divHijo.nextSibling!=undefined)
					{
						var divAuxiliar=divHijo.nextSibling;
					}
					nodoHermanoIzquierdo.appendChild(divHijo);
					divHijo=divAuxiliar;
				
				}
				//guardo el numero de nodo reutilizable
				vectorNumeracion.push(parseFloat(nodoElementos.style.zIndex));
				vectorNumeracion.sort(function(a,b){return a-b;});
				//borro el nodo en underflow
				padreNodos.removeChild(nodoElementos);
				decrementarIdAHermanosPosteriores(nodo,altura);
				nodoHermanoIzquierdo.style.left=0;
				centrarHijosEnFuncionAPadre(nodoHermanoIzquierdo.id);
				centrarArbol(padreNodos);
				setTimeout("moverArbolParaScroll()",1000);
				if(posicionNodo=="extremo")
				{
					var mensaje="- Fusi\u00f3n con hermano izquierdo.";
				}else
				{
					var mensaje="- Fusi\u00f3n con hermano izquierdo.";
				}
					mostrarMensajeOperacion(mensaje);
			}else
			{
				//uno los elementos del nodo en underflow en el nodo de la izquierda, en este nodo quedan todos los hijos, borro el nodo en underflow, dismuniyo en uno los id de los nodos mayores de la misma altura, renderizo al padre teniendo cuidado con la posicion de los hijos
				borrarEnlaces();
				//paso los elementos que quedaron al nodo izquierdo del nodo que produjo underflow
				pasarElementosDeNodo(contenedorElementos,contenedorElementosHermanoIzquierdo);
				//paso el elemento divisor del padre al nodo derecho
				var idContenedorElementosHermanoIzquierdo=contenedorElementosHermanoIzquierdo.id;
				var alturaDivDestino=idContenedorElementosHermanoIzquierdo[1];
				var nodoDivDestino=idContenedorElementosHermanoIzquierdo.substr(2,idContenedorElementosHermanoIzquierdo.length-2);
				ordenarNodo(alturaDivDestino,nodoDivDestino,elementoIntermedioPadre);
				//paso los hijos del nodo en underflow al hermano izquierdo
				var divHijo=nodoElementos.firstChild.nextSibling;
				for(var x=0;x<=nodoElementos.childNodes.length-1;x++)
				{
					//inserto en la ultima posicion
					if(divHijo.nextSibling!=undefined)
					{
						var divAuxiliar=divHijo.nextSibling;
					}
					nodoHermanoIzquierdo.appendChild(divHijo);
					divHijo=divAuxiliar;
				
				}
				//guardo el numero de nodo reutilizable
				vectorNumeracion.push(parseFloat(nodoElementos.style.zIndex));
				vectorNumeracion.sort(function(a,b){return a-b;});
				//borro el nodo en underflow
				padreNodos.removeChild(nodoElementos);
				decrementarIdAHermanosPosteriores(nodo,altura);
				centrarHijosEnFuncionAPadre(nodoHermanoIzquierdo.id);
				centrarArbol(padreNodos);
				setTimeout("moverArbolParaScroll()",1000);
				if(posicionNodo=="extremo")
			{
				var mensaje="- Fusi\u00f3n con hermano izquierdo.";
			}else
			{
				var mensaje="- Fusi\u00f3n con hermano izquierdo.";
			}
			   mostrarMensajeOperacion(mensaje);
			}
		}
	}
}


function pasarElementosDeNodo(divOrigen,divDestino)
{
	    var divParcial=divOrigen.firstChild;
		var idDivDestino=divDestino.id;
		var alturaDivDestino=idDivDestino[1];
		var nodoDivDestino=idDivDestino.substr(2,idDivDestino.length-2);
		for(var i=1;i < divOrigen.childNodes.length;i++)
		{
			if(divParcial.hasChildNodes())
			{
				elemento=divParcial.firstChild.nodeValue;
				ordenarNodo(alturaDivDestino,nodoDivDestino,elemento);
			}
			if(divParcial.nextSibling!=undefined)
			{
				divParcial=divParcial.nextSibling;
			}
		}
}


function decrementarIdAHermanosPosteriores(numeroNodo,altura)
{
	for(var j=172;j!=0;j--)//172 es el numero maximo de nodos con orden 9 y altura 4
	{
		
		var idHermano="N"+altura+j;
		var divHermano=document.getElementById(idHermano);
		if(divHermano != undefined)
		{
			if(j > numeroNodo)
			{
					divHermano.id="N"+altura+parseInt(j-1);
					var divElementos=divHermano.firstChild;
					divElementos.id="E"+altura+parseInt(j-1);
					divElemento=divElementos.firstChild;
					for(var h=0;h<=divElementos.childNodes.length-1;h++)
					{
						var idElemento=divElemento.id;
						if(idElemento[0]=="P")
						{
							divElemento.id="P"+altura+parseInt(j-1)+idElemento[idElemento.length-1];
						}else
						{
							divElemento.id=""+altura+parseInt(j-1)+idElemento[idElemento.length-1];
						}
						divElemento=divElemento.nextSibling;
					}
			}
		}
	}
}

function decrementarIdDivsHermanos(altura)
{
	
	for(var j=172;j!=0;j--)//172 es el numero maximo de nodos con orden 9 y altura 4
	{
		
		var idHermano="N"+altura+j;
		var divHermano=document.getElementById(idHermano);
		if(divHermano != undefined)
		{
				divHermano.id="N"+altura+parseInt(j-1);
				var divElementos=divHermano.firstChild;
				divElementos.id="E"+altura+parseInt(j-1);
				divElemento=divElementos.firstChild;
				for(var h=0;h<=divElementos.childNodes.length-1;h++)
				{
					var idElemento=divElemento.id;
					if(idElemento[0]=="P")
					{
						divElemento.id="P"+altura+parseInt(j-1)+idElemento[idElemento.length-1];
					}else
					{
						divElemento.id=""+altura+parseInt(j-1)+idElemento[idElemento.length-1];
					}
					divElemento=divElemento.nextSibling;
				}
			
		}
	}
}

function intercambiarElementos(alturaGraficoMCD,nodoGraficoMCD,posicionElementoGraficoMCD,alturaGrafico,nodoGrafico,posicionElementoGrafico)
{
	
	var idDivElementoMCD=""+alturaGraficoMCD+nodoGraficoMCD+posicionElementoGraficoMCD;
	var divMCD=document.getElementById(idDivElementoMCD);
	var elementoMasChicoDerecho=divMCD.firstChild.nodeValue;
	var idElementoABorrar=""+alturaGrafico+nodoGrafico+posicionElementoGrafico;
	var divABorrar=document.getElementById(idElementoABorrar);
	var elementoABorrar=divABorrar.firstChild.nodeValue;
	//intercambio los elementos
	//hago titilar los elementos a intercambiar
	$("#"+idDivElementoMCD+"").effect("pulsate",{times:5},500);
	$("#"+idElementoABorrar+"").effect("pulsate",{times:5},500,function(){
			//realizo el intercambio
			divABorrar.removeChild(divABorrar.lastChild);
			divABorrar.appendChild(document.createTextNode(elementoMasChicoDerecho));
			divMCD.removeChild(divMCD.lastChild);
			divMCD.appendChild(document.createTextNode(elementoABorrar));
			setTimeout("ejecutarProximaAnimacion()",1000);
			
		}
	);
}

function destruirArbol()
{
	var contenedor=document.getElementById("contenedor");
	var raiz=document.getElementById("N00");
	var historial=document.getElementById("explicacionHistorial");
	while (historial.hasChildNodes()) 
	{
    	historial.removeChild(historial.lastChild);
	}
	contenedor.removeChild(raiz);
	borrarEnlaces();
}

//FINALIZAR PARTIR NODO
function finalizarPartirNodo(idDivEnglobaDesbordado,idDivNuevoNodoIzquierdo,idDivNuevoNodoDerecho,idDivPadre,numeroNodo,alturaNodo)
{
	/*me quedo con el div provisorio que engloba al nodo desbordado*/
	var divEnglobaDesbordado=document.getElementById(idDivEnglobaDesbordado);
	/*me quedo con el nuevo nodo izquierdo*/
	var nuevoNodoIzquierdo=document.getElementById(idDivNuevoNodoIzquierdo);
	/*me quedo con el nuevo nodo derecho*/
	var nuevoNodoDerecho=document.getElementById(idDivNuevoNodoDerecho);
	/*me quedo con el nodo padre del nodo desbordado*/
	var divPadreDesbordado=document.getElementById(idDivPadre);
	/*determino si el nodo desbordado es el mas izq, el mas der o intermedio*/
	var alerta=divPadreDesbordado.childNodes.length-2;
	//me quedo con la raiz del arbol
	var divRaiz=document.getElementById("N00");
	/*inserto los nodos en la posicion correspondiente*/
	var topNodoIzquierdo=parseFloat(divEnglobaDesbordado.style.top);
	var topNodoDerecho=parseFloat(divEnglobaDesbordado.style.top);
	nuevoNodoIzquierdo.style.top=topNodoIzquierdo;
	nuevoNodoDerecho.style.top=topNodoDerecho;
	divPadreDesbordado.insertBefore(nuevoNodoIzquierdo,divEnglobaDesbordado);
	divPadreDesbordado.insertBefore(nuevoNodoDerecho,divEnglobaDesbordado);
	/*elimino el nodo desbordado*/
	divPadreDesbordado.removeChild(divEnglobaDesbordado);
	if(nuevoNodoIzquierdo.childNodes.length > 1)
	{
		centrarHijosEnFuncionAPadre(nuevoNodoIzquierdo.id);
		centrarHijosEnFuncionAPadre(nuevoNodoDerecho.id);
	}
	//centro el arbol
	centrarArbol(divPadreDesbordado);
	/*limpio las explicaciones de los nodos*/
	var divParcialIzquierdo=nuevoNodoIzquierdo.firstChild;
	var divElementoIzquierdo=divParcialIzquierdo.firstChild.nextSibling;
	var divParcialDerecho=nuevoNodoDerecho.firstChild;
	var divElementoDerecho=divParcialDerecho.firstChild.nextSibling;
	for(x=0;x<=((divParcialIzquierdo.childNodes.length-1)/2)-1;x++)
	{
			divElementoIzquierdo.style.backgroundColor=color_nodo;
			divElementoIzquierdo=divElementoIzquierdo.nextSibling.nextSibling;
	}
	for(y=0;y<=((divParcialDerecho.childNodes.length-1)/2)-1;y++)
	{
			divElementoDerecho.style.backgroundColor=color_nodo;
			divElementoDerecho=divElementoDerecho.nextSibling.nextSibling;
	}
	/*borro los elementos de explicacion*/
	divExplicacionIzquierdo=document.getElementById('explicacionNuevoNodoIzquierdo');
	divParcialIzquierdo.removeChild(divExplicacionIzquierdo);
	divExplicacionDerecho=document.getElementById('explicacionNuevoNodoDerecho');
	divParcialDerecho.removeChild(divExplicacionDerecho);
	borrarEnlaces();
	setTimeout("moverArbolParaScroll()",20)
}

function centrarArbol(divPadre)
{
	centrarHijosEnFuncionAPadre(divPadre.id);
	while(divPadre.id != "N00")
	{
		divPadre=divPadre.parentNode;
		centrarHijosEnFuncionAPadre(divPadre.id);
	}
}

function deshabilitarBotones()
{
	var botonInsertar=document.getElementById("insertar");
	botonInsertar.disabled=true;
	var botonEliminar=document.getElementById("eliminar");
	botonEliminar.disabled=true;
	var botonBuscar=document.getElementById("busco");
	botonBuscar.disabled=true;
	var botonLimpiar=document.getElementById("resetear");
	botonLimpiar.disabled=true;
	var botonCrear=document.getElementById("crearArbol");
	botonCrear.disabled=true;
	var editInsercion=document.getElementById("numeroAInsertar");
	editInsercion.disabled=true;
	var editEliminacion=document.getElementById("numeroAEliminar");
	editEliminacion.disabled=true;
	var editBuscar=document.getElementById("numeroABuscar");
	editBuscar.disabled=true;
	var editOrden=document.getElementById("orden");
	editOrden.disabled=true;
	var editTipoArbol=document.getElementById("tipoArbol");
	editTipoArbol.disabled=true;
}

function habilitarBotones()
{
	var botonInsertar=document.getElementById("insertar");
	botonInsertar.disabled=false;
	var botonEliminar=document.getElementById("eliminar");
	botonEliminar.disabled=false;
	var botonBuscar=document.getElementById("busco");
	botonBuscar.disabled=false;
	var botonLimpiar=document.getElementById("resetear");
	botonLimpiar.disabled=false;
	var botonCrear=document.getElementById("crearArbol");
	botonCrear.disabled=false;
	var editInsercion=document.getElementById("numeroAInsertar");
	editInsercion.disabled=false;
	var editEliminacion=document.getElementById("numeroAEliminar");
	editEliminacion.disabled=false;
	var editBuscar=document.getElementById("numeroABuscar");
	editBuscar.disabled=false;
	var editOrden=document.getElementById("orden");
	editOrden.disabled=false;
	var editTipoArbol=document.getElementById("tipoArbol");
	editTipoArbol.disabled=false;
}