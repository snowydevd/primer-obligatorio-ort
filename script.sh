#!/bin/bash
mkdir usuarios -p
cd usuarios
echo admin admin > admin.txt

menu(){
    echo "#########################################"
    echo "## Elija la opcion que quiera ejecutar ##"
    echo "#########################################"

    echo ""
    echo "1. Listar Usuarios"
    echo "2. Dar de alta un usuario"
    echo "3. Agregar letra Inicial"
    echo "4. Agregar letra Final"
    echo "5. Agregar letra contenida"
    echo "6. Agregar Consultar diccionario"
    echo "7. Ingresar vocal"
    echo "8. Listar las palabras del diccionario que contengan unicamente esa vocal"
    echo "9. Algoritmo (1)"
    echo "10. Algoritmo (2)"
    echo "11. SALIR"

    read opcion
}


# FUNCION DE INICIO DE SESION
iniciarSesion(){
    echo "Ingrese nombre de usuario"
    read userSes

    echo ""
    echo "Ingrese contraseña"
    read passSes


}

iniciarRegistro(){
    echo "Ingrese nombre de usuario"
    read userReg

    echo ""
    echo "Ingrese contraseña"
    read passReg 

    echo $userReg > $userReg.txt 
    echo $passReg >> $userReg.txt 
}

menuInicio(){
    echo "Desea registrarse o iniciar sesion?"
    echo ""
    echo "(1). Iniciar Sesion"
    echo "(2). Registrarse"
    echo "(3). SALIR"

    read opcionRegister

    if [ $opcionRegister = 1 ]; then
        iniciarSesion
        menu
    elif [ $opcionRegister = 2 ]; then
        iniciarRegistro
        menu
    elif [ $opcionRegister = 3 ]; then
          echo ""
    echo "#############################"
    echo "### GRACIAS POR ELEGIRNOS ###"
    echo "###    VUELVA PRONTO :)   ###"
    echo "#############################"
    fi
}

menuInicio

if [ $opcion = 11 ]; then
    echo ""
    echo "#############################"
    echo "### GRACIAS POR ELEGIRNOS ###"
    echo "###    VUELVA PRONTO :)   ###"
    echo "#############################"
fi

while [ $opcion -ne 11 ]; do
    menu
done

if [ $opcion = 1 ]; then
    echo "La lista de usuarios es la siguiente"
    echo ""


    # TERMINAR LA OPCION 1
    
    cat 
fi

