#NUEVO EJERCICIO LISTAS DOBLES ENLAZADAS
class Nodo:
    def __init__(self,dato):
        self.dato=dato #Guarda el dato del nodo
        self.siguiente = None # apuntar siguiente
        self.anterior = None # apuntador anterior
        
        
class listaDoble:
    def __init__(self):
        self.inicio= None # Marca cual es el primer numero
        self.final= None # marca cual es el ultimo nodo
        
    def insertar_al_inicio(self,dato):
        nuevo = Nodo(dato) # crear el nuevo de la lista
        if self.inicio is None: # si la lista esta vacia
            self. inicio = nuevo # opcion true(el inicio toma el valor del nuevo)
            self.final = nuevo # (como el final toma el valor del nuevo nodo)
        else: 
            nuevo.siguiente = self.inicio # el nuevo agarra al que era primero
            self.inicio.anterior = nuevo # el viejo primero agarra al nuevo
            self.inicio = nuevo # actualiza datos
            
    def insertar_al_final(self,dato):
        nuevo= Nodo(dato)
        if self.inicio is None:
            self.inicio = nuevo # opcion true (el inicio toma el valor del nuevo)
            self.final = nuevo

        else:
            self.final.siguiente = nuevo
            nuevo.anterior= self.final
            self.final= nuevo
            
    def imprimir(self):
        actual=self.inicio
        while actual is not None:
            print (actual.dato)
        
            actual=actual.siguiente
        print("fin del nodo")
    
#Imprimir

tren_nodo = listaDoble()
tren_nodo.insertar_al_final(10)
tren_nodo.insertar_al_final(20)
tren_nodo.insertar_al_inicio(30)
tren_nodo.imprimir()
         