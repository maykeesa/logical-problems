lista_fibonacci = []
lista_soma_par_fib = []

"""
aa = Antecesor do Antercesor 
a = Antecesor

"""
aa = 1
a = 2
n = 0

while aa <= 4000000:
    lista_fibonacci.append(aa)
    soma = aa + a
    aa = a
    a = soma

for i in lista_fibonacci:
    if i % 2 == 0:
        lista_soma_par_fib.append(i)
    else:
        pass

print(lista_fibonacci)
print(sum(lista_soma_par_fib))