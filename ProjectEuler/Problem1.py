lista_valores = []

for i in range(0, 1000, 1):
    if i % 3 == 0 or i % 5 == 0:
        lista_valores.append(i)

print(sum(lista_valores))
