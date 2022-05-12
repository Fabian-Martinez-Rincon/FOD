var arbol;

function soloNumeros(e)
{
	
	var keynum = window.event ? window.event.keyCode : e.which;
	if ( keynum == 8 ) return true;
		return /\d/.test(String.fromCharCode(keynum));
}

function soloNumerosEInsercion(e)
{
	
	var keynum = window.event ? window.event.keyCode : e.which;
	if(keynum == 13)//aprieta enter
	{
		if(arbol!==undefined)
		{
			if(document.getElementById("numeroAInsertar").value!='')
			{
				arbol.insertarElemento(parseInt(document.getElementById("numeroAInsertar").value));
			}else
			{
				alert("No Ingresaste ning\u00fan n\u00famero para insertar en el \u00e1rbol");
			}
		}else
		 {
			 alert("Cree el \u00e1rbol antes de insertar un elemento");
			 }
	}
	if ( keynum == 8 ) return true;
		return /\d/.test(String.fromCharCode(keynum));
}

function resetearCampos()
{
	document.getElementById('tipoArbol').value='arbolB';
	document.getElementById('orden').value='';
	document.getElementById('numeroAInsertar').value='';
	document.getElementById('numeroAEliminar').value='';
	document.getElementById('numeroABuscar').value='';
}

function resetearCamposOperacion()
{
	document.getElementById('numeroAInsertar').value='';
	document.getElementById('numeroAEliminar').value='';
	document.getElementById('numeroABuscar').value='';
}

