#!/bin/bash

# Fuente: Cursos de Youtube
# Elaborado por: Oscar Paternina
# Julio 8 de 2022 - Barranquilla
# Titulo: Comentarios en bash V.01

cd DATA
while IFS= read -r line1
do
  Carpeta_Actual=$line1 
done < carpeta

while IFS= read -r line2
do
  Archivo_Actual=$line2
done < archivo

# definicion del menu inicial
Menu_Inicial () {
	echo -e "\e[1;44m============================\e[0m"
	echo -e "\e[1;31;43m    COMENTARIOS EN BASH     \e[0m"
	echo -e "\e[1;44m----------------------------\e[0m"
	echo -e "\e[30;42m1 - Crear Carpeta           \e[0m"
	echo -e "\e[30;42m2 - Crear Archivo           \e[0m"
	echo -e "\e[30;42m3 - Editar archivo          \e[0m"
	echo -e "\e[30;42m4 - Configuracion           \e[0m"
	echo -e "\e[30;42m5 - Salir                   \e[0m"
	echo -e "\e[1;44m============================\e[0m"
	echo -e "\e[30;46mCarpeta actual: $Carpeta_Actual        \e[0m" 
	echo -e "\e[30;46mArchivo actual: $Archivo_Actual       \e[0m" 
	echo -e "\e[1;44m============================\e[0m"
}

# Esta funcion crea una carpeta en el directorio y cambia a ella
Menu_Crear_Carpeta () {
	read -p "Ingrese el nombre para la carpeta: " carpeta
	mkdir -m 777 $carpeta
	cd $carpeta
	echo "Carpeta creada."
	sleep 2
	clear
	Menu_Opcion
}

# Esta funcion crea un archivo en el directorio donde este la nueva carpeta
Menu_Crear_Archivo () {
	read -p "Ingrese el nombre del arhivo: " archivo
	touch $archivo
	echo "Archivo $archivo creado"
	sleep 2
	clear
	Menu_Opcion
}

# Esta funcion abre la carpeta creada y edita el archivo con nano
Menu_Editar_Archivo () {
	gedit $Archivo_Actual
	echo "Archivo $Archivo_Actual actualizado."
	sleep 3
	clear
	Menu_Opcion
}

Menu_Conf () {
	#echo $Carpeta_Actual
	echo ""
	echo "------------------------------------------------"
	echo "Carpeta:" $Carpeta_Actual
	echo "Archivo:" $Archivo_Actual
	echo "------------------------------------------------"
	echo ""
	echo "------------------------------------------------"
	echo "Directorio actual: "
	pwd
	echo "------------------------------------------------"
	read -p "Pulse a para Menu - b para Salir: " volver
	case $volver in
		"a") Menu_Opcion;;
		"b") Menu_Salir;;
		[a-b]) echo "Ha ingresado un valor fuera del rango";;
		*) echo "Por favor solo caracteres dentro del rango [a-b]"
	esac
}

# Esta funcion temina la ejecucion del programa
Menu_Salir () {
	echo "Saliendo del Script..."
	sleep 2
	clear
}

# Esta funcion ejecuta las opciones del menu inicial
Menu_Opcion () {
clear
Menu_Inicial
read -p "Ingrese la opción deseada: " opcion
case $opcion in
	"1") Menu_Crear_Carpeta;;
	"2") Menu_Crear_Archivo;;
	"3") Menu_Editar_Archivo;;
	"4") Menu_Conf;;
	"5") Menu_Salir;;
	[1-5]) echo "Ha ingresado un valor fuera del rango";;
	*) echo "Por favor solo caracteres dentro del rango [1-5]"
esac
}
Menu_Opcion
