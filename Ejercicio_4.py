# Cree un programa en Python basado en una lista doblemente enlazada que almacene valores numéricos enteros. El menú debe permitir al usuario manipular ambos extremos de la estructura y verificar los enlaces en ambos sentidos mediante las opciones:

class Nodo:
    def __init__(self, dato):
        self.dato = dato
        self.siguiente = None 
        self.anterior = None


class ListaDoble:
    def __init__(self):
        self.inicio = None # marca cual es el primer numero 
        self.final = None # Marca cual el es ultimo numero

    def insertar_al_inicio(self, dato): #funcion de insertar al inicio
        nuevo = Nodo(dato) # crear el nuevo nodo de la lista 
        if self.inicio is None: # para insertar al inicio, si la lista esta vacia
            self.inicio = nuevo #
            self.final = nuevo
        else:
            nuevo.siguiente = self.inicio
            self.inicio.anterior = nuevo
            self.inicio = nuevo

    def insertar_al_final(self, dato): # funcion de insertar al final
        nuevo = Nodo(dato)
        if self.inicio is None:
            self.inicio = nuevo
            self.final = nuevo
        else:
            self.final.siguiente = nuevo
            nuevo.anterior = self.final
            self.final = nuevo

    def mostrar_desde_inicio(self):
        actual = self.inicio
        while actual is not None:
            print(actual.dato)
            actual = actual.siguiente

    def mostrar_desde_final(self):
        actual = self.final
        while actual is not None:
            print(actual.dato)
            actual = actual.anterior
                
mi_lista = ListaDoble()

while True:
    print("menu .........:")
    print("1. Insertar un número al inicio de la lista")
    print("2. Insertar un número al final de la lista")
    print("3. Mostrar la lista desde el inicio hasta el final")
    print("4. Mostrar la lista desde el final hasta el inicio")
    print("5. Salir")
    print("...................")
    
    opcion = input("Seleccione una opción: ")
    
    if opcion == "1":
        dato = int(input("Ingrese un número entero: "))
        mi_lista.insertar_al_inicio(dato)
    elif opcion == "2":
        dato = int(input("Ingrese un número entero: "))
        mi_lista.insertar_al_final(dato)
    elif opcion == "3":
        mi_lista.mostrar_desde_inicio()
    elif opcion == "4":
        mi_lista.mostrar_desde_final()
    elif opcion == "5":
        break
    else:
        print("Opción inválida. Intente nuevamente.")