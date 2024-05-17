#!/bin/bash
touch usuarios.txt
mkdir usuarios
# pwd

menu() {
    echo "#########################################"
    echo "## Elija la opcion que quiera ejecutar ##"
    echo "#########################################"

    echo ""
    echo "1. Listar Usuarios"
    echo "2. Dar de alta un usuario"
    echo "3. Agregar letra Inicial"
    echo "4. Agregar letra Final"
    echo "5. Agregar letra contenida"
    echo "6. Consultar diccionario"
    echo "7. Ingresar vocal"
    echo "8. Listar las palabras del diccionario que contengan unicamente esa vocal"
    echo "9. Algoritmo (1)"
    echo "10. Algoritmo (2)"
    echo "11. SALIR"
    echo ""
}


iniciarSesion() {
    cd usuarios
    echo "Ingrese nombre de usuario"
    read nombreUsuario
    # $usuario >>usuarios.txt

    echo ""
    echo "Ingrese contraseña"
    read contraUsuario

    TARGET_FILE=./$nombreUsuario.txt

    if [ -f "$TARGET_FILE" ]; then
        userPass=$(cat "$TARGET_FILE")
        if [ "$userPass" = "$contraUsuario" ]; then
            echo ""
            echo "#########################################"
            echo "##             BIENVENIDO!             ##"
            echo "#########################################"
            echo ""

            menu
        else
            echo ""
            echo "#########################################"
            echo "##    NOMBRE O CONTRASEÑA INCORRECTO   ##"
            echo "#########################################"
            echo ""
        fi
    else
        echo ""
        echo "#########################################"
        echo "##    NOMBRE O CONTRASEÑA INCORRECTO   ##"
        echo "#########################################"
        echo ""
    fi
    cd ..

}


registroUsuario(){
    echo "#########################################"
    echo "##  BIENVENIDO  AL SISTEMA, POR FAVOR  ##"
    echo "##     INGRESE LOS DATOS REQUERIDOS    ##"
    echo "#########################################"
    echo ""
    echo "Ingrese el nombre de usuario: "
    echo ""
    read nombreUsuario
    echo ""
    echo "Ingrese la contraseña"
    echo ""
    read contraUsuario

    cd usuarios
    # pwd
    
    touch $nombreUsuario.txt

    echo $contraUsuario >> $nombreUsuario.txt 

    cd ..

    echo $nombreUsuario >> usuarios.txt
    echo ""
    echo "#########################################"
    echo "##     USUARIO REGISTRADO CON EXITO    ##"
    echo "#########################################"
    echo ""

    menu
}

# registroUsuario

menuUsuario(){
    echo "#########################################"
    echo "##  BIENVENIDO  AL SISTEMA, POR FAVOR  ##"
    echo "##     INICIE SESION O REGISTRESE      ##"
    echo "#########################################"

    echo ""
    echo "1. Iniciar sesion."
    echo "2. Registrarse."

    read opcionInicio

    if [ $opcionInicio -eq 1 ]; then
        iniciarSesion
    else
        registroUsuario
    fi
}

menuUsuario

# iniciarSesion

read opcion

