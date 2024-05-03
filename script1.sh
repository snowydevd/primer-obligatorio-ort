#!/bin/bash
touch usuarios.txt
iniciarSesion(){
    echo "Ingrese nombre de usuario"
    read usuario 
    $usuario >> usuarios.txt
    
    echo ""
    echo "Ingrese contraseña"
    read pass


}

iniciarSesion


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
    echo "6. Consultar diccionario"
    echo "7. Ingresar vocal"
    echo "8. Listar las palabras del diccionario que contengan unicamente esa vocal"
    echo "9. Algoritmo (1)"
    echo "10. Algoritmo (2)"
    echo "11. SALIR"
}

menu
read opcion

while [ $opcion -ne 11 ]; do 
    if [ $opcion -eq 1 ]; then 
        echo "La lista de usuarios es: "
        cat usuarios.txt
        echo ""
        echo ""
    elif [ $opcion -eq 3 ]; then 
        echo "Ingrese letra inicial"
        read letraInicial
    elif [ $opcion -eq 4 ]; then 
        echo "Ingrese letra final"
        read letraFinal
    elif [ $opcion -eq 5 ]; then 
        echo "Ingrese letra contenida"
        read letraCont
    elif [ $opcion -eq 6 ]; then 
        cat diccionario.txt | grep $letraCont | grep ^$letraInicial | grep $letraFinal$ 
        touch palabras.txt
        cat diccionario.txt | grep $letraCont | grep ^$letraInicial | grep $letraFinal$ > palabras.txt
        cat palabras.txt | grep -c "." >> palabras.txt
        cat diccionario.txt | grep -c "." >> palabras.txt
        echo "$date" >> palabras.txt

    elif [ $opcion -eq 7 ]; then 
        echo "Ingrese una vocal"
        read vocal
        vocales=aeiou
        numVocal=0
        while [ ${vocales:numVocal:1} != $vocal ]; do 
            numVocal+=1
        done 
    elif [ $opcion -eq 8 ]; then 
        cat diccionario.txt | grep -v ${vocales:(numVocal+1)%5:1} | grep -v ${vocales:(numVocal+2)%5:1} | grep -v ${vocales:(numVocales+3)%5:1} | grep -v ${vocales:(numVocales+4)%5:1} | grep $vocal
    elif [ $opcion -eq 9 ]; then 
        echo "Ingrese cantidad de datos"
        read cant
        cantProm=$cant
        while [ $cant -ne 0 ]; do 
            max=0
            min=0
            echo "Ingrese dato"
            read dato
            suma=$((suma+dato))
            cant=$((cant-1))
            if [[ $cant=$cantProm || $dato > max ]]; then 
                max=$dato
            elif [[ $cant=$cantProm || $dato < min ]]; then 
                min=$dato
            fi
        done 
        prom=$((suma/cantProm))
        echo "El promedio es $prom"
        echo "El mayor valor es $max"
        echo "El menor valor es $min"
    fi 
    suma=0
    menu
    read opcion
done 
if [ $opcion -eq 11 ]; then 
    echo ""
    echo "#############################"
    echo "### GRACIAS POR ELEGIRNOS ###"
    echo "###    VUELVA PRONTO :)   ###"
    echo "#############################"
fi

algoritmo2(){
    echo "Ingrese palabra"

}