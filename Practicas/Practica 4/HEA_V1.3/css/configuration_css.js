// archivo que contiene las constantes necesaria para setear aspectos graficos del árbol
color_nodo='#D1DFDE';//color que identifica cada elemento de cada nodo
color_texto_nodo='#000';
color_puntero='transparent url(../image/puntero.png)';//color que identifica cada puntero de cada nodo #abcc85
borde_puntero='1px solid #59888e';//color y ancho del borde del puntero
borde_elemento='1px solid #59888e';//color y ancho del borde del elemento
anchoElemento=30;//ancho de cada div que contiene un elemento de un nodo
anchoPuntero=10;//ancho de cada div que representa a un puntero de un nodo
distanciaEntreNodos=90;//distancia que existe entre dos nodos hermanos
distanciaEntreRamas=50;//distancia que existe entre ramas contiguas
alturaEntreNodos=100;//distancia que separa en altura los nodos de un nivel
color_overflow='#cb4d53';//color explicacion de desborde de un nodo
borde_overflow='1px solid black';//color y ancho del borde de explicacion de desborde
color_explicacion_nuevo_nodo='#8ed443';//color explicacion creacion de nuevo nodo
borde_explicacion_nuevo_nodo='1px solid black';//borde explicacion creacion de nuevo nodo
color_division_izquierda="#00ff84";//color de elementos que por la division van al nuevo nodo izquierdo
color_division_derecha="#00b4ff";//color de elementos que por la division van al nuevo nodo derecho
color_division_cuarto_nodo="#F9F";
color_division_centro="#ff0";//color de elementos que por la division van al nodo del centro en los arboles b*
velocidad_transicion=5000;
vectorCamino=new Array();
vectorCaminoBMas=new Array();
arbolLimpio=true;;//variable que indica si el arbol esta limpio
modo="pantallaPartida";//modo de visualizacion de la pantalla
tipoArbol="arbolB";//variable que indica el tipo de arbol creado
contadorNumeroNodo=0;//variable utilizada para numerar los nodos
var limiteIzquierdoPantalla;//limite izquierdo del contenedor del arbol
var anchoTotalNodo;//ancho total de un nodo sumando elementos y punteros
var ordenGlobal;//variable que almacena el orden elegido por el usuario al momento de crear el arbol
var contexto;//variable que indica el area de dibujo del canvas
var divCanvas;
var indice_politica;//variable utilizada para saber la politica seleccionada en caso de ser un arbol b*