$(document).ready(function (){
	resetearCampos();
	$("#insertar").click(function() { 
		if(arbol!=undefined)
		{
			if(arbolLimpio)
			{
				if(document.getElementById("numeroAInsertar").value!='')
				{
						if(document.getElementById('tipoArbol').value=='arbolB*')
						{
							politica=obtenerPolitica();
							arbol.insertarElemento(parseFloat(document.getElementById("numeroAInsertar").value),politica);
							resetearCamposOperacion();
						}else
						{
							arbol.insertarElemento(parseFloat(document.getElementById("numeroAInsertar").value));
							resetearCamposOperacion();
						}
					
				}else
				{
					alert("Ingrese un n\u00famero para insertar en el \u00e1rbol");
				}
			}else
			{
				alert("Debe limpiar el \u00e1rbol antes de insertar un elemento nuevo");
			}
		}else
		{
			alert("Cree el \u00e1rbol antes de insertar un elemento");
		}
     });
	
	$("#busco").click(function() { 
		if(arbolLimpio==true)
		{
			if(arbol!=undefined)
			{
				if(document.getElementById("numeroABuscar").value!='')
				{
					arbolLimpio=false;
					arbol.buscarElementoEnArbol(parseInt(document.getElementById("numeroABuscar").value));
				}else
				{
					alert("Ingrese un n\u00famero para buscar en el \u00e1rbol");
				}
			}else
			{
				alert("Cree el \u00e1rbol antes de buscar un elemento");
			}
		}else
		{
			alert("Debe limpiar el \u00e1rbol antes de realizar otra b\u00fasqueda");
		}
     });
	
	$("#resetear").click(function() { 
		if(arbol!=undefined)
		{
			arbolLimpio=true;
			if(document.getElementById('tipoArbol').value=='arbolB')//se intenta crear un arbol B
			{
					rollBack();
					resetearCamposOperacion();
			}else
			{
				if(document.getElementById('tipoArbol').value=='arbolB+')//se intenta crear un arbol B+
				{
						rollBackBMas();
						resetearCamposOperacion();
				}else
				{
						rollBackEstrella();
						resetearCamposOperacion();
				}
			}
		}else
		{
			alert("No se ha creado el \u00e1rbol");
		}
     });
	
	$("#crearArbol").click(function() { 
		if(arbolLimpio)
		{
			if(arbol==undefined)
			{
				if(document.getElementById("orden").value >=4 )
				{
					if(document.getElementById('tipoArbol').value=='arbolB')//se intenta crear un arbol B
					{
						creoArbol();
						arbol.setearValores(parseInt(document.getElementById("orden").value));
						tipoArbol="arbolB";
					}else
					{
						if(document.getElementById('tipoArbol').value=='arbolB+')//se intenta crear un arbol B+
						{
							creoArbol();
							arbol.setearValoresBMas(parseInt(document.getElementById("orden").value));
							tipoArbol="arbolB+";
						}else
						{
							creoArbol();
							var politica=obtenerPolitica();
							deshabilitarPoliticas();
							arbol.setearValoresEstrella(parseInt(document.getElementById("orden").value),politica);
							tipoArbol="arbolB*";
						}
					}
				}else
				{
					alert("El \u00e1rbol a crear debe tener al menos orden 4");
				}
			}else
			{
				var desicion=confirm("Ya existe un \u00e1rbol creado. Realmente desea crear un \u00e1rbol nuevo y destruir el actual?");
				if(desicion)
				{
					arbol.destruirArbolActual();
					if(document.getElementById("orden").value >=4 )
					{
						creoArbol();
						if(document.getElementById('tipoArbol').value=='arbolB')//se intenta crear un arbol B
						{
							arbol.setearValores(parseInt(document.getElementById("orden").value));
							tipoArbol="arbolB";
						}else
						{
							if(document.getElementById('tipoArbol').value=='arbolB+')//se intenta crear un arbol B+
							{
								arbol.setearValoresBMas(parseInt(document.getElementById("orden").value));
								tipoArbol="arbolB+";
							}else
							{
								var politica=obtenerPolitica();
								deshabilitarPoliticas();
								arbol.setearValoresEstrella(parseInt(document.getElementById("orden").value),politica);
								tipoArbol="arbolB*";
								
							}
						}
					}else
					{
						alert("El \u00e1rbol a crear debe tener al menos orden 4");
					}
				}else//fin de desicion
				{
						if(tipoArbol=="arbolB")//se intenta crear un arbol B
						{
							document.getElementById('tipoArbol').selectedIndex=0;
							$("#opcionesArbolEstrella").addClass("nadaEstrella").removeClass("todoEstrella");
						}else
						{
							if(tipoArbol=="arbolB+")//se intenta crear un arbol B+
							{
								document.getElementById('tipoArbol').selectedIndex=1;
								 $("#opcionesArbolEstrella").addClass("nadaEstrella").removeClass("todoEstrella");
							}else
							{
								document.getElementById('tipoArbol').selectedIndex=2;
								 $("#opcionesArbolEstrella").addClass("todoEstrella").removeClass("nadaEstrella");
							}
						}
						
				}
			}
		}else// del if arbol limpio
		{
			alert("Debe limpiar el \u00e1rbol antes de crear uno nuevo");
		}
     });
	
	$("#eliminar").click(function() { 
			if(arbol!=undefined)
			{
				if(arbolLimpio)
				{
					if(document.getElementById("numeroAEliminar").value!='')
					{
		
						arbol.eliminarElemento(parseInt(document.getElementById("numeroAEliminar").value),"normal","sinIntercambio","expresion");  
						resetearCamposOperacion();
					
					}else
					{
						alert("Ingrese un n\u00famero para eliminar del \u00e1rbol");
					}
				}else
				{
					alert("Debe limpiar el \u00e1rbol antes de eliminar un elemento");
				}
			}else
			{
				alert("Cree el \u00e1rbol antes de eliminar un elemento");
			}
		
     });
	
})

function creoArbol()
{
	if(document.getElementById('tipoArbol').value=='arbolB')//se intenta crear un arbol B
	{
		arbol=new NodoB;
	}else
	{
		if(document.getElementById('tipoArbol').value=='arbolB+')//se intenta crear un arbol B+
		{
			arbol=new NodoBMas;
		}else
		{
			arbol=new NodoBEstrella;
			}
	}
}

function obtenerPolitica()
{
	for(var i=0;i<document.getElementById('form1').politica.length;i++)
	{
		if(document.getElementById('form1').politica[i].checked)
		{
			 poli=document.getElementById('form1').politica[i].value;
		}
	}
	return poli;
}

function deshabilitarPoliticas()
{
	
	for(var i=0;i<document.getElementById('form1').politica.length;i++)
	{
		document.getElementById('form1').politica[i].disabled=true;
		
	}
}

function habilitarPoliticas()
{
	for(var i=0;i<document.getElementById('form1').politica.length;i++)
	{
		document.getElementById('form1').politica[i].disabled=false;
		
	}
}