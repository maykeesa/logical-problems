lista_n = []
contador = 1
number = 600851475143

for i in range(2, number, 1):
    if number % contador == 0:
        lista_n.append(contador)
        if len(lista_n) == 9:
            break
    else:
        pass
    contador += 1

print(max(lista_n))