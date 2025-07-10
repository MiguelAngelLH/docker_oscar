# usaremos una imagen base oficial de python
FROM python:3.10-slim

#establerecer el directrorio de trabajo
WORKDIR /app

#copiar el archivo del contenedor
COPY app.python .

#Comando a ejecutar al iniciar el contenedor
CMD [ "python","app.python"]