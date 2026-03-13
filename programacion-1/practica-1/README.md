

# Contenidos de la práctica

- Estructura y sintaxis de un programa en el lenguaje Pascal.
- Operaciones de lectura/escritura: `READ` y `WRITE`.
- Constantes y variables.
- Tipos de datos simples: `INTEGER` y `REAL`.
- Operadores matemáticos y lógicos. `DIV` y `MOD` (resto de la división entera).

---

## 1. Implemente una solución para cada uno de los siguientes enunciados simples:

### a.

Calcular e imprimir el **promedio de 2 números enteros** que se leen del teclado.

<details><summary>Resultado</summary>

```Pascal
program ej1a_promedio;
var
  num1, num2, promedio: real;
begin
  writeln('Ingrese el primer numero:');
  readln(num1);
    writeln('Ingrese el segundo numero:');
  readln(num2);

  promedio := (num1 + num2) / 2;
  writeln('El promedio es: ', promedio:0:2);
end.
```
</details>

### b.
Leer **base** y **altura** de un rectángulo e imprimir el **área** y **perímetro** del mismo.

- Área = `base * altura`
- Perímetro = `2 * base + 2 * altura`

### c.
Declarar una **constante** con un valor entre **10 y 20**, y leer un número de teclado.  
Calcular e informar el resultado de la **multiplicación entre la constante y el número**.

### d.
Declarar una **constante** con un valor entre **50 y 100**, y leer un número de teclado.  
Calcular e informar el resultado de la **división entre la constante y el número**.

---

## 2. Implemente una solución para los siguientes enunciados:

### a.
Leer **dos números enteros** de teclado y calcular e informar:

- el resultado de la **división entera**
- el **resto**

### b.
Leer un número entero que representa una **cantidad de minutos**.  
Calcular e informar la cantidad de **horas** que representa y los **minutos restantes**.

Ejemplo:

```

185 minutos = 3 horas y 5 minutos

```

---

## 3. Implemente un programa que lea el **diámetro D** de un círculo e imprima:

### a.
El **radio (R)** del círculo.

```

R = D / 2

```

### b.
El **área** del círculo.

```

Área = PI * R²
PI = 3.14

```

### c.
El **perímetro** del círculo.

```

Perímetro = D * PI

```

(o también)

```

Perímetro = 2 * PI * R

```

---

## 4.
Realice un programa que informe el **valor total en pesos de una transacción en dólares**.

El programa debe leer:

- el **monto total en dólares** de la transacción
- el **valor del dólar del día**
- el **porcentaje de comisión** que cobra el banco por la transacción

### Ejemplo

Si:

- la transacción es de **10 dólares**
- el dólar vale **1425 pesos**
- el banco cobra **4% de comisión**

Entonces el programa deberá informar:

```

La transacción será de 14820 pesos argentinos

```

(resultado de multiplicar `10 * 1425` y adicionar el `4%`)
```

Si querés, también te puedo hacer una **versión más linda para tus alumnos o para subir a GitHub**, con **separadores, emojis y ejemplos visuales** que queda mucho más claro para Programación 1.
  