#!/bin/bash

echo -e "\e[35m
░██████╗░███████╗███╗░░██╗  
██╔════╝░██╔════╝████╗░██║  
██║░░██╗░█████╗░░██╔██╗██║  
██║░░╚██╗██╔══╝░░██║╚████║  
╚██████╔╝███████╗██║░╚███║  
░╚═════╝░╚══════╝╚═╝░░╚══╝  

██████╗░░█████╗░░██████╗░██████╗
██╔══██╗██╔══██╗██╔════╝██╔════╝
██████╔╝███████║╚█████╗░╚█████╗░
██╔═══╝░██╔══██║░╚═══██╗░╚═══██╗
██║░░░░░██║░░██║██████╔╝██████╔╝
╚═╝░░░░░╚═╝░░╚═╝╚═════╝░╚═════╝░\e[0m"

echo -e "\e[1;34mGENERADOR DE CONTRASEÑAS\e[0m"

# Función para generar una contraseña segura
generate_password() {
    local length=$1
    local characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+~"
    echo $(head -c $length /dev/urandom | tr -dc "$characters")
}

# Función para generar nombres latinos
generate_latin_name() {
    local first_names=("Alejandro" "Sofía" "Mateo" "Lucía" "Diego" "Camila" "Andrés" "Isabella" "Pablo" "Valentina")
    local last_names=("Rodríguez" "Gómez" "Fernández" "López" "Martínez" "Sánchez" "Díaz" "Moreno" "Ramírez" "Gutiérrez")
    echo "${first_names[$RANDOM % ${#first_names[@]}]} ${last_names[$RANDOM % ${#last_names[@]}]}"
}

# Pedir al usuario la cantidad de contraseñas a generar
read -p "¿Cuántas contraseñas desea generar? " num_passwords

# Generar y guardar las contraseñas
for i in $(seq 1 $num_passwords); do
    password=$(generate_password 16)
    name=$(generate_latin_name)
    echo "Nombre: $name - Contraseña: $password" >> /sdcard/contraseñas_seguras.txt
done

echo "Las contraseñas se han guardado en /sdcard/contraseñas_seguras.txt"