while [ $opcion -ne 11 ]; do 
    if [ $opcion -eq 1 ]; then 
        echo ""
        echo "La lista de usuarios es: "
        cat usuarios.txt
        echo ""
        echo ""
    elif [ $opcion -eq 2 ]; then
        touch temp.txt

        echo ""
        echo "Elija una cuenta para dar de alta de la proxima lista:"
        cat usuarios.txt
        echo ""

        echo "Ingrese nombre de la cuenta que desea dar de alta"
        read nombreCuenta

        
        cd usuarios 
        userFile=./$nombreCuenta.txt

        if [ -f "$userFile" ]; then
            rm $nombreCuenta.txt
            cd ..
            sed "/$nombreCuenta/d" usuarios.txt > temp.txt
            mv temp.txt usuarios.txt
            echo ""
            echo "#########################################"
            echo "##        CUENTA DADA DE ALTA          ##"
            echo "#########################################"
            echo ""
        else
            echo ""
            echo "#########################################"
            echo "##        ESTA CUENTA NO EXISTE        ##"
            echo "#########################################"
            echo ""
        fi

        


    elif [ $opcion -eq 3 ]; then 
        echo ""

        echo "Ingrese letra inicial"
        read letraInicial
    elif [ $opcion -eq 4 ]; then 
        echo ""

        echo "Ingrese letra final"
        read letraFinal
    elif [ $opcion -eq 5 ]; then 
        echo ""

        echo "Ingrese letra contenida"
        read letraCont
    elif [ $opcion -eq 6 ]; then 
        cat diccionario.txt | grep $letraCont | grep ^$letraInicial | grep $letraFinal$ 
        touch palabras.txt
        cat diccionario.txt | grep $letraCont | grep ^$letraInicial | grep $letraFinal$ > palabras.txt
        echo "La cantidad de palabras que cumplen las condiciones es:" >> palabras.txt
        cat palabras.txt | grep -c "." >> palabras.txt
        palTotales=$( tail -n 1 palabras.txt )
        echo "La cantidad de palabras totales es:" >> palabras.txt
        cat diccionario.txt | grep -c "." >> palabras.txt
        palDiccionario=$( tail -n 1 palabras.txt )
        percent=$((palTotales*100/palDiccionario))
        echo "El porcentaje de palabras filtradas es: $percent" >> palabras.txt
        date >> palabras.txt

    elif [ $opcion -eq 7 ]; then 
        echo ""

        vocales=aeiou
        echo "Ingrese una vocal"
        read vocal
        if [[ $vocales != *$vocal* || ${#vocal} != 1 ]]; then 
            echo "Ingrese una vocal valida"
            read vocal
        fi
        numVocal=0
        while [ ${vocales:numVocal:1} != $vocal ]; do
            numVocal+=1
        done 
    elif [ $opcion -eq 8 ]; then 
        echo ""

        cat diccionario.txt | grep -v ${vocales:(numVocal+1)%5:1} | grep -v ${vocales:(numVocal+2)%5:1} | grep -v ${vocales:(numVocales+3)%5:1} | grep -v ${vocales:(numVocales+4)%5:1} | grep $vocal
    elif [ $opcion -eq 9 ]; then 
        echo ""

        echo "Ingrese cantidad de datos"
        read cant
        cantProm=$cant
        max=0
        min=0
        while [ $cant -ne 0 ]; do 
            echo "Ingrese dato"
            read dato
            suma=$((suma+dato))
            if [[ $cant -eq $cantProm || $dato > max ]]; then 
                max=$dato
            fi
            if [[ $cant -eq $cantProm || $dato < min ]]; then 
                min=$dato
            fi
            cant=$((cant-1))
        done 
        prom=$((suma/cantProm))
        echo "El promedio es $prom"
        echo "El menor valor es $max"
        echo "El mayor valor es $min"
    elif [ $opcion -eq 10 ]; then
        echo ""

        echo "Ingrese una palabra"
        read palabra
        capicua=false
        largo=${#palabra}
        #Invertimos la palabra y la guardamos en otra variable
        for((i=largo-1;i>=0;i--)); do
            invertida=$invertida${palabra:$i:1}
        done
        #Verificamos si la palabra es capicua
        if [ "$palabra" = "$invertida" ]; then
            capicua=true
        fi
        #Imprimimos el resultado
        if [ $capicua = true ]; then
            echo "La palabra es capicua"
        else 
            echo "La palabra NO es capicua"
        fi
    fi 
    suma=0
    menu
    read opcion
done 

if [ $opcion = 11 ]; then
    echo ""
    echo "#############################"
    echo "### GRACIAS POR ELEGIRNOS ###"
    echo "###    VUELVA PRONTO :)   ###"
    echo "#############################"
