#Desarrolle un programa en Python que implemente una lista simplemente enlazada para administrar
# los códigos numéricos de los pedidos de una tienda. El sistema debe contar con un menú interactivo que permita:

class Nodo:
    def __init__(self, codigo):
        self.codigo = codigo
        self.siguiente = None

class ListaEnlazada:
    def __init__(self):
        self.cabeza = None

    def insertar(self, codigo):
        nuevo_nodo = Nodo(codigo)
        if not self.cabeza:
            self.cabeza = nuevo_nodo
        else:
            actual = self.cabeza
            while actual.siguiente:
                actual = actual.siguiente
            actual.siguiente = nuevo_nodo

    def eliminar_ultimo(self):
        if not self.cabeza:
            print("La lista está vacía.")
            return
        if not self.cabeza.siguiente:
            self.cabeza = None
            return
        actual = self.cabeza
        while actual.siguiente.siguiente:
            actual = actual.siguiente
        actual.siguiente = None

    def mostrar(self):
        if not self.cabeza:
            print("La lista está vacía.")
            return
        actual = self.cabeza
        while actual:
            print(actual.codigo)
            actual = actual.siguiente
            

mi_lista = ListaEnlazada()

while True:
    print("\nMenú:")
    print("1. Registrar un nuevo pedido al final de la lista")
    print("2. Cancelar (eliminar) el último pedido registrado")
    print("3. Mostrar todos los pedidos actuales en orden")
    print("4. Salir del programa.")
    
    opcion = input("Seleccione una opción: ")
    
    if opcion == "1":
        codigo = input("Ingrese el código del pedido: ")
        mi_lista.insertar(codigo)
    elif opcion == "2":
        mi_lista.eliminar_ultimo()
    elif opcion == "3":
        mi_lista.mostrar()
    elif opcion == "4":
        break
    else:
        print("Opción no válida. Intente nuevamente.")
