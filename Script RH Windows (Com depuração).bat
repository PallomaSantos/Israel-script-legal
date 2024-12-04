@echo off
setlocal enabledelayedexpansion
:: Criar um arquivo de log para depuração
set "log_file=%~dp0script_debug.log"
:: Iniciar o log
echo Iniciando script em %date% %time% > "%log_file%"
:: Definir o diretório de destino
set "base_dir=C:\REDE"
:: Criar o diretório base, se não existir
if not exist "!base_dir!" (
    mkdir "!base_dir!"
    echo Diretório !base_dir! criado >> "%log_file%"
)
:: Lista de usuários
set "users=ALAN GOMES, ANDREA ALVES, BRUNO ANASTACIO, CAMILA OLIVEIRA, CARLOS ALEXANDRE, CAROLINE DIAS, DANIEL RIBEIRO, DARIO DIAS, EDUARDO OLIVEIRA, FABIO SANTIAGO, FELIPE MACHADO, FELIPE KAUE, FLAVIO HENRIQUE, FRANCISCO CAVALCANTE, GABRIEL ROCHA, GABRIEL SOUZA, GABRIEL LOPES, GABRIELY SILVA, GUILHERME MONTEIRO, GUSTAVO FRIAS, HENRIQUE GUSTAVO, ISAAC KAUE, ISABELLY VICTÓRIA, JOAO ASAFE, JONATHAN LIMA, KAUA AKSENOW, LUCAS EDUARDO, LUCAS PIRES, MATHEUS WALLACE, NATALIA PARDINHO, NICOLAS DONEDA, PALLOMA SANTOS, RAISSA CHAGAS, RAPHAELA GUEDES, REBECCA RIBEIRO, RIAM MARQUES, ANDRE ROGERIO, SABRINA ALVES, WALDANIA TEIXEIRA"

:: Inicializar variáveis
set "first_name="
set "last_name="

:: Loop para processar cada nome
for %%a in (%users%) do (
    if "!first_name!"=="" (
        set "first_name=%%a"
    ) else (
        set "last_name=%%a"
        
        :: Criar o nome da pasta
        set "folder_name=!first_name!-!last_name!"
        
        :: Criar a pasta
        echo Criando pasta: !folder_name! >> "%log_file%"
        mkdir "!base_dir!\!folder_name!"
        
        :: Resetar para o próximo par de nomes
        set "first_name="
        set "last_name="
    )
)

:: Listar pastas criadas
echo.
echo Pastas criadas: >> "%log_file%"
dir /b "!base_dir!" >> "%log_file%"

:: Mensagem final
echo Script concluído. Verifique o log em %log_file%
pause