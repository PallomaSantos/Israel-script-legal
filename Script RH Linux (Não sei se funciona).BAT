#!/bin/bash

# Arquivo de log
log_file="script.log"

# Iniciar o log
echo "Iniciando script em $(date)" > "$log_file"

# Diretório base
base_dir="$HOME/REDE"

# Criar o diretório base, se não existir
if [ ! -d "$base_dir" ]; then
    mkdir -p "$base_dir"
    echo "Diretório $base_dir criado" >> "$log_file"
fi

# Lista de usuários (use aspas para lidar com espaços nos nomes)
users="ALAN GOMES, ANDREA ALVES, BRUNO ANASTÁCIO, CAMILA OLIVEIRA, CARLOS ALEXANDRE, CAROLINE DIAS, DANIEL RIBEIR, DARIO DIAS, EDUARDO OLIVEIRA, FABIO SANTIAGO, FELIPE MACHADO, FELIPE KAUE, FLÁVIO HENRIQUE, FRANCISCO CAVALCANTE, GABRIEL ROCHA, GABRIEL SOUZA, GABRIEL LOPES, GABRIELY SILVA, GUILHERME MONTEIRO, GUSTAVO FRIAS, HENRIQUE GUSTAVO, ISAAC KAUE, ISABELLY VICTÓRIA, JOÃO ASAFE, JONATHAN LIMA, KAUÃ AKSENOW, LUCAS EDUARDO, LUCAS PIRES, MATHEUS WALLACE, NATALIA PARDINHO, NICOLAS DONEDA, PALLOMA SANTOS, RAISSA CHAGAS, RAPHAELA GUEDES, REBECCA RIBEIRO, RIAM MARQUES, ANDRE ROGERIO, SABRINA ALVES, WALDANIA TEIXEIRA"

# Separar os nomes e criar as pastas
IFS=', ' read -ra name_array <<< "$users"
for ((i = 0; i < ${#name_array[@]}; i+=2)); do
    first_name="${name_array[i]}"
    last_name="${name_array[i+1]}"
    
    # Nome da pasta
    folder_name="${first_name}-${last_name}"
    
    # Criar a pasta
    echo "Criando pasta: $folder_name" >> "$log_file"
    mkdir -p "$base_dir/$folder_name"
done

# Listar pastas criadas
echo -e "\nPastas criadas:" >> "$log_file"
ls "$base_dir" >> "$log_file"

# Mensagem final
echo "Script concluído. Verifique o log em $log_file"
