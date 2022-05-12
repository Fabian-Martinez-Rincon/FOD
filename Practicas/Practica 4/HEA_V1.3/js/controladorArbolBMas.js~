document.write("<script type='text/javascript' src='js/vistaArbolBMas.js'></script>");

var vectorDeOperaciones=new Array();//vector que representa la cola de operaciones que debe ir haciendo la vista
var operacionEnCurso=false;//variable booleana que representa si la vista esta ejecutando alguna operacion
var vectorRollBack=new Array();//vector de operaciones que se realizan para hacer el rollback en caso de ser necesario
var rollBackActivo=false;//variable booleana que representa si la vista esta ejecutando alguna operacion de rollback

function encolarVectorReseteoBMas(operacion)
{
   vectorRollBack.push(operacion);
}

function ejecutarRollBack()
{
	if(rollBackActivo==false)
	{
		rollBackActivo==true;
		roll=vectorRollBack.shift();
		eval(roll);
	}
}

function ejecutarProximoRollBack()
{
	if(vectorRollBack.length !=0)
	{
		rollBackActivo==true;
		roll=vectorRollBack.shift()
		eval(roll);
	}else
	{
		rollBackActivo=false;
		}
}

function encolarOperacionBMas(operacion)
{
	vectorDeOperaciones.push(operacion);
}

function ejecutarAnimacionBMas()
{
	if(operacionEnCurso==false)
	{
		operacionEnCurso==true;
		var operacion=vectorDeOperaciones.shift();
		//alert(operacion);
		eval(operacion);
	}
}

function ejecutarProximaAnimacionBMas()
{
	if(vectorDeOperaciones.length !=0)
	{
		operacionEnCurso==true;
		var operacion=vectorDeOperaciones.shift();
		eval(operacion);
	}else
	{
		operacionEnCurso=false;
		}
}