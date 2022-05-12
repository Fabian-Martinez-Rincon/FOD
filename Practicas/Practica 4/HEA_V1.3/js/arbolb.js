document.write("<script type='text/javascript' src='js/controladorArbolB.js'></script>");
var minElementos;
var maxElementos;//variable que se setea en funcion del orden que selecciona el usuario

function NodoB(){
	var me=this;
	me.elementos=new Array();
	me.hijos=new Array();
	me.setearValores=function(orden)
	{
		ordenGlobal=orden;
		maxElementos=orden-1;
		minElementos=parseInt((orden/2)-1);
		mensaje="- Se creo el \u00e1rbol B con un orden "+orden;
		encolarOperacion("crearArbol("+orden+","+maxElementos+")");	
		ejecutarAnimacion();
		encolarOperacion("mostrarMensajeOperacion('"+mensaje+"')");	
	}
	me.buscarPosicionDeElemento= function (elemento){
		if(me.elementos.length!=0)
		{
			posicion=me.elementos.length;
			encontrado=false;
			i=0;
			while(( i <= me.elementos.length-1)&&( encontrado == false))
			{
				if(elemento < me.elementos[i])
				{
					posicion=i;
					encontrado=true;
				}
				i++;
			}
			return posicion;
		}else
		{	
			return 0;
		}
	}//fin de buscarPosicionDeElemento
	
	me.buscarElemento = function (elemento){ 
		if(me.elementos.indexOf(elemento)!=-1){//existe elemento en el nodo esto hay que implementarlo a mano porque no funca en IE7
			return me.elementos.indexOf(elemento)+"E";//retorno la posicion del elemento en el nodo
		}else
			{
				if(me.hijos.length == 0){//el nodo no tiene hijos
					var posicionABuscar=me.buscarPosicionDeElemento(elemento);
					return "elementos["+posicionABuscar+"]";//no existe el elemento devolver la posicion de insercion
				}else{
						
						var posicionABuscar=me.buscarPosicionDeElemento(elemento);
						if (me.hijos.length >= posicionABuscar){
							return "hijos["+ posicionABuscar+"]."+ me.hijos[posicionABuscar].buscarElemento(elemento);
						}else
						{
							return "elementos["+posicionABuscar+"]";
							}
						
					}
			}
		
	}//fin de buscarElemento
	
	me.insertarElemento = function (elemento){ 
		var expresion=me.buscarElemento(elemento);
		if(expresion[expresion.length-1]=="E"){
			expresion="me."+expresion;
			var expresionCompleta=expresion.substring(0,expresion.length-3)+".elementos["+expresion[expresion.length-2]+"]";
			//calculo la altura donde se encuentra el elemento en el grafico
			var alturaGrafico=me.calcularAlturaParaGrafico(expresionCompleta);
			//calculo el nodo donde se encuentra el elemento en el grafico
			var posicionPadre=expresion.substr(expresion.length-14,1);//posicion del nodo padre  que apunta al hijo actual
			var nodoGrafico=me.calcularNodoParaGrafico(expresionCompleta,alturaGrafico,posicionPadre);
			//calculo la posicion dentro del nodo donde se encuentra el elemento
			var posicionElementoGrafico=expresion[expresion.length-2];
			encolarOperacion("marcarElementoExistente("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+");");
			ejecutarAnimacion();
			mensaje="- Ha intentado insertar el elemento "+elemento+" el cual ya existe en el \u00e1rbol";
			encolarOperacion("mostrarMensajeOperacion('"+mensaje+"')");
		}else{	
				 var expresionCompleta="me."+expresion;
				 var expresion="me."+expresion.substring(0,expresion.length-3);//me quedo con la cadena cortada hasta elementos
				 me.insertoElemento(elemento,expresion,expresionCompleta,"normal");
			  }	
		
	}//fin de insertarElemento
	
	me.insertoElemento = function (elemento,expresion,expresionCompleta,vueltaProceso){ 
		
		var longitudNodo=eval(expresion).length;
		//calculo la altura del arbol donde se va a insertar el nuevo elemento para poder graficar
		var alturaGrafico=me.calcularAlturaParaGrafico(expresionCompleta);
		if(alturaGrafico < 3)//PRECONDICION SE INSERTA HASTA LA ALTURA 4 DEL ARBOL
		{
			//calculo el numero de nodo donde se va a insertar el nuevo elemento para poder graficar
			if(alturaGrafico < 2)
			{
				var posicionPadre=0;
			}else
			{
				var posicionPadre=parseInt(expresion.substr(expresion.length-21,1));//posicion del nodo padre  que apunta al hijo actual
			}
			var nodoGrafico=me.calcularNodoParaGrafico(expresionCompleta,alturaGrafico,posicionPadre);
			//calculo la posicion dentro del nodo donde se va a insertar el nuevo elemento para poder graficar
			var posicionElementoGrafico=me.calcularPosicionElementoGrafico(expresionCompleta);
			if( longitudNodo < maxElementos)
			{ //hay lugar en el nodo para insertar en elemento;
			  	eval(expresion).push(elemento);
			  	eval(expresion).sort(function(a,b){return a-b;});
			  	if(vueltaProceso=="normal")//inserto el elemento en el grafico si no viene de la recursion
			  	{
				   encolarOperacion("insertarSinOverFlow("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+");");
				   ejecutarAnimacion();
			  	}
			}else
			{
				eval(expresion).push(elemento);
				eval(expresion).sort(function(a,b){return a-b;});
				//me quedo con la posicion del elemento a promocionar
				posicionAPromocionar=parseInt(eval(expresion).length/2);
				//me quedo con el elemento que se promociona
				elementoAPromocionar=eval(expresion+"[posicionAPromocionar]");
				hijosNodoActual=expresion.substr(0,expresion.length-10);	
				//creo los dos vectores que me representan la division
				var nodoIzquierdo=new NodoB();
				var nodoDerecho=new NodoB();
				//distribuyo los elementos menores al elemento a promocionar al nodo izquierdo
				for(var i=0;i<=eval(expresion).length-1;i++)
				{
					if(eval(expresion+"[i]") < elementoAPromocionar)
					{
					    nodoIzquierdo.elementos[i]=eval(expresion+"[i]");
					}
					
				}
				//distribuyo los elementos mayores al elemento a promocionar al nodo derecho
				contadorRepeticion=0;
				for(var i=0;i<=eval(expresion).length-1;i++)
				{
					if(eval(expresion+"[i]") > elementoAPromocionar)
					{
						nodoDerecho.elementos[contadorRepeticion]=eval(expresion+"[i]");	
						contadorRepeticion++;
					}
				}
				if(expresion=="me.elementos")//es la raiz del arbol
				{
					//en el caso que el nodo a dividir tenga hijos los reubico en los nuevos nodos creados por la division
					if( me.hijos.length != 0)
					{
							posicionDerecha=0;
							for(var i=0;i<=eval(expresion).length;i++)
							{
								if(i <= posicionAPromocionar)
								{
					    			nodoIzquierdo.hijos[i]=me.hijos[i];
								}else
								{
									nodoDerecho.hijos[posicionDerecha]=me.hijos[i];
									posicionDerecha++;
								}
					
							}
					}	
					me.elementos[0]=elementoAPromocionar;
					me.elementos.length=1;
					me.hijos[0]=nodoIzquierdo;
					me.hijos[1]=nodoDerecho;
					me.hijos.length=2;
					if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
					{
					 	//deshabilito los botones mientras se este realizando la animacion
						deshabilitarBotones();
						encolarOperacion("insertarConOverflow("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
						ejecutarAnimacion();
						encolarOperacion("partirRaiz("+elementoAPromocionar+")");
					}else
					{
						deshabilitarBotones();
						encolarOperacion("insertarConOverflow("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
						encolarOperacion("partirRaiz("+elementoAPromocionar+")");
					}
					
				}else//no es la raiz del arbol
				{
					//en el caso que el nodo a dividir tenga hijos los reubico en los nuevos nodos creados por la division
					if(parseInt(eval(hijosNodoActual+".hijos").length) != 0)
					{
							posicionDerecha=0;
							for(var i=0;i<=eval(expresion).length;i++)
							{
								if(i <= posicionAPromocionar)
								{
					    			nodoIzquierdo.hijos[i]=eval(hijosNodoActual+".hijos["+i+"]");
								}else
								{
									nodoDerecho.hijos[posicionDerecha]=eval(hijosNodoActual+".hijos["+i+"]");
									posicionDerecha++;
								}
					
							}
					}	
					//me quedo con la expresion que me representa al nodo padre
					nodoPadre=expresion.substr(0,expresion.length-19);
					if(nodoPadre=="me")//me quedo con la altura del nodo padre
					{
						 //me quedo con la altura del nodo padre
					 	alturaNodoPadre=0;
					}else
					{
						alturaNodoPadre=expresion.substr(expresion.length-21,1);
					}
					//corto expresion para moverme en altura en el arbol
					expresionRecursiva=expresion.substr(0,expresion.length-19)+".elementos";
					//representa los hijos del padre del nodo que estoy parado "me.hijos"
					expresionHijosNodoPadre=expresion.substr(0,expresion.length-13);
			    	//posicion del nodo padre  que apunta al hijo actual
					posicionNodoPadre=parseInt(expresion.substr(expresion.length-12,1));
					//incremento la posicion del nodo padre asi linkeo el hermano derecho
					proximaPosicionNodoPadre=posicionNodoPadre+1;
					var expresionCompleta=expresion.substr(0,expresionCompleta.length-22)+".elementos["+posicionNodoPadre+"]";
					if( parseInt(posicionNodoPadre) == parseInt(eval(expresionHijosNodoPadre+".length-1")))//nodo a dividir el mas derecho
					{
						eval(expresionHijosNodoPadre+"["+posicionNodoPadre+"]=nodoIzquierdo");
						eval(expresionHijosNodoPadre+"["+proximaPosicionNodoPadre+"]=nodoDerecho");
						if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
						{
							deshabilitarBotones();
							encolarOperacion("insertarConOverflow("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
							ejecutarAnimacion();
							encolarOperacion("partirNodo("+alturaGrafico+','+nodoGrafico+','+posicionAPromocionar+','+elementoAPromocionar+','+alturaNodoPadre+",'"+vueltaProceso+"')");
						}else
						{
							deshabilitarBotones();
							encolarOperacion("insertarConOverflow("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
							encolarOperacion("partirNodo("+alturaGrafico+','+nodoGrafico+','+posicionAPromocionar+','+elementoAPromocionar+','+alturaNodoPadre+",'"+vueltaProceso+"')");
						}	
					}else
					{
						//tengo que hacer un corrimiento del vector de hijos del nodo padre del nodo actual
						//me quedo con todos los hijos del nodo padre del nodo que esta dividiendo
						vectorAuxiliar=new Array();
						vectorOriginal=new Array();
						vectorOriginal=eval(expresionHijosNodoPadre);
						me.copiarVector(vectorOriginal,vectorAuxiliar);
						//reemplazo las posiciones del nodo padre para que apunten a los nuevos vectores creados por la division
						//me quedo con la posicion desde donde comienzo a hacer el linkeo
						posicionInicio=parseInt(posicionNodoPadre)+2;
						//me quedo con la posicion de fin del linkeo
						posicionFin=eval(expresionHijosNodoPadre).length;
						for(i=posicionInicio;i<=posicionFin;i++)
						{
							r=i-1;
							eval(expresionHijosNodoPadre+"["+i+"]=vectorAuxiliar["+r+"]");
						}
						eval(expresionHijosNodoPadre+"["+posicionNodoPadre+"]=nodoIzquierdo");
						eval(expresionHijosNodoPadre+"["+proximaPosicionNodoPadre+"]=nodoDerecho");
						if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
						{
							deshabilitarBotones();
							encolarOperacion("insertarConOverflow("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
							ejecutarAnimacion();
							encolarOperacion("partirNodo("+alturaGrafico+','+nodoGrafico+','+posicionAPromocionar+','+elementoAPromocionar+','+alturaNodoPadre+",'"+vueltaProceso+"')");
						}else
						{
							deshabilitarBotones();
							encolarOperacion("insertarConOverflow("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
						
							encolarOperacion("partirNodo("+alturaGrafico+','+nodoGrafico+','+posicionAPromocionar+','+elementoAPromocionar+','+alturaNodoPadre+",'"+vueltaProceso+"')");
						}		
					}
					me.insertoElemento(elementoAPromocionar,expresionRecursiva,expresionCompleta,"recursion");
				}			
			}//fin del else
		}//fin del if(alturaGrafico < 4)
		else
		{
			alert("Una sesi\u00f3n de aprendizaje permite hacer inserciones hasta la altura 4, puede reiniciar el \u00e1rbol y seguir con otra sesi\u00f3n");
		}
	}//fin de insertoElemento
	
	
	me.ordenarNodo = function (expresion){ 
		
		for(var i=0 ; i<eval(expresion.length-1) ; i++)
		{
			var menor = i;
   			for(var j=i+1 ; j<eval(expresion.length) ; j++)
   			{
      			
				if (eval(expresion+"[menor] > "+ expresion+"[j]")) 
				{
					menor = j;
					}
   			}
   			var temp = eval(expresion+"[menor]");
   			eval(expresion+"[menor] ="+ expresion+"[i]");
   			eval(expresion+"[i] = temp");
		}

	}//fin de ordenarNodo
		
	me.calcularAlturaParaGrafico = function(expresionCompleta)
	{
			var hijos=expresionCompleta.substr(3,expresionCompleta.length-16);
			if(hijos=="")
			{
				return 0; //la altura es 0 por tratarse de la raiz
			}else
			{
			  return parseInt(hijos.length/8);
			}
	}//fin de CalcularAlturaParaGrafico
	
	me.calcularNodoParaGrafico=function(expresionCompleta,alturaGrafico,posicionNodoPadre)
	{
	
		if((alturaGrafico==0)||(alturaGrafico==1))
		{
			if(expresionCompleta.substr(0,expresionCompleta.length-3)=="me.elementos")//el la raiz el nodo es 0
			{
				return 0;
			}else
			{
				return(expresionCompleta.substr(expresionCompleta.length-15,1));
			}
		}else
		{
			if(alturaGrafico==2)
			{
				nodoAInsertar=expresionCompleta.substr(expresionCompleta.length-15,1);
				expresionEnAltura=expresionCompleta.substr(0,expresionCompleta.length-25);
				cantidadNodosEnAltura=0;
				for(i=0;i<=parseInt(posicionNodoPadre);i++)
				{
					cantidadHijos=parseInt(eval(expresionEnAltura+"[i].hijos.length"));
					restaHijos=cantidadHijos-nodoAInsertar;
					if(i==parseInt(posicionNodoPadre))
					{
						cantidadNodosEnAltura=cantidadNodosEnAltura +cantidadHijos -restaHijos;
					}else
					{
						cantidadNodosEnAltura=cantidadNodosEnAltura +cantidadHijos;
					}
				}
				cantidadNodosEnAltura=parseInt(cantidadNodosEnAltura);
				return cantidadNodosEnAltura;
			}else
			{
				if(alturaGrafico==3)
				{
					cantidadNodosEnAltura=0;
					primerPos=expresionCompleta.substr(expresionCompleta.length-33,1);
					if(primerPos > 0)
					{
						for(i=0;i<=primerPos-1;i++)
						{
							cantidadNodosEnAltura=cantidadNodosEnAltura+me.calcularHijosRama("me.hijos["+i+"]",1);
						}
					}
					primerCorteExpresion=expresionCompleta.substr(0,11);
					segundaPos=expresionCompleta.substr(expresionCompleta.length-24,1);
					if(segundaPos > 0)
					{
						for(j=0;j<=segundaPos-1;j++)
						{
							cantidadNodosEnAltura=cantidadNodosEnAltura+me.calcularHijosRama(primerCorteExpresion+".hijos["+j+"]",2);
						}
					}
					tercerPos=expresionCompleta.substr(expresionCompleta.length-15,1);
					cantidadNodosEnAltura=cantidadNodosEnAltura+parseInt(tercerPos);
					return cantidadNodosEnAltura;
				}else
				{
					cantidadNodosEnAltura=0;
					primerPos=expresionCompleta.substr(expresionCompleta.length-42,1);
					if(primerPos > 0)
					{
						for(i=0;i<=primerPos-1;i++)
						{
							cantidadNodosEnAltura=cantidadNodosEnAltura+me.calcularHijosRama("me.hijos["+i+"]",3);
						}
					}
					primerCorteExpresion=expresionCompleta.substr(0,11);
					segundaPos=expresionCompleta.substr(expresionCompleta.length-33,1);
					if(segundaPos > 0)
					{
						for(j=0;j<=segundaPos-1;j++)
						{
							cantidadNodosEnAltura=cantidadNodosEnAltura+me.calcularHijosRama(primerCorteExpresion+".hijos["+j+"]",4);
						}
					}
					segundoCorteExpresion=expresionCompleta.substr(0,20);
					tercerPos=expresionCompleta.substr(expresionCompleta.length-24,1);
					if(tercerPos > 0)
					{
						for(j=0;j<=tercerPos-1;j++)
						{
							cantidadNodosEnAltura=cantidadNodosEnAltura+me.calcularHijosRama(segundoCorteExpresion+".hijos["+j+"]",2);
						}
					}
					cuartaPos=expresionCompleta.substr(expresionCompleta.length-15,1);
					cantidadNodosEnAltura=cantidadNodosEnAltura+parseInt(cuartaPos);
					return cantidadNodosEnAltura;
				}
			}
		}
	}//fin de calcularNodoParaGrafico
	
	me.calcularHijosRama=function(expresionRama,altura)
	{
		cantidad=0;
		if(altura==1)
		{
			for(x=0;x<=eval(expresionRama+".hijos.length")-1;x++)
			{
				cantidad=cantidad+eval(expresionRama+".hijos["+x+"].hijos.length");
			}
		}else
		{
			if(altura==2)
			{
				cantidad=cantidad+eval(expresionRama+".hijos.length");
			}else
			{
				if(altura==3)
				{
					for(x=0;x<=eval(expresionRama+".hijos.length")-1;x++)
					{
						hijo=expresionRama+".hijos["+x+"]";
						for(y=0;y<=eval(hijo+".hijos.length")-1;y++)
						{
							cantidad=cantidad+eval(hijo+".hijos["+y+"].hijos.length");
						}
					}
				}else
				{
					if(altura==4)
					{
						for(x=0;x<=eval(expresionRama+".hijos.length")-1;x++)
						{
							cantidad=cantidad+eval(expresionRama+".hijos["+x+"].hijos.length");
						}
					}
				}
			}
			
		}
		return cantidad;
	}
	
	me.calcularPosicionElementoGrafico=function(expresionCompleta)
	{
		return (expresionCompleta.substr(expresionCompleta.length-2,1));
	}//fin de calcularPosicionElementoGrafico
	
	me.buscarElementoEnArbol = function (elemento)
	{ 
	   if(me.elementos.length != 0 )
	   {
		
				var expresion=me.buscarElemento(elemento);
				if(expresion[expresion.length-1]=="E")
				{
					expresion="me."+expresion;
					expresionCompleta=expresion.substring(0,expresion.length-3)+".elementos["+expresion[expresion.length-2]+"]";
				}else
				{
					expresionCompleta="me."+expresion;
					expresion="me."+expresion.substring(0,expresion.length-3);//me quedo con la cadena cortada hasta elementos
				}
		  		var alturaGrafico=me.calcularAlturaParaGrafico(expresionCompleta);
		 		//me quedo con el ultimo elemento en la secuencia de busqueda en el caso que no exista el elemento a buscar en el arbol
		 		if(expresion[expresion.length-1]!="E")
		 		{ //no existe el elemento en el arbol
			   		existeElemento=false;
			   		if(eval(expresionCompleta)==undefined)//el elemento a buscar es mayor a todos los elementos del nodo
			   		{
						ultimaPosicion=parseInt(expresionCompleta.substr(expresionCompleta.length-2,1))-1;
					 	expresionUltimoElemento=expresionCompleta.substr(0,expresionCompleta.length-2)+ultimaPosicion+"]";
					 	ultimoElementoABuscar=eval(expresionUltimoElemento);
			   		}else
		 			{
			 			ultimoElementoABuscar=eval(expresionCompleta);
		 			}
					var divBusqueda=document.getElementById("explicacionBusqueda");
					$("#explicacionBusqueda").removeClass("explicacionBusquedaPositiva");
                    $("#explicacionBusqueda").addClass("explicacionBusquedaNegativa");
					divBusqueda.appendChild(document.createTextNode("Elemento no encontrado"));
		  		}else
		  		{
					ultimoElementoABuscar=eval(expresionCompleta);
					existeElemento=true;
					var divBusqueda=document.getElementById("explicacionBusqueda");
					$("#explicacionBusqueda").removeClass("explicacionBusquedaNegativa");
                    $("#explicacionBusqueda").addClass("explicacionBusquedaPositiva");
					divBusqueda.appendChild(document.createTextNode("Elemento encontrado"));
				}
				corrimientoElementos=0;
				corrimientoExpresion=11;
				for(var h=0;h<=alturaGrafico;h++)
				{
		  			if(h==0)
					{
						expresionParcial="me.elementos[1]";
					}else
					{
						expresionParcial=expresionCompleta.substring(0,corrimientoExpresion)+".elementos[1]";
						corrimientoExpresion=corrimientoExpresion+9;
					}
				     if(alturaGrafico==0)
					 {
						 cantidadElementosNodo=expresionCompleta.substr(expresionCompleta.length-2,1);
					 }else
					 {
						 if(h!=alturaGrafico)
						 {
						 	corrimientoElementos=corrimientoElementos+9;
						 }else
						 {
							 corrimientoElementos=corrimientoElementos+13;
						 }
						 cantidadElementosNodo=expresionCompleta.substr(corrimientoElementos,1);
					 }
					 if( h >= 2)
					 {
						posicionPadre=expresionParcial.substr(expresionParcial.length-24,1);
					  }else
					  {
						  posicionPadre=0;
					  }
					  altura=h;
					 var nodoGrafico=me.calcularNodoParaGrafico(expresionParcial,altura,posicionPadre);
					 for(var j=0;j<=parseInt(cantidadElementosNodo);j++)
					 {
							var posicionNodo=""+h+nodoGrafico+j;
							vectorCamino.push(posicionNodo);
					 }
				}
				encolarOperacion("marcarCaminoBusqueda("+elemento+","+ultimoElementoABuscar+","+existeElemento+")");
				ejecutarAnimacion();
	   }else
	   {
		   arbolLimpio=true;
		   alert("El \u00e1rbol no tiene elementos");
		}
		
	
}//fin de buscarElementoEnArbol

	me.eliminarElemento=function(elemento,vuelta,cambio,expresionCambio)
	{
		if(me.elementos.length!=0)
		{
			if(cambio=="intercambio")/*hago esta pregunta porque si el elemento no estaba en una hoja debo quedarme con la expresion 	                                      anterior*/
			{
				expresionEliminacion=expresionCambio;
				var expresion="me."+expresionEliminacion.substring(0,expresionEliminacion.length-3)+".elementos";//me quedo con la cadena cortada hasta elementos
			}else
			{
				 var expresionEliminacion=me.buscarElemento(elemento);
				 var expresion="me."+expresionEliminacion.substring(0,expresionEliminacion.length-3)+".elementos";//me quedo con la cadena cortada hasta elementos
			}
			if(expresionEliminacion[expresionEliminacion.length-1]!="E"){
		    	alert("No existe el elemento a eliminar");
			}else
			{
				expresionEliminacion="me."+expresionEliminacion;
				expresionCompleta=expresionEliminacion.substring(0,expresionEliminacion.length-3)+".elementos["+expresionEliminacion[expresionEliminacion.length-2]+"]";
				//me quedo con el nodo donde se encuentra el elemento a eliminar
				var nodo=expresionCompleta.substr(0,expresionCompleta.length-13);
				//me quedo con la posicion del elemento a borrar en el arreglo
				var posABorrar=expresionCompleta.substr(expresionCompleta.length-2,1);
				//me quedo con el vector donde esta el elemento a borrar
				var vector=expresionCompleta.substr(0,expresionCompleta.length-3);
		        //me quedo con el padre del nodo donde esta el elemento a borrar
				var padre=expresionCompleta.substr(0,expresionCompleta.length-22);
				//me fijo si el nodo a eliminar el elemento es hoja o si no es hoja pero viene de una fusion
				//calculo la altura del arbol donde se va a insertar el nuevo elemento para poder graficar
				alturaGrafico=me.calcularAlturaParaGrafico(expresionCompleta);
				//calculo el numero de nodo donde se va a insertar el nuevo elemento para poder graficar
				if(alturaGrafico < 2)
				{
					posicionPadre=0;
				}else
				{
					posicionPadre=parseInt(expresion.substr(expresion.length-21,1));//posicion del nodo padre  que apunta al hijo actual
				}
				var nodoGrafico=me.calcularNodoParaGrafico(expresionCompleta,alturaGrafico,posicionPadre);
				//calculo la posicion dentro del nodo donde se va a insertar el nuevo elemento para poder graficar
				posicionElementoGrafico=me.calcularPosicionElementoGrafico(expresionCompleta);
				if( (eval(nodo+".hijos.length")==0) || ( (vuelta=="recursion") && (eval(nodo+".hijos.length")!=0) ))
				{
					//pregunto si al eliminar el elemento no se produce underflow
					if(eval(nodo+".elementos.length-1") >= minElementos)//al borrar el elemento no se produce underflow
					{
						me.borrarElementoDeVector(vector,posABorrar);
						if(nodo=="me")//el nodo a eliminar se encuentra en la raiz
						{
							if(vuelta=="recursion")
							{
								encolarOperacion("borrarElementoDeRaiz("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
								
							}else
							{
								encolarOperacion("borrarElementoDeRaiz("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
								ejecutarAnimacion();
							}
						}else
						{
							if(vuelta=="normal")
							{
								if(cambio=="sinIntercambio")
								{
									encolarOperacion("borrarElementoDeNodoHojaSinUnder("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
									ejecutarAnimacion();
								}else
								{
									encolarOperacion("borrarElementoDeNodoHojaSinUnder("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
								}
							}else
							{
								encolarOperacion("borrarElementoDeNodoHojaSinUnder("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
							}
						}
					}else
					{
						//si es la raiz es un caso especial
						if(nodo=="me")//el nodo a eliminar se encuentra en la raiz
						{
							/*me fijo si viene de una fusion y la raiz ya tiene el minimo hay que disminuir en uno la altura*/
							if((vuelta=="recursion")&&(me.elementos.length==1))
							{
								//borro el elememento de la raiz
								me.borrarElementoDeVector(nodo+".elementos",0);
								//el nodo que se fusiono en la anterior vuelta de la recursion pasa a ser la raiz
								me.elementos=me.hijos[0].elementos;
								me.hijos=me.hijos[0].hijos;
							}else
							{
								if(me.elementos.length==1)
								{
									me.elementos.length=0;
									encolarOperacion("borrarElementoDeRaiz("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
									ejecutarAnimacion();
									alert("\u00e1rbol vacio");
								}else
								{
									
									me.borrarElementoDeVector(vector,posABorrar);
									if(nodo=="me")//el nodo a eliminar se encuentra en la raiz
									{
										if(vuelta=="recursion")
										{
											encolarOperacion("borrarElementoDeRaiz("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
								
										}else
										{
											encolarOperacion("borrarElementoDeRaiz("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
											ejecutarAnimacion();
										}
									}
								}
							}
						}else
						{
							//me quedo con el numero de nodo del nodo a eliminar el elemento
							numeroNodo=expresionCompleta.substr(expresionCompleta.length-15,1);
							if(parseInt(numeroNodo)==0)//es el nodo de mas a la izquierda
							{
								//me quedo con la posicion del hermano adyacente derecho
								posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
								//me quedo con el nodo hermano adyacente derecho
								nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
								//pregunto si el hermano adyacente derecho puede cederme un elemento
								if(eval(nodoDerecho+".elementos.length-1") >= minElementos)//puede cederme
								{
										//pueden cederme un elemento el hermano derecho hago la redistribucion
										//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
										posIntermedia=parseInt(numeroNodo);
										//guardo el elemento del nodo padre que sera reemplazado por el elemento mas chico del nodoDer
										elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
										//me quedo con el elemento mas chico del hermano derecho
										posicionMinima=0;
										elementoMinimo=eval(nodoDerecho+".elementos["+posicionMinima+"]");
										/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grande del nodo donde
										se esta borrando*/
										posicionHijoRota=0;
										if(eval(nodoDerecho+".hijos").length !=0)
										{
											hijosRotacion=nodoDerecho+".hijos["+posicionHijoRota+"]";
											eval(nodo+".hijos").push(eval(hijosRotacion));
											//elimino los hijos que pasaron 
											me.borrarElementoDeVector(nodoDerecho+".hijos",posicionHijoRota);
											deshabilitarBotones();
											encolarOperacion("borrarElementoDeNodoIntermedioConUnderAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
											encolarOperacion("redistribuirAIzqConHijos("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
										}else
										{
											//tengo que encolar la operacion de la vista de redistribucion a izquierda				
											
												if(cambio=="sinIntercambio")
												{
													deshabilitarBotones();
													encolarOperacion("borrarElementoDeNodoHojaConUnderAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													ejecutarAnimacion();
													encolarOperacion("redistribuirAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
												}else
												{
													deshabilitarBotones();
													encolarOperacion("borrarElementoDeNodoHojaConUnderAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													encolarOperacion("redistribuirAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
												}
											
										}
										//reemplazo el elemento del nodo padre que es divisor por el elemento mas chico del her.der
										eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
										//disminuyo la cantidad de elementos del nodo que me cedio
										me.borrarElementoDeVector(nodoDerecho+".elementos",posicionMinima);
										//reemplazo el elemento a borrar por el que estaba como intermedio en el padre
										eval(expresionCompleta+"="+elementoAuxiliar);
										/*ordeno el nodo*/
										eval(nodo+".elementos").sort(function(a,b){return a-b;});
										
								}else//no puede cederme
									{
										//me quedo con la posicion del hermano adyacente derecho
										posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
										//me quedo con el nodo hermano adyacente derecho
										nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
										//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
										posIntermedia=parseInt(numeroNodo);
										/*me quedo con los elementos del nodo donde esta el elemento a eliminar sin el elemento 
										que se elimina*/
										var vectorElementos=new Array();
										var indice=0;
										for(var x=0;x<=eval(nodo+".elementos").length-1;x++)
										{
											if(eval(nodo+".elementos"+"["+x+"]")!=elemento)
											{
												vectorElementos[indice]=eval(nodo+".elementos"+"["+x+"]");
												indice++;
											}
										}
										/*paso el elemento que dividia los nodos al hermano adyacente derecho */
										elementoDivisor=eval(padre+".elementos["+posIntermedia+"]");
										eval(nodoDerecho+".elementos").push(elementoDivisor);
										/*paso los elementos del nodo donde elimine el elemento sin el elemento eliminado al nodo 				                                         derecho*/
										for(var i=0;i<=vectorElementos.length-1;i++)
										{
											eval(nodoDerecho+".elementos").push(vectorElementos[i]);
										}
										/*ordeno el nodo*/
										eval(nodoDerecho+".elementos").sort(function(a,b){return a-b;});
										if(eval(nodo+".hijos").length!=0)//el nodo en under tiene hijos
										{
											for(var x=eval(nodo+".hijos").length-1; x >=0;x--)
											{
												eval(nodoDerecho+".hijos").unshift(eval(nodo+".hijos["+x+"]"));
											}
										}
										/*Elimino el nodo completo donde se encontraba el elemento a eliminar por la fusion*/
										vectorDeHijos=padre+".hijos";
										me.borrarElementoDeVector(vectorDeHijos,numeroNodo);
										if(vuelta=="normal")
										{
											if(cambio=="intercambio")
											{
												deshabilitarBotones();
												encolarOperacion("borrarFusionConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												encolarOperacion("fusionConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
											}else
											{
												deshabilitarBotones();
												encolarOperacion("borrarFusionConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												ejecutarAnimacion();
												encolarOperacion("fusionConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");

											}
										}else
										{
											deshabilitarBotones();
											encolarOperacion("borrarFusionConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
											encolarOperacion("fusionConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
										}
										
										/*llamo recursivamente para eliminar el elemento del padre que se unio con la fusion*/
										me.eliminarElemento(elementoDivisor,"recursion","sinIntercambio","expresion");
									}
							}else
							{
								if( parseInt(numeroNodo) == eval(padre+".hijos.length-1") )//es el nodo de mas a la derecha
								{
									
									//me quedo con la posicion del hermano adyacente izquierdo
									posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
									//me quedo con el nodo hermano adyacente izquierdo
									nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
									//pregunto si el hermano adyacente izquierdo puede cederme un elemento
									if(eval(nodoIzquierdo+".elementos.length-1") >= minElementos)//puede cederme
									{
										
										//pueden cederme un elemento el hermano izquierdo hago la redistribucion
										//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
										posIntermedia=parseInt(numeroNodo)-1;
										//guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del nodoIzq
										elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
										//me quedo con el elemento mas grande del hermano izquierdo
										posicionMaxima=eval(nodoIzquierdo+".elementos.length-1");
										elementoMaximo=eval(nodoIzquierdo+".elementos["+posicionMaxima+"]");
										/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas chicos del nodo donde
										se esta borrando*/
										posicionHijoRota=parseInt(posicionMaxima)+1;
										if(eval(nodoIzquierdo+".hijos").length !=0)
										{
											hijosRotacion=nodoIzquierdo+".hijos["+posicionHijoRota+"]";
											eval(nodo+".hijos").unshift(eval(hijosRotacion));
											//elimino los hijos que pasaron 
											me.borrarElementoDeVector(nodoIzquierdo+".hijos",posicionHijoRota);
											deshabilitarBotones();
											encolarOperacion("borrarElementoDeNodoIntermedioConUnderADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
											encolarOperacion("redistribuirADerConHijos("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
										}else
										{
											if(cambio=="sinIntercambio")
											{ 
												deshabilitarBotones();
												encolarOperacion("borrarElementoDeNodoHojaConUnderADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												ejecutarAnimacion();
												encolarOperacion("redistribuirADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
											}else
											{
												deshabilitarBotones();
												encolarOperacion("borrarElementoDeNodoHojaConUnderADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												encolarOperacion("redistribuirADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
											}
										}
										//reemplazo el elemento del nodo padre que es divisor por el elemento mas grande del her.izq
										eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
										//disminuyo la cantidad de elementos del nodo que me cedio
										me.borrarElementoDeVector(nodoIzquierdo+".elementos",posicionMaxima);
										//reemplazo el elemento a borrar por el que estaba como intermedio en el padre
										eval(expresionCompleta+"="+elementoAuxiliar);
										/*ordeno el nodo*/
										eval(nodo+".elementos").sort(function(a,b){return a-b;});
									}else//no puede cederme
									{
										//me quedo con la posicion del hermano adyacente izquierdo
										posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
										//me quedo con el nodo hermano adyacente izquierdo
										nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
										//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
										posIntermedia=parseInt(numeroNodo)-1;
										/*me quedo con los elementos del nodo donde esta el elemento a eliminar sin el elemento 
										que se elimina*/
										vectorElementos=new Array();
										var indice=0;
										for(var x=0;x<=eval(nodo+".elementos").length-1;x++)
										{
											if(eval(nodo+".elementos"+"["+x+"]")!=elemento)
											{
												vectorElementos[indice]=eval(nodo+".elementos"+"["+x+"]");
												indice++;
											}
										}
										
										/*paso el elemento que dividia los nodos al hermano adyacente izquierdo */
										elementoDivisor=eval(padre+".elementos["+posIntermedia+"]");
										eval(nodoIzquierdo+".elementos").push(elementoDivisor);
										/*paso los elementos del nodo donde elimine el elemento sin el elemento eliminado*/
										for(var i=0;i<=vectorElementos.length-1;i++)
										{
											eval(nodoIzquierdo+".elementos").push(vectorElementos[i]);
										}
										/*ordeno el nodo*/
										eval(nodoIzquierdo+".elementos").sort(function(a,b){return a-b;});
										if(eval(nodo+".hijos").length!=0)//el nodo en under tiene hijos
										{
											for(var x=0; x <=eval(nodo+".hijos").length-1;x++)
											{
												eval(nodoIzquierdo+".hijos").push(eval(nodo+".hijos["+x+"]"));
											}
										}
										/*Elimino el nodo completo donde se encontraba el elemento a eliminar por la fusion*/
										vectorDeHijos=padre+".hijos";
										me.borrarElementoDeVector(vectorDeHijos,numeroNodo);
										if(vuelta=="normal")
										{
											if(cambio=="intercambio")
											{
											
												deshabilitarBotones();
												encolarOperacion("borrarFusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												encolarOperacion("fusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
											}else
											{
												deshabilitarBotones();
												encolarOperacion("borrarFusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												ejecutarAnimacion();
												encolarOperacion("fusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
											}
										}else
										{
											deshabilitarBotones();
											encolarOperacion("borrarFusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												encolarOperacion("fusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
										}
										
										/*llamo recursivamente para eliminar el elemento del padre que se unio con la fusion*/
										me.eliminarElemento(elementoDivisor,"recursion","sinIntercambio","expresion");
									}
								}else
								{
									
									/*Es un nodo intermedio el que produce underflow utilizo siempre la politica de pedir primero
									al hermano izquierdo y en caso de que no me pueda pasar preguntar al derecho y si tampoco me 
									puede pasar fusiono con nodo izquierdo*/
									//me quedo con la posicion del hermano adyacente izquierdo
									posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
									//me quedo con el nodo hermano adyacente izquierdo
									nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
									//pregunto si el hermano adyacente izquierdo puede cederme un elemento
									var numero=eval(nodoIzquierdo+".elementos.length-1");
									if(eval(nodoIzquierdo+".elementos.length-1") >= minElementos)//puede cederme
									{
										//pueden cederme un elemento el hermano izquierdo hago la redistribucion
										//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
										posIntermedia=parseInt(numeroNodo)-1;
										//guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del nodoIzq
										elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
										//me quedo con el elemento mas grande del hermano izquierdo
										posicionMaxima=eval(nodoIzquierdo+".elementos.length-1");
										elementoMaximo=eval(nodoIzquierdo+".elementos["+posicionMaxima+"]");
										/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas 
										chicos del nodo donde se esta borrando*/
										posicionHijoRota=parseInt(posicionMaxima)+1;
										if(eval(nodoIzquierdo+".hijos").length !=0)
										{
											hijosRotacion=nodoIzquierdo+".hijos["+posicionHijoRota+"]";
											eval(nodo+".hijos").unshift(eval(hijosRotacion));
											//elimino los hijos que pasaron 
											me.borrarElementoDeVector(nodoIzquierdo+".hijos",posicionHijoRota);
											deshabilitarBotones();
											encolarOperacion("borrarElementoDeNodoIntermedioConUnderADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
											encolarOperacion("redistribuirADerConHijos("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'intermedio'"+")");
										}else
										{
											
											if(cambio=="sinIntercambio")
											{
												deshabilitarBotones();
												encolarOperacion("borrarElementoDeNodoHojaConUnderADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												ejecutarAnimacion();
												encolarOperacion("redistribuirADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'intermedio'"+")");
											}else
											{
												deshabilitarBotones();
												encolarOperacion("borrarElementoDeNodoHojaConUnderADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												encolarOperacion("redistribuirADer("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'intermedio'"+")");
											}
										}
										//reemplazo el elemento del nodo padre que es divisor por el elemento mas grande del her.izq
										eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
										//disminuyo la cantidad de elementos del nodo que me cedio
										me.borrarElementoDeVector(nodoIzquierdo+".elementos",posicionMaxima);
										//reemplazo el elemento a borrar por el que estaba como inetrmedio en el padre
										eval(expresionCompleta+"="+elementoAuxiliar);
										/*ordeno el nodo*/
										eval(nodo+".elementos").sort(function(a,b){return a-b;});
									}else
									{
										/*no puede cederme un elemento el hermano izquierdo por lo tanto le pregunto al hermano
										derecho*/
										//me quedo con la posicion del hermano adyacente derecho
										posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
										//me quedo con el nodo hermano adyacente derecho
										nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
										//pregunto si el hermano adyacente derecho puede cederme un elemento
										if(eval(nodoDerecho+".elementos.length-1") >= minElementos)//puede cederme
										{
											//pueden cederme un elemento el hermano derecho hago la redistribucion
											//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
											posIntermedia=parseInt(numeroNodo);
											/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas chico del
											nodoDerecho*/
											elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
											/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grande del nodo donde
											se esta borrando*/
											posicionHijoRota=0;
											if(eval(nodoDerecho+".hijos").length !=0)
											{
												hijosRotacion=nodoDerecho+".hijos["+posicionHijoRota+"]";
												eval(nodo+".hijos").push(eval(hijosRotacion));
												//elimino los hijos que pasaron 
												me.borrarElementoDeVector(nodoDerecho+".hijos",posicionHijoRota);
												deshabilitarBotones();
												encolarOperacion("borrarElementoDeNodoIntermedioConUnderAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												encolarOperacion("redistribuirAIzqConHijos("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'intermedio'"+")");
											}else
											{
											//tengo que encolar la operacion de la vista de redistribucion a izquierda
												if(cambio=="sinIntercambio")
												{
													deshabilitarBotones();
													encolarOperacion("borrarElementoDeNodoHojaConUnderAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													ejecutarAnimacion();
													encolarOperacion("redistribuirAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'intermedio'"+")");
												}else
												{
													deshabilitarBotones();
													encolarOperacion("borrarElementoDeNodoHojaConUnderAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													encolarOperacion("redistribuirAIzq("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'intermedio'"+")");
												}
											}
											//me quedo con el elemento mas chico del hermano derecho
											posicionMinima=0;
											elementoMinimo=eval(nodoDerecho+".elementos["+posicionMinima+"]");
											//reemplazo el elemento del nodo padre que es divisor por el elemento mas chivo del her.der
											eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
											//disminuyo la cantidad de elementos del nodo que me cedio
											me.borrarElementoDeVector(nodoDerecho+".elementos",posicionMinima);
											//reemplazo el elemento a borrar por el que estaba como intermedio en el padre
											eval(expresionCompleta+"="+elementoAuxiliar);
											/*ordeno el nodo*/
											eval(nodo+".elementos").sort(function(a,b){return a-b;});
										}else
										{
											/*El hermano derecho tampoco puede cederme por lo tanto hago una fusion con el hermano
											izquierdo*/
											
											//me quedo con la posicion del hermano adyacente izquierdo
											posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
											//me quedo con el nodo hermano adyacente izquierdo
											nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
											//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
											posIntermedia=parseInt(numeroNodo)-1;
											/*me quedo con los elementos del nodo donde esta el elemento a eliminar sin el elemento 
											que se elimina*/
											var vectorElementos=new Array();
											var indice=0;
											for(var x=0;x<=eval(nodo+".elementos").length-1;x++)
											{
												if(eval(nodo+".elementos"+"["+x+"]")!=elemento)
												{
													vectorElementos[indice]=eval(nodo+".elementos"+"["+x+"]");
													indice++;
												}
											}
											/*paso el elemento que dividia los nodos al hermano adyacente izquierdo */
											elementoDivisor=eval(padre+".elementos["+posIntermedia+"]");
											eval(nodoIzquierdo+".elementos").push(elementoDivisor);
											/*paso los elementos del nodo donde elimine el elemento sin el elemento eliminado*/
											for(var i=0;i<=vectorElementos.length-1;i++)
											{
												eval(nodoIzquierdo+".elementos").push(vectorElementos[i]);
											}
											/*ordeno el nodo*/
											eval(nodoIzquierdo+".elementos").sort(function(a,b){return a-b;});
											if(eval(nodo+".hijos").length!=0)//el nodo en under tiene hijos
											{
												for(var x=0; x <=eval(nodo+".hijos").length-1;x++)
												{
													eval(nodoIzquierdo+".hijos").push(eval(nodo+".hijos["+x+"]"));
												}
											}
											/*Elimino el nodo completo donde se encontraba el elemento a eliminar por la fusion*/
											vectorDeHijos=padre+".hijos";
											me.borrarElementoDeVector(vectorDeHijos,numeroNodo);
											if(vuelta=="normal")
											{
												if(cambio=="intercambio")
												{
													deshabilitarBotones();
													encolarOperacion("borrarFusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
													encolarOperacion("fusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'intermedio'"+")");
												}else
												{
													deshabilitarBotones();
													encolarOperacion("borrarFusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
													ejecutarAnimacion();
													encolarOperacion("fusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'intermedio'"+")");
												}
											}else
											{
												deshabilitarBotones();
												encolarOperacion("borrarFusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												encolarOperacion("fusionConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'intermedio'"+")");
											}
											/*llamo recursivamente para eliminar el elemento del padre que se unio con la fusion*/
											me.eliminarElemento(elementoDivisor,"recursion","sinIntercambio","expresion");
										}
										
									}
								}
							}
						}
					}
				}else
				{
					/*el elemento a borrar no esta en una hoja por lo tanto debo intercambiarlo con el elemento mas chico de la rama
					derecha y luego llamar nuevamente al eliminar*/
					/*NOTA POR CONVENCION TOMO SIEMPRE EL MAS CHICO DE LA RAMA DERECHA PODRIA SER TAMBIEN EL MAS GRANDE DE LA
					RAMA IZQUIERDA*/
					/*me quedo con la posicion que apunta a la rama derecha*/
					var posRamaDerecha=parseInt(posABorrar)+1;
					/*me quedo con la expresion que apunta a la rama derecha*/
					var ramaDerecha=nodo+".hijos["+posRamaDerecha+"]";
					/*me quedo con el elemento mas chico de la rama derecha*/
					var elementoAIntercambiar=me.obtenerMenorRamaDerecha(ramaDerecha);
                    /*me quedo con la expresion que contiene al elemento a intercambiar*/
					expresionBusquedaIntercambio=me.buscarElemento(elementoAIntercambiar);
					expresionIntercambio="me."+expresionBusquedaIntercambio;
					expresionIntercambioCompleta=expresionIntercambio.substring(0,expresionIntercambio.length-3)+".elementos["+expresionIntercambio[expresionIntercambio.length-2]+"]";
					/*intercambio los elementos*/
					//me guardo el elemento a eliminar
					elementoAuxiliar=eval(expresionCompleta);
					//en la posicion del elemento a eliminar guardo el mas chico de la rama derecha
					eval(expresionCompleta+"="+expresionIntercambioCompleta);
					//en la posicion del elemento mas chico de la rama derecha pongo el elemento a eliminar
					eval(expresionIntercambioCompleta+"="+elementoAuxiliar);
					//calculo la altura del arbol donde se encuentra el elemento a intercambiar
					var expresionIntercambio="me."+expresionBusquedaIntercambio.substring(0,expresionBusquedaIntercambio.length-3)+".elementos";//me quedo con la cadena cortada hasta elementos
					var alturaGraficoIntercambio=me.calcularAlturaParaGrafico(expresionIntercambioCompleta);
					//calculo el numero de nodo donde se va a insertar el nuevo elemento para poder graficar
					if(alturaGraficoIntercambio < 2)
					{
						var posicionPadreIntercambio=0;
					}else
					{
						var posicionPadreIntercambio=parseInt(expresionIntercambio.substr(expresionIntercambio.length-21,1));//posicion del nodo padre  que apunta al hijo actual
					}
					var nodoGraficoIntercambio=me.calcularNodoParaGrafico(expresionIntercambioCompleta,alturaGraficoIntercambio,posicionPadreIntercambio);
					//calculo la posicion dentro del nodo donde se va a insertar el nuevo elemento para poder graficar
					posicionElementoGraficoIntercambio=me.calcularPosicionElementoGrafico(expresionIntercambioCompleta);
					encolarOperacion("intercambiarElementos("+alturaGraficoIntercambio+","+nodoGraficoIntercambio+","+posicionElementoGraficoIntercambio+","+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");
					ejecutarAnimacion();
					//llamo recursivamente al eliminar
					me.eliminarElemento(elemento,"normal","intercambio",expresionBusquedaIntercambio);
				}
			}
		}else
		{
			alert("\u00e1rbol vacio");
			}
		
	}//fin de eliminarElemento
	
	me.borrarElementoDeVector=function(vector,posicion)
	{
		eval(vector+".splice("+posicion+",1)");
	}//fin de borrarElementoDeVector
	
	me.copiarVector = function(vectorOriginal,vectorCopia) 
	{
   			for (var x=0; x < vectorOriginal.length ;x++) 
			{
				vectorCopia.push(vectorOriginal[x]);
			}
	}//fin de copiarVector

   me.obtenerMenorRamaDerecha=function(ramaDerecha)
   {
	   if(eval(ramaDerecha+".hijos").length == 0)
	   {
		   elemento=eval(ramaDerecha+".elementos["+0+"]");
		   return elemento;
		}else
		{
			elemento=me.obtenerMenorRamaDerecha(ramaDerecha+".hijos[0]");
			return elemento;
		}
   }//fin de obtenerMenorRamaDerecha
   
   	me.destruirArbolActual=function ()
	{
		arbol=null;
		encolarOperacion("destruirArbol()");
		ejecutarAnimacion();
	}
	
}//fin de la clase
	

