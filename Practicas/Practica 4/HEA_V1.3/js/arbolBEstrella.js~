document.write("<script type='text/javascript' src='js/controladorArbolBEstrella.js'></script>");
var minElementos;
var maxElementos;//variable que se setea en funcion del orden que selecciona el usuario
var dosTercios;//variable que representa los dos tercios llenos que debe cumplir cada nodo en la fusion de 2 a 3
var tresCuartos;//variable que representa los cuatro tercios llenos que debe cumplir cada nodo en la fusion de 3 a 4
var politica;

function NodoBEstrella(){
	var me=this;
	me.elementos=new Array();
	me.hijos=new Array();
	
	me.setearValoresEstrella=function(orden,poli)
	{
		ordenGlobal=orden;
		maxElementos=orden-1;
		minElementos=parseInt(((orden*2)-1)/3)-1;
		dosTercios=parseInt(((orden*2)-1)/3);
		if(orden!=4)
		{
			tresCuartos=parseInt((orden*3)/4);
		}else
		{
			tresCuartos=2;
		}
		politica=poli;
		mensaje="- Se creo el \u00e1rbol B* con un orden "+orden+" y pol\u00edtica "+politica;
		encolarOperacion("crearArbolEstrella("+orden+","+maxElementos+")");	
		ejecutarAnimacion();
		encolarOperacion("mostrarMensajeOperacionEstrella('"+mensaje+"')");
		
		
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
				    posicionABuscar=me.buscarPosicionDeElemento(elemento);
					return "elementos["+posicionABuscar+"]";//no existe el elemento devolver la posicion de insercion
				}else{
						
						posicionABuscar=me.buscarPosicionDeElemento(elemento);
						if (me.hijos.length >= posicionABuscar){
							return "hijos["+ posicionABuscar+"]."+ me.hijos[posicionABuscar].buscarElemento(elemento);
						}else
						{
							return "elementos["+posicionABuscar+"]";
							}
						
					}
			}
		
	}//fin de buscarElemento
	
	me.insertarElemento = function (elemento,politica){ 
		var expresion=me.buscarElemento(elemento);
		if(expresion[expresion.length-1]=="E"){
			expresion="me."+expresion;
			expresionCompleta=expresion.substring(0,expresion.length-3)+".elementos["+expresion[expresion.length-2]+"]";
			//calculo la altura donde se encuentra el elemento en el grafico
			var alturaGrafico=me.calcularAlturaParaGrafico(expresionCompleta);
			//calculo el nodo donde se encuentra el elemento en el grafico
			var posicionPadre=expresion.substr(expresion.length-14,1);//posicion del nodo padre  que apunta al hijo actual
			var nodoGrafico=me.calcularNodoParaGrafico(expresionCompleta,alturaGrafico,posicionPadre);
			//calculo la posicion dentro del nodo donde se encuentra el elemento
			var posicionElementoGrafico=expresion[expresion.length-2];
			encolarOperacion("marcarElementoExistenteEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+");");
			ejecutarAnimacionEstrella();
			mensaje="- Ha intentado insertar el elemento "+elemento+" el cual ya existe en el \u00e1rbol";
			encolarOperacion("mostrarMensajeOperacionEstrella('"+mensaje+"')");
		}else{	
				 expresionCompleta="me."+expresion;
				 expresion="me."+expresion.substring(0,expresion.length-3);//me quedo con la cadena cortada hasta elementos
				 me.insertoElemento(elemento,expresion,expresionCompleta,"normal",politica);
			  }	
		
	}//fin de insertarElemento
	
	me.insertoElemento = function (elemento,expresion,expresionCompleta,vueltaProceso,politica)
	{ 
		longitudNodo=eval(expresion).length;
		//calculo la altura del arbol donde se va a insertar el nuevo elemento para poder graficar
		var alturaGrafico=me.calcularAlturaParaGrafico(expresionCompleta);
		if(alturaGrafico < 4)//PRECONDICION SE INSERTA HASTA LA ALTURA 4 DEL ARBOL
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
				if(vueltaProceso=="normal")
				{
				   encolarOperacion("insertarSinOverFlowEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+","+"'vueltaNormal'"+");");
				   ejecutarAnimacionEstrella();
				}else
				{
					encolarOperacion("insertarSinOverFlowEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+","+"'vueltaRecursion'"+");");
				}
			  	
			}else
			{
				if(expresion=="me.elementos")//es la raiz del arbol es un caso especial
				{
					//inserto elemento en el nodo
					eval(expresion).push(elemento);
					//ordeno el vector
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
						deshabilitarBotonesEstrella();
						encolarOperacion("insertarConOverflowEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
						ejecutarAnimacionEstrella();
						encolarOperacion("partirRaizEstrella("+elementoAPromocionar+")");
					}else
					{
						deshabilitarBotonesEstrella();
						encolarOperacion("insertarConOverflowEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
						encolarOperacion("partirRaizEstrella("+elementoAPromocionar+")");
					}

				}//fin de si es la raiz del arbol
				else
				{
					//me quedo con el nodo donde se encuentra el elemento a insertar
					nodo=expresionCompleta.substr(0,expresionCompleta.length-13);
		        	//me quedo con el padre del nodo donde esta el elemento a insertar
					padre=expresionCompleta.substr(0,expresionCompleta.length-22);
					//me quedo con el numero de nodo del nodo a insertar el elemento
					numeroNodo=expresionCompleta.substr(expresionCompleta.length-15,1);
					if(parseInt(numeroNodo)==0)//es el nodo de mas a la izquierda
					{
						//me quedo con la posicion del hermano adyacente derecho
						posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
						//me quedo con el nodo hermano adyacente derecho
						nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
						//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
						posIntermedia=parseInt(numeroNodo);
						//pregunto si el hermano adyacente derecho puede cederme un elemento
						if(eval(nodoDerecho+".elementos").length < maxElementos)//puede cederme
						{
							//inserto el elemento
							eval(nodo+".elementos").push(elemento);
							//ordeno el nodo
							eval(nodo+".elementos").sort(function(a,b){return a-b;});
							//me quedo con el elemento mas grande del nodo donde inserte
							posicionMaxima=eval(nodo+".elementos").length-1;
							elementoMaximo=eval(nodo+".elementos["+posicionMaxima+"]");
							/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas chicos del nodo hermano*/
							if(eval(nodo+".hijos").length !=0)
							{
								var posicionHijoRota=posicionMaxima+1;
								hijosRotacion=nodo+".hijos["+posicionHijoRota+"]";
								eval(nodoDerecho+".hijos").unshift(eval(hijosRotacion));
								//elimino los hijos que pasaron 
								me.borrarElementoDeVector(nodo+".hijos",posicionHijoRota);
							}
							//guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del nodo en over
							elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
							//reemplazo el elemento del padre por el elemento mas grande del nodo en over
							eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
							//borro el elemento que sube a la raiz
							vectorElementos=nodo+".elementos";
							me.borrarElementoDeVector(vectorElementos,posicionMaxima);
							//paso el elemento que se encontraba en el padre como minimo del hermano derecho
							eval(nodoDerecho+".elementos").unshift(elementoAuxiliar);
							if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
							{
					 			//deshabilito los botones mientras se este realizando la animacion
								deshabilitarBotonesEstrella();
								encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
								ejecutarAnimacionEstrella();
								encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
							}else
							{
								//deshabilito los botones mientras se este realizando la animacion
								deshabilitarBotonesEstrella();
								encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
								encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
							}
						}
						else
						{
							/*el hermano derecho esta completo debo fusionar los dos nodos completo y hacer tres  2/3 llenos*/
							//guardo el elemento del nodo padre
							elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
							/*inserto el elemento en el nodo donde se produce overflow*/
							eval(expresion).push(elemento);
							eval(expresion).sort(function(a,b){return a-b;});
							if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
							{
					 			//deshabilito los botones mientras se este realizando la animacion
								deshabilitarBotonesEstrella();
								encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
								ejecutarAnimacionEstrella();
								encolarOperacion("deDosAtresConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
							}else
							{
								//deshabilito los botones mientras se este realizando la animacion
								deshabilitarBotonesEstrella();
								encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
								encolarOperacion("deDosAtresConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
							}
							/*llamo a la funcion que me fusiona creando de dos nodos tres 2/3 partes llenos*/
							me.deDosATres(nodo,nodoDerecho,padre,posIntermedia,numeroNodo,expresion,politica,"fusionADerecha");
						}
					}else
					{
						if( parseInt(numeroNodo) == eval(padre+".hijos.length-1") )//es el nodo de mas a la derecha
						{
							//me quedo con la posicion del hermano adyacente izquierdo
							posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
							//me quedo con el nodo hermano adyacente izquierdo
							nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
							//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
							posIntermedia=parseInt(numeroNodo)-1;
							//pregunto si el hermano adyacente izquierdo puede cederme un elemento
							if(eval(nodoIzquierdo+".elementos").length < maxElementos)//puede cederme
							{
								//inserto el elemento en el nodo
								eval(nodo+".elementos").push(elemento);
								eval(nodo+".elementos").sort(function(a,b){return a-b;});
								//me quedo con el elemento minimo del nodo donde se inserta que pasara al padre
								elementoMinimo=eval(nodo+".elementos[0]");
								//guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del nodoIzq
								elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
								/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grandes del nodo donde
								se esta borrando*/
								posicionHijoRota=0;
								if(eval(nodo+".hijos").length !=0)
								{
									hijosRotacion=nodo+".hijos["+posicionHijoRota+"]";
									eval(nodoIzquierdo+".hijos").push(eval(hijosRotacion));
									//elimino los hijos que pasaron 
									me.borrarElementoDeVector(nodo+".hijos",posicionHijoRota);
								}
								//paso el elemento minimo del nodo a insertar al padre
								eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
								//borro el elemento que sube a la raiz
								vectorElementos=nodo+".elementos";
								me.borrarElementoDeVector(vectorElementos,0);
								//paso el elemento que estaba en el padre como maximo del hermano izquierdo
								eval(nodoIzquierdo+".elementos").push(elementoAuxiliar);
								if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
								{
					 				//deshabilito los botones mientras se este realizando la animacion
									deshabilitarBotonesEstrella();
									encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
									ejecutarAnimacionEstrella();
									encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
								}else
								{
									//deshabilito los botones mientras se este realizando la animacion
									deshabilitarBotonesEstrella();
									encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
									encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
								}
							}else
							{
								/*el hermano izquierdo esta completo debo fusionar los dos nodos completo y hacer tres  2/3 llenos*/
								/*inserto el elemento en el nodo donde se produce overflow*/
								eval(expresion).push(elemento);
								/*ordeno el nodo*/
								eval(expresion).sort(function(a,b){return a-b;});
								//guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del nodoIzq
								elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
								if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
								{
					 				//deshabilito los botones mientras se este realizando la animacion
									deshabilitarBotonesEstrella();
									encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
									ejecutarAnimacionEstrella();
									encolarOperacion("deDosAtresConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
								}else
								{
									//deshabilito los botones mientras se este realizando la animacion
									deshabilitarBotonesEstrella();
									encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
									encolarOperacion("deDosAtresConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
								}
								/*llamo a la funcion que me fusiona creando de dos nodos tres 2/3 partes llenos*/
								me.deDosATres(nodo,nodoIzquierdo,padre,posIntermedia,numeroNodo,expresion,politica,"fusionAIzquierda");
							}
						}else
						{
							/*al ser un nodo intermedio debo preguntar por la politica elegida*/
							if(politica=="derecha")
							{
								//me quedo con la posicion del hermano adyacente derecho
								posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
								//me quedo con el nodo hermano adyacente derecho
								nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
								//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
								posIntermedia=parseInt(numeroNodo);
								//pregunto si el hermano adyacente derecho puede cederme un elemento
				    			if(eval(nodoDerecho+".elementos").length < maxElementos)//puede cederme
								{
									//inserto el elemento
									eval(nodo+".elementos").push(elemento);
									//ordeno el nodo
									eval(nodo+".elementos").sort(function(a,b){return a-b;});
									//me quedo con el elemento mas grande del nodo donde inserte
									posicionMaxima=eval(nodo+".elementos").length-1;
									elementoMaximo=eval(nodo+".elementos["+posicionMaxima+"]");
									/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grande del nodo donde
									se esta borrando*/
									if(eval(nodo+".hijos").length !=0)
									{
										hijosRotacion=nodo+".hijos["+posicionMaxima+"]";
										eval(nodoDerecho+".hijos").unshift(eval(hijosRotacion));
										//elimino los hijos que pasaron 
										me.borrarElementoDeVector(nodo+".hijos",posicionMaxima);
									}
									//guardo el elemento del nodo padre que sera reemplazado por el elemento mas chico del nodoDer
									elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
									//reemplazo el elemento del padre por el elemento que se iba a insertar en el nodo
									eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
									//borro el elemento que sube a la raiz
									vectorElementos=nodo+".elementos";
									me.borrarElementoDeVector(vectorElementos,posicionMaxima);
									//paso el elemento que se encontraba en el padre como minimo del hermano derecho
									eval(nodoDerecho+".elementos").unshift(elementoAuxiliar);
									if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
									{
					 					//deshabilito los botones mientras se este realizando la animacion
										deshabilitarBotonesEstrella();
										encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
										ejecutarAnimacionEstrella();
										encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
									}else
									{
										//deshabilito los botones mientras se este realizando la animacion
										deshabilitarBotonesEstrella();
										encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
										encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
									}
								}
								else
								{
									/*el hermano derecho esta completo debo fusionar los dos nodos completo y hacer tres  2/3 llenos*/
							   		elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
							   		/*inserto el elemento en el nodo donde se produce overflow*/
									eval(expresion).push(elemento);
									/*ordeno el nodo*/
									eval(expresion).sort(function(a,b){return a-b;});
									if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
									{
					 					//deshabilito los botones mientras se este realizando la animacion
										deshabilitarBotonesEstrella();
										encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
										ejecutarAnimacionEstrella();
										encolarOperacion("deDosAtresConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
									}else
									{
										//deshabilito los botones mientras se este realizando la animacion
										deshabilitarBotonesEstrella();
										encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
										encolarOperacion("deDosAtresConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
									}
									/*llamo a la funcion que me fusiona creando de dos nodos tres 2/3 partes llenos*/
									me.deDosATres(nodo,nodoDerecho,padre,posIntermedia,numeroNodo,expresion,politica,"fusionADerecha");
							   }		
							}else
							{
								if(politica=="izquierda")
								{
									//me quedo con la posicion del hermano adyacente izquierdo
									posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
									//me quedo con el nodo hermano adyacente izquierdo
									nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
									//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
									posIntermedia=parseInt(numeroNodo)-1;
									//pregunto si el hermano adyacente izquierdo puede cederme un elemento
									if(eval(nodoIzquierdo+".elementos").length < maxElementos)//puede cederme
									{
										//inserto el elemento en el nodo
										eval(nodo+".elementos").push(elemento);
										eval(nodo+".elementos").sort(function(a,b){return a-b;});
										//me quedo con el elemento minimo del nodo donde se inserta que pasara al padre
										elementoMinimo=eval(nodo+".elementos[0]");
										//guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del nodoIzq
										elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
										/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas chicos del nodo donde
										se esta borrando*/
										posicionHijoRota=0;
										if(eval(nodo+".hijos").length !=0)
										{
											hijosRotacion=nodo+".hijos["+posicionHijoRota+"]";
											eval(nodo+".hijos").push(eval(hijosRotacion));
											//elimino los hijos que pasaron 
											me.borrarElementoDeVector(nodo+".hijos",posicionHijoRota);
										}
										//paso el elemento minimo del nodo a insertar al padre
										eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
										//borro el elemento que sube a la raiz
										vectorElementos=nodo+".elementos";
										me.borrarElementoDeVector(vectorElementos,0);
										//paso el elemento que estaba en el padre como maximo del hermano izquierdo
										eval(nodoIzquierdo+".elementos").push(elementoAuxiliar);
										if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
										{
					 						//deshabilito los botones mientras se este realizando la animacion
											deshabilitarBotonesEstrella();
											encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
											ejecutarAnimacionEstrella();
											encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
										}else
										{
											//deshabilito los botones mientras se este realizando la animacion
											deshabilitarBotonesEstrella();
											encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
											encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
										}
									}else
									{
										/*el hermano izquierdo esta completo debo fusionar los dos nodos completo y hacer tres  2/3        								llenos*/
										/*inserto el elemento en el nodo donde se produce overflow*/
										eval(expresion).push(elemento);
										/*ordeno el nodo*/
										eval(expresion).sort(function(a,b){return a-b;});
										//guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del nodoIzq
										elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
										if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
										{
					 						//deshabilito los botones mientras se este realizando la animacion
											deshabilitarBotonesEstrella();
											encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
											ejecutarAnimacionEstrella();
											encolarOperacion("deDosAtresConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
										}else
										{
											//deshabilito los botones mientras se este realizando la animacion
											deshabilitarBotonesEstrella();
											encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
											encolarOperacion("deDosAtresConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
										}
										/*llamo a la funcion que me fusiona creando de dos nodos tres 2/3 partes llenos*/
										me.deDosATres(nodo,nodoIzquierdo,padre,posIntermedia,numeroNodo,expresion,politica,"fusionAIzquierda");
									}
								}else
								{
									if(politica=="izquierdaODer")
									{
										//me quedo con la posicion del hermano adyacente izquierdo
										posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
										//me quedo con el nodo hermano adyacente izquierdo
										nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
										//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
										posIntermedia=parseInt(numeroNodo)-1;
										//pregunto si el hermano adyacente izquierdo puede cederme un elemento
										if(eval(nodoIzquierdo+".elementos").length < maxElementos)//puede cederme
										{
											//inserto el elemento en el nodo
											eval(nodo+".elementos").push(elemento);
											eval(nodo+".elementos").sort(function(a,b){return a-b;});
											//me quedo con el elemento minimo del nodo donde se inserta que pasara al padre
											elementoMinimo=eval(nodo+".elementos[0]");
											//guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del nodoIzq
											elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
											/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas chicos del nodo donde
										se esta borrando*/
											posicionHijoRota=0;
											if(eval(nodo+".hijos").length !=0)
											{
												hijosRotacion=nodo+".hijos["+posicionHijoRota+"]";
												eval(nodo+".hijos").push(eval(hijosRotacion));
												//elimino los hijos que pasaron 
												me.borrarElementoDeVector(nodo+".hijos",posicionHijoRota);
											}
											//paso el elemento minimo del nodo a insertar al padre
											eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
											//borro el elemento que sube a la raiz
											vectorElementos=nodo+".elementos";
											me.borrarElementoDeVector(vectorElementos,0);
											//paso el elemento que estaba en el padre como maximo del hermano izquierdo
											eval(nodoIzquierdo+".elementos").push(elementoAuxiliar);
											if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
											{
					 							//deshabilito los botones mientras se este realizando la animacion
												deshabilitarBotonesEstrella();
												encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
												ejecutarAnimacionEstrella();
												encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
											}else
											{
												//deshabilito los botones mientras se este realizando la animacion
												deshabilitarBotonesEstrella();
												encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
												encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
											}
										}else
										{
											//me quedo con la posicion del hermano adyacente derecho
											posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
											//me quedo con el nodo hermano adyacente derecho
											nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
											//pregunto si el hermano adyacente derecho puede cederme un elemento
				    						if(eval(nodoDerecho+".elementos").length < maxElementos)//puede cederme
											{
												//inserto el elemento
												eval(nodo+".elementos").push(elemento);
												//ordeno el nodo
												eval(nodo+".elementos").sort(function(a,b){return a-b;});
												//me quedo con el elemento mas grande del nodo donde inserte
												posicionMaxima=eval(nodo+".elementos").length-1;
												elementoMaximo=eval(nodo+".elementos["+posicionMaxima+"]");
												/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grande del nodo                                             	donde se esta borrando*/
												if(eval(nodo+".hijos").length !=0)
												{
													hijosRotacion=nodo+".hijos["+posicionMaxima+"]";
													eval(nodoDerecho+".hijos").unshift(eval(hijosRotacion));
													//elimino los hijos que pasaron 
													me.borrarElementoDeVector(nodo+".hijos",posicionMaxima);
												}
												//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
												posIntermedia=parseInt(numeroNodo);
												/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas chico del 
											nodoDer*/
												elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
												//reemplazo el elemento del padre por el elemento que se iba a insertar en el nodo
												eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
												//borro el elemento que sube a la raiz
												vectorElementos=nodo+".elementos";
												me.borrarElementoDeVector(vectorElementos,posicionMaxima);
												//paso el elemento que se encontraba en el padre como minimo del hermano derecho
												eval(nodoDerecho+".elementos").unshift(elementoAuxiliar);
												if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
												{
					 								//deshabilito los botones mientras se este realizando la animacion
													deshabilitarBotonesEstrella();
													encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
													ejecutarAnimacionEstrella();
													encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												}else
												{
													//deshabilito los botones mientras se este realizando la animacion
													deshabilitarBotonesEstrella();
													encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
													encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												}
											}
											else
											{
												/*el hermano izquierdo esta completo y el derecho tambien debo fusionar el nodo con el                                            	izquierdo y hacer tres  2/3 llenos*/
												/*inserto el elemento en el nodo donde se produce overflow*/
												eval(expresion).push(elemento);
												/*ordeno el nodo*/
												eval(expresion).sort(function(a,b){return a-b;});
												//guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del nodoIzq
												elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
												if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
												{
					 								//deshabilito los botones mientras se este realizando la animacion
													deshabilitarBotonesEstrella();
													encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
													ejecutarAnimacionEstrella();
													encolarOperacion("deDosAtresConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												}else
												{
													//deshabilito los botones mientras se este realizando la animacion
													deshabilitarBotonesEstrella();
													encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
													encolarOperacion("deDosAtresConHermanoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												}
												/*llamo a la funcion que me fusiona creando de dos nodos tres 2/3 partes llenos*/
												me.deDosATres(nodo,nodoIzquierdo,padre,posIntermedia,numeroNodo,expresion,politica,"fusionAIzquierda");
											}

										}
									}else
									{
										if(politica=="derOIzq")
										{
											//me quedo con la posicion del hermano adyacente derecho
											posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
											//me quedo con el nodo hermano adyacente derecho
											nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
											//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
											posIntermedia=parseInt(numeroNodo);
											//pregunto si el hermano adyacente derecho puede cederme un elemento
				    						if(eval(nodoDerecho+".elementos").length  < maxElementos)//puede cederme
											{
												//inserto el elemento
												eval(nodo+".elementos").push(elemento);
												//ordeno el nodo
												eval(nodo+".elementos").sort(function(a,b){return a-b;});
												//me quedo con el elemento mas grande del nodo donde inserte
												posicionMaxima=eval(nodo+".elementos").length-1;
												elementoMaximo=eval(nodo+".elementos["+posicionMaxima+"]");
							                	/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grande del nodo                                            	donde se esta borrando*/
												if(eval(nodo+".hijos").length !=0)
												{
													hijosRotacion=nodo+".hijos["+posicionMaxima+"]";
													eval(nodoDerecho+".hijos").unshift(eval(hijosRotacion));
													//elimino los hijos que pasaron 
													me.borrarElementoDeVector(nodo+".hijos",posicionMaxima);
												}
												/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas chico del 
												nodoDer*/
												elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
												//reemplazo el elemento del padre por el elemento que se iba a insertar en el nodo
												eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
												//borro el elemento que sube a la raiz
												vectorElementos=nodo+".elementos";
												me.borrarElementoDeVector(vectorElementos,posicionMaxima);
												//paso el elemento que se encontraba en el padre como minimo del hermano derecho
												eval(nodoDerecho+".elementos").unshift(elementoAuxiliar);
												if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
												{
					 								//deshabilito los botones mientras se este realizando la animacion
													deshabilitarBotonesEstrella();
													encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
													ejecutarAnimacionEstrella();
													encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												}else
												{
													//deshabilito los botones mientras se este realizando la animacion
													deshabilitarBotonesEstrella();
													encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
													encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												}
											}
											else
											{
												//me quedo con la posicion del hermano adyacente izquierdo
												posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
												//me quedo con el nodo hermano adyacente izquierdo
												nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
												//pregunto si el hermano adyacente izquierdo puede cederme un elemento
												if(eval(nodoIzquierdo+".elementos").length  < maxElementos)//puede cederme
												{
													//inserto el elemento en el nodo
													eval(nodo+".elementos").push(elemento);
													eval(nodo+".elementos").sort(function(a,b){return a-b;});
													//me quedo con el elemento minimo del nodo donde se inserta que pasara al padre
													elementoMinimo=eval(nodo+".elementos[0]");
													/*me quedo con la posicion del elemento del nodo padre que hace de divisor entre los 
													nodos*/
													posIntermedia=parseInt(numeroNodo)-1;
													/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande del                                                 nodoIzq*/
													elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
													/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas chicos del nodo                                                 donde se esta borrando*/
													posicionHijoRota=0;
													if(eval(nodo+".hijos").length !=0)
													{
														hijosRotacion=nodo+".hijos["+posicionHijoRota+"]";
														eval(nodo+".hijos").push(eval(hijosRotacion));
														//elimino los hijos que pasaron 
														me.borrarElementoDeVector(nodo+".hijos",posicionHijoRota);
													}			
													//paso el elemento minimo del nodo a insertar al padre
													eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
													//borro el elemento que sube a la raiz
													vectorElementos=nodo+".elementos";
													me.borrarElementoDeVector(vectorElementos,0);
													//paso el elemento que estaba en el padre como maximo del hermano izquierdo
													eval(nodoIzquierdo+".elementos").push(elementoAuxiliar);
													if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
													{
					 									//deshabilito los botones mientras se este realizando la animacion
														deshabilitarBotonesEstrella();
														encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
														ejecutarAnimacionEstrella();
														encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													}else
													{
														//deshabilito los botones mientras se este realizando la animacion
														deshabilitarBotonesEstrella();
														encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
														encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													}
												}else
												{
													/*el hermano izquierdo esta completo y el derecho tambien debo fusionar el nodo con el                                            		derecho y hacer tres  2/3 llenos*/
													/*inserto el elemento en el nodo donde se produce overflow*/
													elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
													eval(expresion).push(elemento);
													/*ordeno el nodo*/
													eval(expresion).sort(function(a,b){return a-b;});
													if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
													{
					 									//deshabilito los botones mientras se este realizando la animacion
														deshabilitarBotonesEstrella();
														encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
														ejecutarAnimacionEstrella();
														encolarOperacion("deDosAtresConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													}else
													{
														//deshabilito los botones mientras se este realizando la animacion
														deshabilitarBotonesEstrella();
														encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
														encolarOperacion("deDosAtresConHermanoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													}
													/*llamo a la funcion que me fusiona creando de dos nodos tres 2/3 partes llenos*/
													me.deDosATres(nodo,nodoDerecho,padre,posIntermedia,numeroNodo,expresion,politica,"fusionADerecha");
												}
											}
										}else
										{
											/*POLITICA IZQUIERDA Y DERECHA*/
											//me quedo con la posicion del hermano adyacente izquierdo
											posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
											//me quedo con el nodo hermano adyacente izquierdo
											nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
											//me quedo con la posicion del elemento del nodo padre que hace de divisor entre los nodos
											posIntermedia=parseInt(numeroNodo)-1;
											//pregunto si el hermano adyacente izquierdo puede cederme un elemento
											if(eval(nodoIzquierdo+".elementos").length < maxElementos)//puede cederme
											{
												//inserto el elemento en el nodo
												eval(nodo+".elementos").push(elemento);
												eval(nodo+".elementos").sort(function(a,b){return a-b;});
												//me quedo con el elemento minimo del nodo donde se inserta que pasara al padre
												elementoMinimo=eval(nodo+".elementos[0]");
												/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande d		  												Del  nodoIzq*/
												elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
												/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas chicos del nodo 
												donde se esta borrando*/
												posicionHijoRota=0;
												if(eval(nodo+".hijos").length !=0)
												{
													hijosRotacion=nodo+".hijos["+posicionHijoRota+"]";
													eval(nodo+".hijos").push(eval(hijosRotacion));
													//elimino los hijos que pasaron 
													me.borrarElementoDeVector(nodo+".hijos",posicionHijoRota);
												}
												//paso el elemento minimo del nodo a insertar al padre
												eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
												//borro el elemento que sube a la raiz
												vectorElementos=nodo+".elementos";
												me.borrarElementoDeVector(vectorElementos,0);
												//paso el elemento que estaba en el padre como maximo del hermano izquierdo
												eval(nodoIzquierdo+".elementos").push(elementoAuxiliar);
												if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
												{
					 								//deshabilito los botones mientras se este realizando la animacion
													deshabilitarBotonesEstrella();
													encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
													ejecutarAnimacionEstrella();
													encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												}else
												{
													//deshabilito los botones mientras se este realizando la animacion
													deshabilitarBotonesEstrella();
													encolarOperacion("insertarConOverflowRedistibuirIzquierda("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
													encolarOperacion("pasarElementoANodoIzquierdo("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												}
											}else
											{
												//me quedo con la posicion del hermano adyacente derecho
												posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
												//me quedo con el nodo hermano adyacente derecho
												nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
												//pregunto si el hermano adyacente derecho puede cederme un elemento
				    							if(eval(nodoDerecho+".elementos").length < maxElementos)//puede cederme
												{
													//inserto el elemento
													eval(nodo+".elementos").push(elemento);
													//ordeno el nodo
													eval(nodo+".elementos").sort(function(a,b){return a-b;});
													//me quedo con el elemento mas grande del nodo donde inserte
													posicionMaxima=eval(nodo+".elementos").length-1;
													elementoMaximo=eval(nodo+".elementos["+posicionMaxima+"]");
													/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grande del nodo                                             	donde se esta borrando*/
													if(eval(nodo+".hijos").length !=0)
													{
														hijosRotacion=nodo+".hijos["+posicionMaxima+"]";
														eval(nodoDerecho+".hijos").unshift(eval(hijosRotacion));
														//elimino los hijos que pasaron 
														me.borrarElementoDeVector(nodo+".hijos",posicionMaxima);
													}
													/*me quedo con la posicion del elemento del nodo padre que hace de divisor entre  
													los nodos*/
													posIntermedia=parseInt(numeroNodo);
													/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas chico del 												nodoDer*/
													elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
													//reemplazo el elemento del padre por el elemento que se iba a insertar en el nodo
													eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
													//borro el elemento que sube a la raiz
													vectorElementos=nodo+".elementos";
													me.borrarElementoDeVector(vectorElementos,posicionMaxima);
													//paso el elemento que se encontraba en el padre como minimo del hermano derecho
													eval(nodoDerecho+".elementos").unshift(elementoAuxiliar);
													if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
													{
					 									//deshabilito los botones mientras se este realizando la animacion
														deshabilitarBotonesEstrella();
														encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
														ejecutarAnimacionEstrella();
														encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													}else
													{
														//deshabilito los botones mientras se este realizando la animacion
														deshabilitarBotonesEstrella();
														encolarOperacion("insertarConOverflowRedistibuirDerecha("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
														encolarOperacion("pasarElementoANodoDerecho("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													}
												}
												else
												{
													/*el hermano izquierdo esta completo y el derecho tambien debo fusionar el nodo 
													con  ambos hermanos y hacer 4 nodos 3/4 llenos*/
													elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
													/*inserto el elemento en el nodo donde se produce overflow*/
													eval(expresion).push(elemento);
													/*ordeno el nodo*/
													eval(expresion).sort(function(a,b){return a-b;});
													if(vueltaProceso=="normal")//inserto en el grafico si no viene de la recursion
													{
					 									//deshabilito los botones mientras se este realizando la animacion
														deshabilitarBotonesEstrella();
														encolarOperacion("insertarConOverflowPoliticaY("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
														ejecutarAnimacionEstrella();
														encolarOperacion("detresACuatro("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													}else
													{
														//deshabilito los botones mientras se este realizando la animacion
														deshabilitarBotonesEstrella();
														encolarOperacion("insertarConOverflowPoliticaY("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elemento+")");
														encolarOperacion("detresACuatro("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													}
													/*llamo a la funcion que me fusiona creando de dos nodos tres 2/3 partes llenos*/
													me.deTresACuatro(nodo,nodoIzquierdo,nodoDerecho,padre,posIntermedia,posIntermedia+1,numeroNodo,expresion,politica);
												}
											}
										}
									}
								}
							}
						}
					}
				
				}//fin del el else del si es la raiz del arbol 
			}//fin del else
		}else //fin de aturaGrafico< 4
		{
			alert("Una sesión de aprendizaje permite hacer inserciones hasta la altura 4, puede reiniciar el árbol y seguir con otra sesión");
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
	
	me.imprimirArbol = function (elementos,hijos){ 
	      for(var i=0;i<=elementos.length-1;i++)
		  {
			  alert(elementos[i]);
			  //mostrarElemento(elementos[i]);
			  }
		  if(hijos.length!=0){
		  		for(var j=0;j<=hijos.length-1;j++)
		  		{
					  me.imprimirArbol(hijos[j].elementos,hijos[j].hijos);
					  
			 	}
				
		  }
	}//fin de imprimirArbol
	
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
				var nodoAInsertar=expresionCompleta.substr(expresionCompleta.length-15,1);
				var expresionEnAltura=expresionCompleta.substr(0,expresionCompleta.length-25);
				var cantidadNodosEnAltura=0;
				for(var i=0;i<=parseInt(posicionNodoPadre);i++)
				{
					var cantidadHijos=parseInt(eval(expresionEnAltura+"[i].hijos.length"));
					var restaHijos=cantidadHijos-nodoAInsertar;
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
						for(var i=0;i<=primerPos-1;i++)
						{
							cantidadNodosEnAltura=cantidadNodosEnAltura+me.calcularHijosRama("me.hijos["+i+"]",1);
						}
					}
					primerCorteExpresion=expresionCompleta.substr(0,11);
					segundaPos=expresionCompleta.substr(expresionCompleta.length-24,1);
					if(segundaPos > 0)
					{
						for(var j=0;j<=segundaPos-1;j++)
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
						for(var i=0;i<=primerPos-1;i++)
						{
							cantidadNodosEnAltura=cantidadNodosEnAltura+me.calcularHijosRama("me.hijos["+i+"]",3);
						}
					}
					primerCorteExpresion=expresionCompleta.substr(0,11);
					segundaPos=expresionCompleta.substr(expresionCompleta.length-33,1);
					if(segundaPos > 0)
					{
						for(var j=0;j<=segundaPos-1;j++)
						{
							cantidadNodosEnAltura=cantidadNodosEnAltura+me.calcularHijosRama(primerCorteExpresion+".hijos["+j+"]",4);
						}
					}
					segundoCorteExpresion=expresionCompleta.substr(0,20);
					tercerPos=expresionCompleta.substr(expresionCompleta.length-24,1);
					if(tercerPos > 0)
					{
						for(var j=0;j<=tercerPos-1;j++)
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
	}
	//fin de calcularPosicionElementoGrafico
	
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
				encolarOperacion("marcarCaminoBusquedaEstrella("+elemento+","+ultimoElementoABuscar+","+existeElemento+")");
				ejecutarAnimacionEstrella();
	   }else
	   {
		   arbolLimpio=true;
		   alert("El árbol no tiene elementos");
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
								encolarOperacion("borrarElementoDeRaizEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
								
							}else
							{
								encolarOperacion("borrarElementoDeRaizEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
								ejecutarAnimacionEstrella();
							}
						}else
						{
							if(vuelta=="normal")
							{
								if(cambio=="sinIntercambio")
								{
									encolarOperacion("borrarElementoDeNodoHojaSinUnderEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
									ejecutarAnimacionEstrella();
								}else
								{
									encolarOperacion("borrarElementoDeNodoHojaSinUnderEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
								}
							}else
							{
								encolarOperacion("borrarElementoDeNodoHojaSinUnderEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
							}
						}
					}else
					{
						//si es la raiz es un caso especial
						if(nodo=="me")//el elemento a eliminar se encuentra en la raiz
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
									encolarOperacion("borrarElementoDeRaizEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
									ejecutarAnimacionEstrella();
									alert("Arbol vacio");
								}else
								{
									
									me.borrarElementoDeVector(vector,posABorrar);
									if(nodo=="me")//el nodo a eliminar se encuentra en la raiz
									{
										if(vuelta=="recursion")
										{
											encolarOperacion("borrarElementoDeRaizEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
								
										}else
										{
											encolarOperacion("borrarElementoDeRaizEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");	
											ejecutarAnimacionEstrella();
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
											deshabilitarBotonesEstrella();
											encolarOperacion("borrarElementoDeNodoIntermedioConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
											encolarOperacion("redistribuirAIzqConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
										}else
										{
											//tengo que encolar la operacion de la vista de redistribucion a izquierda				
											
												if(cambio=="sinIntercambio")
												{
													deshabilitarBotonesEstrella();
													encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													ejecutarAnimacionEstrella();
													encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
												}else
												{
													deshabilitarBotonesEstrella();
													encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
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
												deshabilitarBotonesEstrella();
												encolarOperacion("borrarFusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												encolarOperacion("fusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
											}else
											{
												deshabilitarBotonesEstrella();
												encolarOperacion("borrarFusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												ejecutarAnimacionEstrella();
												encolarOperacion("fusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");

											}
										}else
										{
											deshabilitarBotonesEstrella();
											encolarOperacion("borrarFusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
											encolarOperacion("fusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
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
											deshabilitarBotonesEstrella();
											encolarOperacion("borrarElementoDeNodoIntermedioConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
											encolarOperacion("redistribuirADerConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
										}else
										{
											if(cambio=="sinIntercambio")
											{ 
												deshabilitarBotones();
												encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												ejecutarAnimacionEstrella();
												encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
											}else
											{
												deshabilitarBotonesEstrella();
												encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
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
											
												deshabilitarBotonesEstrella();
												encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
											}else
											{
												deshabilitarBotonesEstrella();
												encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												ejecutarAnimacionEstrella();
												encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
											}
										}else
										{
											deshabilitarBotonesEstrella();
											encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
										}
										
										/*llamo recursivamente para eliminar el elemento del padre que se unio con la fusion*/
										me.eliminarElemento(elementoDivisor,"recursion","sinIntercambio","expresion");
									}
								}else
								{
									
									/*Es un nodo intermedio el que produce underflow debo preguntar por la politica elegida */
									/*al ser un nodo intermedio debo preguntar por la politica elegida*/
									if(politica=="derecha")
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
											/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grande del nodo 
											donde se esta borrando*/
											posicionHijoRota=0;
											if(eval(nodoDerecho+".hijos").length !=0)
											{
												hijosRotacion=nodoDerecho+".hijos["+posicionHijoRota+"]";
												eval(nodo+".hijos").push(eval(hijosRotacion));
												//elimino los hijos que pasaron 
												me.borrarElementoDeVector(nodoDerecho+".hijos",posicionHijoRota);
												deshabilitarBotonesEstrella();
												encolarOperacion("borrarElementoDeNodoIntermedioConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
												encolarOperacion("redistribuirAIzqConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
											}else
											{
												//tengo que encolar la operacion de la vista de redistribucion a izquierda				
												if(cambio=="sinIntercambio")
												{
													deshabilitarBotonesEstrella();
													encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													ejecutarAnimacionEstrella();
													encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
												}else
												{
													deshabilitarBotonesEstrella();
													encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
												}
											
											}
											/*reemplazo el elemento del nodo padre que es divisor por el elemento mas chico del 
											her.der*/
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
											/*paso los elementos del nodo donde elimine el elemento sin el elemento eliminado al nodo 				                                         	derecho*/
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
													deshabilitarBotonesEstrella();
													encolarOperacion("borrarFusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
													encolarOperacion("fusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												}else
												{
													deshabilitarBotonesEstrella();
													encolarOperacion("borrarFusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
													ejecutarAnimacionEstrella();
													encolarOperacion("fusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");

												}
											}else
											{
												deshabilitarBotonesEstrella();
												encolarOperacion("borrarFusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
												encolarOperacion("fusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
											}
											/*llamo recursivamente para eliminar el elemento del padre que se unio con la fusion*/
											me.eliminarElemento(elementoDivisor,"recursion","sinIntercambio","expresion");
										}
									}else
									{
										
										if(politica=="izquierda")
										{
											//me quedo con la posicion del hermano adyacente izquierdo
											posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
											//me quedo con el nodo hermano adyacente izquierdo
											nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
											//pregunto si el hermano adyacente izquierdo puede cederme un elemento
											if(eval(nodoIzquierdo+".elementos.length-1") >= minElementos)//puede cederme
											{
												//pueden cederme un elemento el hermano izquierdo hago la redistribucion
												/*me quedo con la posicion del elemento del nodo padre que hace de divisor entre los 
												nodos*/
												posIntermedia=parseInt(numeroNodo)-1;
												/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas grande 
												del nodoIzq*/
												elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
												//me quedo con el elemento mas grande del hermano izquierdo
												posicionMaxima=eval(nodoIzquierdo+".elementos.length-1");
												elementoMaximo=eval(nodoIzquierdo+".elementos["+posicionMaxima+"]");
												/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas chicos del nodo 
												donde se esta borrando*/
												posicionHijoRota=parseInt(posicionMaxima)+1;
												if(eval(nodoIzquierdo+".hijos").length !=0)
												{
													hijosRotacion=nodoIzquierdo+".hijos["+posicionHijoRota+"]";
													eval(nodo+".hijos").unshift(eval(hijosRotacion));
													//elimino los hijos que pasaron 
													me.borrarElementoDeVector(nodoIzquierdo+".hijos",posicionHijoRota);
													deshabilitarBotonesEstrella();
													encolarOperacion("borrarElementoDeNodoIntermedioConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
													encolarOperacion("redistribuirADerConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
												}else
												{
													if(cambio=="sinIntercambio")
													{ 
														deshabilitarBotones();
														encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
														ejecutarAnimacionEstrella();
														encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
													}else
													{
														deshabilitarBotonesEstrella();
														encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
														encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
													}
												}
												/*reemplazo el elemento del nodo padre que es divisor por el elemento mas grande del 
												her.izq*/
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
												/*me quedo con la posicion del elemento del nodo padre que hace de divisor entre los 
												nodos*/
												posIntermedia=parseInt(numeroNodo)-1;
												/*me quedo con los elementos del nodo donde esta el elemento a eliminar sin el 
												elemento que se elimina*/
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
														deshabilitarBotonesEstrella();
														encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
														encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
													}else
													{
														deshabilitarBotonesEstrella();
														encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
														ejecutarAnimacionEstrella();
														encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
													}
												}else
												{
													deshabilitarBotonesEstrella();
													encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
													encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
												}
												/*llamo recursivamente para eliminar el elemento del padre que se unio con la fusion*/
												me.eliminarElemento(elementoDivisor,"recursion","sinIntercambio","expresion");
									}
										}else
										{
											if(politica=="izquierdaODer")
											{
												//me quedo con la posicion del hermano adyacente izquierdo
												posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
												//me quedo con el nodo hermano adyacente izquierdo
												nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
												//pregunto si el hermano adyacente izquierdo puede cederme un elemento
												if(eval(nodoIzquierdo+".elementos.length-1") >= minElementos)//puede cederme
												{
													//pueden cederme un elemento el hermano izquierdo hago la redistribucion
													/*me quedo con la posicion del elemento del nodo padre que hace de divisor entre 
													los nodos*/
													posIntermedia=parseInt(numeroNodo)-1;
													/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas 
													grande del nodoIzq*/
													elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
													//me quedo con el elemento mas grande del hermano izquierdo
													posicionMaxima=eval(nodoIzquierdo+".elementos.length-1");
													elementoMaximo=eval(nodoIzquierdo+".elementos["+posicionMaxima+"]");
													/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas chicos del 
													nodo donde se esta borrando*/
													posicionHijoRota=parseInt(posicionMaxima)+1;
													if(eval(nodoIzquierdo+".hijos").length !=0)
													{
														hijosRotacion=nodoIzquierdo+".hijos["+posicionHijoRota+"]";
														eval(nodo+".hijos").unshift(eval(hijosRotacion));
														//elimino los hijos que pasaron 
														me.borrarElementoDeVector(nodoIzquierdo+".hijos",posicionHijoRota);
														deshabilitarBotonesEstrella();
														encolarOperacion("borrarElementoDeNodoIntermedioConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
														encolarOperacion("redistribuirADerConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
													}else
													{
														if(cambio=="sinIntercambio")
														{ 
															deshabilitarBotones();
															encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
															ejecutarAnimacionEstrella();
															encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
														}else
														{
															deshabilitarBotonesEstrella();
															encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
															encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
														}
													}
													/*reemplazo el elemento del nodo padre que es divisor por el elemento mas grande 
													del her.izq*/
													eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
													//disminuyo la cantidad de elementos del nodo que me cedio
													me.borrarElementoDeVector(nodoIzquierdo+".elementos",posicionMaxima);
													//reemplazo el elemento a borrar por el que estaba como intermedio en el padre
													eval(expresionCompleta+"="+elementoAuxiliar);
													/*ordeno el nodo*/
													eval(nodo+".elementos").sort(function(a,b){return a-b;});
												}else//no puede cederme el hermano izquierdo pregunto por el derecho
												{
													//me quedo con la posicion del hermano adyacente derecho
													posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
													//me quedo con el nodo hermano adyacente derecho
													nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
													//pregunto si el hermano adyacente derecho puede cederme un elemento
													if(eval(nodoDerecho+".elementos.length-1") >= minElementos)//puede cederme
													{
														//pueden cederme un elemento el hermano derecho hago la redistribucion
														/*me quedo con la posicion del elemento del nodo padre que hace de divisor 
														entre los nodos*/
														posIntermedia=parseInt(numeroNodo);
														/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas 
														chico del nodoDer*/
														elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
														//me quedo con el elemento mas chico del hermano derecho
														posicionMinima=0;
														elementoMinimo=eval(nodoDerecho+".elementos["+posicionMinima+"]");
														/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grande 
														del nodo donde se esta borrando*/
														posicionHijoRota=0;
														if(eval(nodoDerecho+".hijos").length !=0)
														{
															hijosRotacion=nodoDerecho+".hijos["+posicionHijoRota+"]";
															eval(nodo+".hijos").push(eval(hijosRotacion));
															//elimino los hijos que pasaron 
															me.borrarElementoDeVector(nodoDerecho+".hijos",posicionHijoRota);
															deshabilitarBotonesEstrella();
															encolarOperacion("borrarElementoDeNodoIntermedioConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
															encolarOperacion("redistribuirAIzqConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
														}else
														{
															//tengo que encolar la operacion de la vista de redistribucion a izquierda				
															if(cambio=="sinIntercambio")
															{
																deshabilitarBotonesEstrella();
																encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																ejecutarAnimacionEstrella();
																encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
															}else
															{
																deshabilitarBotonesEstrella();
																encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
															}
											
														}
														/*reemplazo el elemento del nodo padre que es divisor por el elemento mas 
														chico del her.der*/
														eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
														//disminuyo la cantidad de elementos del nodo que me cedio
														me.borrarElementoDeVector(nodoDerecho+".elementos",posicionMinima);
														//reemplazo el elemento a borrar por el que estaba como intermedio en el padre
														eval(expresionCompleta+"="+elementoAuxiliar);
														/*ordeno el nodo*/
														eval(nodo+".elementos").sort(function(a,b){return a-b;});
													}else//no puede cederme tampoco el hermano derecho fusiono con el izquierdo
													{
														//me quedo con la posicion del hermano adyacente izquierdo
														posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
														//me quedo con el nodo hermano adyacente izquierdo
														nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
														/*me quedo con la posicion del elemento del nodo padre que hace de divisor 
														entre los nodos*/
														posIntermedia=parseInt(numeroNodo)-1;
														/*me quedo con los elementos del nodo donde esta el elemento a eliminar sin el
														elemento que se elimina*/
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
														/*paso los elementos del nodo donde elimine el elemento sin el elemento 
														eliminado*/
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
														/*Elimino el nodo completo donde se encontraba el elemento a eliminar por la 
														fusion*/
														vectorDeHijos=padre+".hijos";
														me.borrarElementoDeVector(vectorDeHijos,numeroNodo);
														if(vuelta=="normal")
														{
															if(cambio=="intercambio")
															{
																deshabilitarBotonesEstrella();
																encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
																encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
															}else
															{
																deshabilitarBotonesEstrella();
																encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
																ejecutarAnimacionEstrella();
																encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
															}
														}else
														{
															deshabilitarBotonesEstrella();
															encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
															encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
														}
														/*llamo recursivamente para eliminar el elemento del padre que se unio con la 
														fusion*/
														me.eliminarElemento(elementoDivisor,"recursion","sinIntercambio","expresion");
													}
												}
											}else
											{
												if(politica=="derOIzq")
												{
													//me quedo con la posicion del hermano adyacente derecho
													posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
													//me quedo con el nodo hermano adyacente derecho
													nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
													//pregunto si el hermano adyacente derecho puede cederme un elemento
													if(eval(nodoDerecho+".elementos.length-1") >= minElementos)//puede cederme
													{
														//pueden cederme un elemento el hermano derecho hago la redistribucion
														/*me quedo con la posicion del elemento del nodo padre que hace de divisor 
														entre los nodos*/
														posIntermedia=parseInt(numeroNodo);
														/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas 
														chico del nodoDer*/
														elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
														//me quedo con el elemento mas chico del hermano derecho
														posicionMinima=0;
														elementoMinimo=eval(nodoDerecho+".elementos["+posicionMinima+"]");
														/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas grande 
														del nodo donde se esta borrando*/
														posicionHijoRota=0;
														if(eval(nodoDerecho+".hijos").length !=0)
														{
															hijosRotacion=nodoDerecho+".hijos["+posicionHijoRota+"]";
															eval(nodo+".hijos").push(eval(hijosRotacion));
															//elimino los hijos que pasaron 
															me.borrarElementoDeVector(nodoDerecho+".hijos",posicionHijoRota);
															deshabilitarBotonesEstrella();
															encolarOperacion("borrarElementoDeNodoIntermedioConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
															encolarOperacion("redistribuirAIzqConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
														}else
														{
															//tengo que encolar la operacion de la vista de redistribucion a izquierda				
															if(cambio=="sinIntercambio")
															{
																deshabilitarBotonesEstrella();
																encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																ejecutarAnimacionEstrella();
																encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
															}else
															{
																deshabilitarBotonesEstrella();
																encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
															}
											
														}
														/*reemplazo el elemento del nodo padre que es divisor por el elemento mas 
														chico del her.der*/
														eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
														//disminuyo la cantidad de elementos del nodo que me cedio
														me.borrarElementoDeVector(nodoDerecho+".elementos",posicionMinima);
														//reemplazo el elemento a borrar por el que estaba como intermedio en el padre
														eval(expresionCompleta+"="+elementoAuxiliar);
														/*ordeno el nodo*/
														eval(nodo+".elementos").sort(function(a,b){return a-b;});
													}else//el hermano derecho no puede ceder pregunto por el hermano izquierdo
													{
															//me quedo con la posicion del hermano adyacente izquierdo
															posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
															//me quedo con el nodo hermano adyacente izquierdo
															nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
															//pregunto si el hermano adyacente izquierdo puede cederme un elemento
															if(eval(nodoIzquierdo+".elementos.length-1") >= minElementos)//puede cederme
															{
																/*pueden cederme un elemento el hermano izquierdo hago la 
																redistribucion*/
																/*me quedo con la posicion del elemento del nodo padre que hace de 
																divisor entre los nodos*/
																posIntermedia=parseInt(numeroNodo)-1;
																/*guardo el elemento del nodo padre que sera reemplazado por el 
																elemento mas grande del nodoIzq*/
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
																	deshabilitarBotonesEstrella();
																	encolarOperacion("borrarElementoDeNodoIntermedioConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																	encolarOperacion("redistribuirADerConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
																}else
																{
																	if(cambio=="sinIntercambio")
																	{ 
																		deshabilitarBotones();
																		encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																		ejecutarAnimacionEstrella();
																		encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
																	}else
																	{
																		deshabilitarBotonesEstrella();
																		encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																		encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
																	}
																}
																/*reemplazo el elemento del nodo padre que es divisor por el elemento 
																mas grande del her.izq*/
																eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
																//disminuyo la cantidad de elementos del nodo que me cedio
																me.borrarElementoDeVector(nodoIzquierdo+".elementos",posicionMaxima);
																/*reemplazo el elemento a borrar por el que estaba como intermedio en 
																el padre*/
																eval(expresionCompleta+"="+elementoAuxiliar);
																/*ordeno el nodo*/
																eval(nodo+".elementos").sort(function(a,b){return a-b;});
														}else
														//no puede cederme tampoco el hermano izquierdo fusiono con hermano derecho
														{
															//me quedo con la posicion del hermano adyacente derecho
															posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
															//me quedo con el nodo hermano adyacente derecho
															nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
															/*me quedo con la posicion del elemento del nodo padre que hace de divisor
															entre los nodos*/
															posIntermedia=parseInt(numeroNodo);
															/*me quedo con los elementos del nodo donde esta el elemento a eliminar 
															sin el elemento que se elimina*/
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
															/*paso los elementos del nodo donde elimine el elemento sin el elemento 
															eliminado al nodo derecho*/
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
															/*Elimino el nodo completo donde se encontraba el elemento a eliminar por 
															la fusion*/
															vectorDeHijos=padre+".hijos";
															me.borrarElementoDeVector(vectorDeHijos,numeroNodo);
															if(vuelta=="normal")
															{
																if(cambio=="intercambio")
																{
																	deshabilitarBotonesEstrella();
																	encolarOperacion("borrarFusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
																	encolarOperacion("fusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
																}else
																{
																	deshabilitarBotonesEstrella();
																	encolarOperacion("borrarFusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
																	ejecutarAnimacionEstrella();
																	encolarOperacion("fusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");

																}
															}else
															{
																	deshabilitarBotonesEstrella();
																	encolarOperacion("borrarFusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
																	encolarOperacion("fusionConHermanoDerechoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
															}
															/*llamo recursivamente para eliminar el elemento del padre que se unio con
															la fusion*/
															me.eliminarElemento(elementoDivisor,"recursion","sinIntercambio","expresion");
															}
													}
												}else
												{
													/*politica izquierda y derecha, intenta redistribuir con el hermano izquierdo si 
													no puede con el derecho y si tampoco puede fusiona con el izquierdo*/
													//me quedo con la posicion del hermano adyacente izquierdo
													posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
													//me quedo con el nodo hermano adyacente izquierdo
													nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
													//pregunto si el hermano adyacente izquierdo puede cederme un elemento
													if(eval(nodoIzquierdo+".elementos.length-1") >= minElementos)//puede cederme
													{
														//pueden cederme un elemento el hermano izquierdo hago la redistribucion
														/*me quedo con la posicion del elemento del nodo padre que hace de divisor 
														entre los nodos*/
														posIntermedia=parseInt(numeroNodo)-1;
														/*guardo el elemento del nodo padre que sera reemplazado por el elemento mas 
														grande del nodoIzq*/
														elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
														//me quedo con el elemento mas grande del hermano izquierdo
														posicionMaxima=eval(nodoIzquierdo+".elementos.length-1");
														elementoMaximo=eval(nodoIzquierdo+".elementos["+posicionMaxima+"]");
														/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas chicos 
														del nodo donde se esta borrando*/
														posicionHijoRota=parseInt(posicionMaxima)+1;
														if(eval(nodoIzquierdo+".hijos").length !=0)
														{
															hijosRotacion=nodoIzquierdo+".hijos["+posicionHijoRota+"]";
															eval(nodo+".hijos").unshift(eval(hijosRotacion));
															//elimino los hijos que pasaron 
															me.borrarElementoDeVector(nodoIzquierdo+".hijos",posicionHijoRota);
															deshabilitarBotonesEstrella();
															encolarOperacion("borrarElementoDeNodoIntermedioConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
															encolarOperacion("redistribuirADerConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
														}else
														{
															if(cambio=="sinIntercambio")
															{ 
																deshabilitarBotones();
																encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																ejecutarAnimacionEstrella();
																encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
															}else
															{
																deshabilitarBotonesEstrella();
																encolarOperacion("borrarElementoDeNodoHojaConUnderADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																encolarOperacion("redistribuirADerEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
															}
														}
														/*reemplazo el elemento del nodo padre que es divisor por el elemento mas 
														grande del her.izq*/
														eval(padre+".elementos["+posIntermedia+"]="+elementoMaximo);
														//disminuyo la cantidad de elementos del nodo que me cedio
														me.borrarElementoDeVector(nodoIzquierdo+".elementos",posicionMaxima);
														//reemplazo el elemento a borrar por el que estaba como intermedio en el padre
														eval(expresionCompleta+"="+elementoAuxiliar);
														/*ordeno el nodo*/
														eval(nodo+".elementos").sort(function(a,b){return a-b;});
													}else//no puede cederme el hermano izquierdo pregunto por el derecho
													{
														//me quedo con la posicion del hermano adyacente derecho
														posicionHermanoDer=parseInt(nodo.substr(nodo.length-2,1))+1;
														//me quedo con el nodo hermano adyacente derecho
														nodoDerecho=nodo.substr(0,nodo.length-2)+posicionHermanoDer+"]";
														//pregunto si el hermano adyacente derecho puede cederme un elemento
														if(eval(nodoDerecho+".elementos.length-1") >= minElementos)//puede cederme
														{
															//pueden cederme un elemento el hermano derecho hago la redistribucion
															/*me quedo con la posicion del elemento del nodo padre que hace de divisor
															entre los nodos*/
															posIntermedia=parseInt(numeroNodo);
															/*guardo el elemento del nodo padre que sera reemplazado por el elemento 
															mas chico del nodoDer*/
															elementoAuxiliar=eval(padre+".elementos["+posIntermedia+"]");
															//me quedo con el elemento mas chico del hermano derecho
															posicionMinima=0;
															elementoMinimo=eval(nodoDerecho+".elementos["+posicionMinima+"]");
															/*si el elemento que rota tiene hijos deben pasar a ser los hijos mas 
															grande del nodo donde se esta borrando*/
															posicionHijoRota=0;
															if(eval(nodoDerecho+".hijos").length !=0)
															{
																hijosRotacion=nodoDerecho+".hijos["+posicionHijoRota+"]";
																eval(nodo+".hijos").push(eval(hijosRotacion));
																//elimino los hijos que pasaron 
																me.borrarElementoDeVector(nodoDerecho+".hijos",posicionHijoRota);
																deshabilitarBotonesEstrella();
																encolarOperacion("borrarElementoDeNodoIntermedioConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																encolarOperacion("redistribuirAIzqConHijosEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
															}else
															{
																/*tengo que encolar la operacion de la vista de redistribucion a 
																izquierda*/
																if(cambio=="sinIntercambio")
																{
																	deshabilitarBotonesEstrella();
																	encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																	ejecutarAnimacionEstrella();
																	encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
																}else
																{
																	deshabilitarBotonesEstrella();
																	encolarOperacion("borrarElementoDeNodoHojaConUnderAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+")");
																	encolarOperacion("redistribuirAIzqEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoAuxiliar+",'extremo'"+")");
																}
											
															}
															/*reemplazo el elemento del nodo padre que es divisor por el elemento mas 
															chico del her.der*/
															eval(padre+".elementos["+posIntermedia+"]="+elementoMinimo);
															//disminuyo la cantidad de elementos del nodo que me cedio
															me.borrarElementoDeVector(nodoDerecho+".elementos",posicionMinima);
															/*reemplazo el elemento a borrar por el que estaba como intermedio en el 
															padre*/
															eval(expresionCompleta+"="+elementoAuxiliar);
															/*ordeno el nodo*/
															eval(nodo+".elementos").sort(function(a,b){return a-b;});
														}else//no puede cederme tampoco el hermano derecho fusiono con el izquierdo
														{
															//me quedo con la posicion del hermano adyacente izquierdo
															posicionHermanoIzq=parseInt(nodo.substr(nodo.length-2,1))-1;
															//me quedo con el nodo hermano adyacente izquierdo
															nodoIzquierdo=nodo.substr(0,nodo.length-2)+posicionHermanoIzq+"]";
															/*me quedo con la posicion del elemento del nodo padre que hace de divisor
															entre los nodos*/
															posIntermedia=parseInt(numeroNodo)-1;
															/*me quedo con los elementos del nodo donde esta el elemento a eliminar 
															sin el elemento que se elimina*/
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
															/*paso los elementos del nodo donde elimine el elemento sin el elemento 
															eliminado*/
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
															/*Elimino el nodo completo donde se encontraba el elemento a eliminar por 
															la fusion*/
															vectorDeHijos=padre+".hijos";
															me.borrarElementoDeVector(vectorDeHijos,numeroNodo);
															if(vuelta=="normal")
															{
																if(cambio=="intercambio")
																{
																	deshabilitarBotonesEstrella();
																	encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
																	encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
																}else
																{
																	deshabilitarBotonesEstrella();
																	encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
																	ejecutarAnimacionEstrella();
																	encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
																}
															}else
															{
																deshabilitarBotonesEstrella();
																encolarOperacion("borrarFusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+")");
																encolarOperacion("fusionConHermanoIzquierdoEstrella("+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+","+elementoDivisor+",'extremo'"+")");
															}
															/*llamo recursivamente para eliminar el elemento del padre que se unio con
															la fusion*/
															me.eliminarElemento(elementoDivisor,"recursion","sinIntercambio","expresion");
														}
												}

												}
											}
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
					encolarOperacion("intercambiarElementosEstrella("+alturaGraficoIntercambio+","+nodoGraficoIntercambio+","+posicionElementoGraficoIntercambio+","+alturaGrafico+","+nodoGrafico+","+posicionElementoGrafico+")");
					ejecutarAnimacionEstrella();
					//llamo recursivamente al eliminar
					me.eliminarElemento(elemento,"normal","intercambio",expresionBusquedaIntercambio);
				}
			}
		}else
		{
			alert("arbol vacio");
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
			me.obtenerMenorRamaDerecha(ramaDerecha+".hijos[0]");
		}
   }//fin de obtenerMenorRamaDerecha
   
   me.deDosATres=function(nodoOverflow,nodoHermano,padre,posPadre,numeroNodo,expresion,politica,operacion)
   {
	   /*creo un unico vector con los elementos del nodo que desbordo, el separador del padre y los elementos del hermano*/
	   var vectorTotal=new NodoBEstrella();
	   if(operacion=="fusionADerecha")
	   {
			/*paso los elementos del nodo que desbordo a vector total*/
	   		for(var h=0;h<=eval(nodoOverflow+".elementos").length-1;h++)
	   		{
		   		vectorTotal.elementos[h]=eval(nodoOverflow+".elementos["+h+"]");
	   		}
	   		/*paso los hijos del nodo que desbordo a vector total si tiene*/
	   		if(eval(nodoOverflow+".hijos").length !=0)
	   		{
	   			for(var h=0;h<=eval(nodoOverflow+".hijos").length-1;h++)
	   			{
		   			vectorTotal.hijos[h]=eval(nodoOverflow+".hijos["+h+"]");
	   			}
	   		}
	   		/*paso el elemento divisor entre los nodos a vector total*/
	   		vectorTotal.elementos[vectorTotal.elementos.length]=eval(padre+".elementos["+posPadre+"]");
	   		/*paso los elementos del hermano a vector total*/
	   		for(var v=0;v<=eval(nodoHermano+".elementos").length-1;v++)
	   		{
		   		vectorTotal.elementos[vectorTotal.elementos.length]=eval(nodoHermano+".elementos["+v+"]");
	   		}
	   		if(eval(nodoHermano+".hijos").length !=0)
	   		{
	   			/*paso los hijos del hermano a vector total si tiene*/
	   			for(var i=0;i<=eval(nodoHermano+".hijos").length-1;i++)
	   			{
		   			vectorTotal.hijos[vectorTotal.hijos.length]=eval(nodoHermano+".hijos["+i+"]");
	   			}	
	   		}
			
	   }else
	   {
		   if(operacion=="fusionAIzquierda")
		   {
			   /*paso los elementos del nodo hermano a vector total*/
	   			for(h=0;h<=eval(nodoHermano+".elementos").length-1;h++)
	   			{
		   			vectorTotal.elementos[h]=eval(nodoHermano+".elementos["+h+"]");
	   			}
	   			/*paso los hijos del nodo hermano a vector total si tiene*/
	   			if(eval(nodoHermano+".hijos").length !=0)
	   			{
	   				for(h=0;h<=eval(nodoHermano+".hijos").length-1;h++)
	   				{
		   				vectorTotal.hijos[h]=eval(nodoHermano+".hijos["+h+"]");
	   				}
	   			}
	   			/*paso el elemento divisor entre los nodos a vector total*/
	   			vectorTotal.elementos[vectorTotal.elementos.length]=eval(padre+".elementos["+posPadre+"]");
	   			/*paso los elementos del nodo que desbordo a vector total*/
	   			for(v=0;v<=eval(nodoOverflow+".elementos").length-1;v++)
	   			{
		   			vectorTotal.elementos[vectorTotal.elementos.length]=eval(nodoOverflow+".elementos["+v+"]");
	   			}
	   			if(eval(nodoOverflow+".hijos").length !=0)
	   			{
	   				/*paso los hijos del nodo que desbordo a vector total si tiene*/
	   				for(v=0;v<=eval(nodoOverflow+".hijos").length-1;v++)
	   				{
		   				vectorTotal.hijos[vectorTotal.hijos.length]=eval(nodoOverflow+".hijos["+v+"]");
	   				}
	   			}
		   }
	   }
	   /*creo los tres vectores que representan los nuevos nodos*/
	   var vectorUno=new NodoBEstrella();
	   var vectorDos=new NodoBEstrella();
	   var contadorVectorDos=0;
	   var vectorTres=new NodoBEstrella();
	   var contadorVectorTres=0;
	   for(var h=0;h<=vectorTotal.elementos.length-1;h++)
	   {
		   if(h < dosTercios)
		   {
			   vectorUno.elementos[h]=vectorTotal.elementos[h];
		   }else
		   {
			   if((h > dosTercios)&&(h < dosTercios+dosTercios+1))
		       {
				   vectorDos.elementos[contadorVectorDos]=vectorTotal.elementos[h];
				   contadorVectorDos++;
				}else
				{
					if(h > dosTercios+dosTercios+1)
					{
						vectorTres.elementos[contadorVectorTres]=vectorTotal.elementos[h];
						contadorVectorTres++;
					}
				}
		   }
	   }
	   contadorVectorDos=0;
	   contadorVectorTres=0;
	   if(vectorTotal.hijos.length !=0)
	   {
			for(var h=0;h<=vectorTotal.hijos.length-1;h++)
	   		{
		   		if(h <= dosTercios)
		   		{
			   		vectorUno.hijos[h]=vectorTotal.hijos[h];
		   		}else
		   		{
			   		if((h > dosTercios)&&(h <= dosTercios+dosTercios+1))
		       		{
				   		vectorDos.hijos[contadorVectorDos]=vectorTotal.hijos[h];
				   		contadorVectorDos++;
					}else
						{
							if(h > dosTercios+dosTercios+1)
							{
								vectorTres.hijos[contadorVectorTres]=vectorTotal.hijos[h];
								contadorVectorTres++;
							}
						}
		   			}
	   			}
		   
		}
	   //me quedo con los divisores
	   separadorUno=vectorTotal.elementos[dosTercios];
	   separadorDos=vectorTotal.elementos[dosTercios+dosTercios+1];
	   //borro el elemento separador original
	   me.borrarElementoDeVector(padre+".elementos",posPadre);
	   //inserto los tres nodos creados como hijos del nivel superior
	   if(operacion=="fusionADerecha")
	   {
		   eval(padre+".hijos").splice(numeroNodo,2,vectorUno,vectorDos,vectorTres);
	   }else
	   {
		   	if(operacion=="fusionAIzquierda")
		   	{
				eval(padre+".hijos").splice(numeroNodo-1,2,vectorUno,vectorDos,vectorTres);
			}
		}
	   //llamo a insertar elemento con los dos elementos que deben promocionar
	   //corto expresion para moverme en altura en el arbol
		expresionRecursiva=expresion.substr(0,expresion.length-19)+".elementos";
	   //posicion del nodo padre  que apunta al hijo actual
		posicionNodoPadre=parseInt(expresion.substr(expresion.length-12,1));
		expresionCompleta=expresion.substr(0,expresionCompleta.length-22)+".elementos[0]";
		me.insertoElemento(separadorUno,expresionRecursiva,expresionCompleta,"recursion",politica);
		me.insertoElemento(separadorDos,expresionRecursiva,expresionCompleta,"recursion",politica)
		   
		
	   
   }//finde deDosATres
   
  me.deTresACuatro = function(nodoOverflow,nodoIzquierdo,nodoDerecho,padre,posIntermedia,posIntermediaSiguiente,numeroNodo,expresion,politica)
   	{
		/*creo un unico vector que contendra los elementos del nodoIzquierda, los elementos separadores del padre, los elementos del 
		nodo que desbordo y los elementos del nodo Derecho*/
		vectorTotal=new NodoBEstrella;
		/*paso los elementos del nodo izquierdo al nodo total*/
		for(h=0;h<=eval(nodoIzquierdo+".elementos").length-1;h++)
		{
			vectorTotal.elementos[h]=eval(nodoIzquierdo+".elementos["+h+"]");
		}
		/*si el nodo Izquierdo tiene hijos los paso a vector total*/
		if(eval(nodoIzquierdo+".hijos").length != 0)
		{
			for(h=0;h<=eval(nodoIzquierdo+".hijos").length-1;h++)
			{
				vectorTotal.hijos[h]=eval(nodoIzquierdo+".hijos["+h+"]");
			}
		}
		/*paso el primer elemento divisor a vector total*/
		vectorTotal.elementos[vectorTotal.elementos.length]=eval(padre+".elementos["+posIntermedia+"]");
		/*paso los elementos del vector que desbordo a vector total*/
		for(x=0;x<=eval(nodoOverflow+".elementos").length-1;x++)
		{
			vectorTotal.elementos[vectorTotal.elementos.length]=eval(nodoOverflow+".elementos["+x+"]");
		}
		/*si el nodo que desbordo tiene hijos los paso a vector total*/
		if(eval(nodoOverflow+".hijos").length !=0)
		{
			for(x=0;x<=eval(nodoOverflow+".hijos").length-1;x++)
			{
				vectorTotal.hijos[vectorTotal.hijos.length]=eval(nodoOverflow+".hijos["+x+"]");
			}
		}
		/*paso el segundo elemento divisor a vector total*/
		vectorTotal.elementos[vectorTotal.elementos.length]=eval(padre+".elementos["+posIntermediaSiguiente+"]");
		/*paso los elementos del nodo derecho a vector total*/
		for(j=0;j<=eval(nodoDerecho+".elementos").length-1;j++)
		{
			vectorTotal.elementos[vectorTotal.elementos.length]=eval(nodoDerecho+".elementos["+j+"]");
		}
		/*si tiene paso los hijos del nodo derecho a vector total*/
		if(eval(nodoDerecho+".hijos").length != 0)
		{
			for(j=0;j<=eval(nodoDerecho+".hijos").length-1;j++)
			{
				vectorTotal.hijos[vectorTotal.hijos.length]=eval(nodoDerecho+".hijos["+j+"]");
			}
		}
		/*creo los cuatro nodos que representan los nuevos nodos*/
		vectorUno=new NodoBEstrella;
		vectorDos=new NodoBEstrella;
		vectorTres=new NodoBEstrella;
		vectorCuatro=new NodoBEstrella;
		contadorDos=0;
		contadorTres=0;
		contadorCuatro=0;
		/*separo los elementos del vector total en los 4 nodos*/
		for(var h=0;h<=vectorTotal.elementos.length-1;h++)
		{
			if(h < tresCuartos)
			{
				vectorUno.elementos[h]=vectorTotal.elementos[h];
			}else
			{
				if(( h > tresCuartos)&&( h < tresCuartos+tresCuartos+1))
				{
					vectorDos.elementos[contadorDos]=vectorTotal.elementos[h];
					contadorDos++;
				}else
				{
					if (( h > 2*tresCuartos+1)&&( h < 3*tresCuartos+2))
					{
						vectorTres.elementos[contadorTres]=vectorTotal.elementos[h];
						contadorTres++;
					}else
					{
						if(h > 3*tresCuartos+2)
						{
							vectorCuatro.elementos[contadorCuatro]=vectorTotal.elementos[h];
							contadorCuatro++;
						}
					}
				}
			}
		}
		/*separo los hijos del vector total en los 4 nodos*/
		contadorDos=0;
		contadorTres=0;
		contadorCuatro=0;
		if(vectorTotal.hijos.length !=0)
		{
				for(h=0;h<=vectorTotal.hijos.length-1;h++)
	   			{
		   			if(h <= tresCuartos)
		   			{
			   			vectorUno.hijos[h]=vectorTotal.hijos[h];
		   			}else
		   			{
			   			if((h > tresCuartos)&&(h <= 2*tresCuartos+1))
		       			{
				   			vectorDos.hijos[contadorDos]=vectorTotal.hijos[h];
				   			contadorDos++;
						}else
						{
							if ((h > 2*tresCuartos+1)&&( h <= 3*tresCuartos+2))
							{
								vectorTres.hijos[contadorTres]=vectorTotal.hijos[h];
								contadorTres++;
							}else
							{
								if (h > 3*tresCuartos+2)
								{
									vectorCuatro.hijos[contadorCuatro]=vectorTotal.hijos[h];
									contadorCuatro++;
								}
							}
						}
		   			}
	   			}
		   }
		   /*me quedo con los elementos separadores*/
		   separadorUno=vectorTotal.elementos[tresCuartos];
		   separadorDos=vectorTotal.elementos[tresCuartos+tresCuartos+1];
		   separadorTres=vectorTotal.elementos[tresCuartos+tresCuartos+tresCuartos+2];
		   /*borro los elementos separadores del padre*/
		   me.borrarElementoDeVector(padre+".elementos",posIntermedia);
		   me.borrarElementoDeVector(padre+".elementos",posIntermedia);
		   /*inserto los nodos creados*/
		   eval(padre+".hijos").splice(numeroNodo-1,3,vectorUno,vectorDos,vectorTres,vectorCuatro);
		   //llamo a insertar elemento con los tres elementos que deben promocionar
	   		//corto expresion para moverme en altura en el arbol
			expresionRecursiva=expresion.substr(0,expresion.length-19)+".elementos";
	   		//posicion del nodo padre  que apunta al hijo actual
			posicionNodoPadre=parseInt(expresion.substr(expresion.length-12,1));
			expresionCompleta=expresion.substr(0,expresionCompleta.length-22)+".elementos[0]";
			me.insertoElemento(separadorUno,expresionRecursiva,expresionCompleta,"recursion",politica);
			me.insertoElemento(separadorDos,expresionRecursiva,expresionCompleta,"recursion",politica);
			me.insertoElemento(separadorTres,expresionRecursiva,expresionCompleta,"recursion",politica)
		
	}//fin de deTresACuatro
	
	me.destruirArbolActual=function ()
	{
		arbol=null;
		encolarOperacionEstrella("destruirArbolEstrella()");
		ejecutarAnimacionEstrella();
	}
	
}//fin de la clase
	

