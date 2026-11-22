class Nodo:  # mi clase orincipal
    def __init__(self,dato): # mi funcion dentro de mi clase
        self.dato = dato # mi variable dentro de mi funcion
        self.siguiente = None # puntero al siguiente nodo
        
class lista_enlazada:
    
    def __init__(self): # def solo define la funcion
                        # init siguiente inicializar
                # cuando se cree un objeto de la clase lista enlazada, se ejecutara esta funcion
       self.cabeza = None # El inicio de la lista en primer nodo enpeieza con 0 datos
    def insertar(self,dato):
        nuevo = Nodo(dato)#reamos un nodo con el dato
        if self.cabeza is None: # si el nodo esta vacio entonces entramos a la opcion verdadero
           self.cabeza = nuevo #este nuevo ndo se conviente en el primero
           return
        actual = self.cabeza # si ya hay nodos nos paramos en el primero o en la cabeza
       
        while actual.siguiente is not None: # mientras haya un nodo nod conectamos adelante
            actual = actual.siguiente # caminar al siguiente nodo
        actual.siguiente = nuevo # ya estando el ultimo nodo, hacemos su apuntador señale al nuevo
    
    # CREAMOS LA FUNCION E MOSTRAR DATOS DE LA LISTA
    def imprimir (self):
        actual = self.cabeza # nos paramos en el primer nodo
        while actual is not None: # mientras haya un nodo
            print(actual.dato) # imprimimos el dato del nodo
            actual = actual.siguiente # nos movemos al siguiente nodo
        print("Fin de la lista") # cuando ya no haya nodos imprimimos que es el fin de la lista
# ahora imprimimos la lista emlazada
mi_lista = lista_enlazada() #  creamos la lista enlazada vacia y le paso mi funcion de lista enlazada
mi_lista.insertar(10) # insertamos el primer nodo con el dato 10
mi_lista.insertar(20) # insertamos el segundo nodo con el dato 20
mi_lista.insertar(30) # insertamos el tercer nodo con el dato 30
mi_lista.imprimir() # mostramos los datos de la lista,