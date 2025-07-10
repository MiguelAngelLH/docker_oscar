# Dockerización de una Aplicación Python

## Información General
- **Asignatura**: Desarrollo Web Integral IDGS91-MA2025
- **Docente**: Oscar Lira Uribe
- **Autor(es)**: Miguel Ángel Lopez Hernandez
- **Fecha de Entrega**: [10/07/2025]

## 1. Objetivos

### Objetivo General:
Crear y ejecutar una aplicación Python dentro de un contenedor Docker para demostrar el funcionamiento básico de la virtualización con Docker.

### Objetivos Específicos:
- Escribir un script en Python (app.py) que interactúe con el usuario para calcular su edad.
- Construir una imagen Docker personalizada a partir de un Dockerfile.
- Ejecutar el contenedor y verificar la correcta interacción con la aplicación.

## 2. Materiales y Equipos Utilizados

| Material/Software       | Versión/Especificaciones |
|-------------------------|--------------------------|
| Python                  | 3.11 (slim)              |
| Docker                  | [Versión de Docker Desktop] |
| Sistema Operativo       | Windows/Linux            |

## 3. Marco Teórico

### Docker:
Herramienta de virtualización que permite empaquetar aplicaciones y sus dependencias en contenedores ligeros y portables.

### Python:
Lenguaje de programación utilizado para desarrollar la lógica de la aplicación (cálculo de edad basado en fecha de nacimiento).

## 4. Desarrollo de la Práctica

### 4.1. Código Fuente (app.py)
python
from datetime import datetime

def calcular_edad(fecha_nacimiento):
    hoy = datetime.now()
    edad = hoy.year - fecha_nacimiento.year
    if (hoy.month, hoy.day) < (fecha_nacimiento.month, fecha_nacimiento.day):
        edad -= 1
    return edad

print("Hola desde docker! Si puedes ver este mensaje eres genial :)")
print("\nVamos a calcular tu edad!")

nombre = input("Por favor, ingresa tu nombre: ")
fecha_str = input("Ingresa tu fecha de nacimiento (formato DD/MM/AAAA): ")

try:
    fecha_nac = datetime.strptime(fecha_str, "%d/%m/%Y")
    edad = calcular_edad(fecha_nac)
    print(f"\nHola {nombre}! Tienes {edad} años.")
except ValueError:
    print("\nFormato de fecha incorrecto. Por favor usa DD/MM/AAAA.")

###  4.2. Dockerfile
"""FROM python:3.11-slim
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]"""

### 4.3 Comandos Ejecutados
# Construir la imagen
docker build -t app.py .

# Ejecutar el contenedor
docker run -it app.py

# 5.Resultado Final
Hola desde docker! Si puedes ver este mensaje eres genial :)

Vamos a calcular tu edad!
Por favor, ingresa tu nombre: Juan
Ingresa tu fecha de nacimiento (formato DD/MM/AAAA): 09/09/1998

Hola Juan! Tienes 26 años.

![Logo Docker](https://github.com/MiguelAngelLH/docker_oscar/blob/main/imagen.png)
