@echo off
setlocal

REM Verifica a versão do PHP
for /f "tokens=2 delims=[]" %%i in ('php -r "echo phpversion();"') do set PHP_VERSION=%%i

REM Compara a versão do PHP
for /f "tokens=1,2 delims=." %%a in ("%PHP_VERSION%") do (
    if %%a LSS 8 (
        echo PHP 8.2 or later is required. Please install PHP 8.2 or later and try again.
		pause        
		exit 1
    ) else if %%a EQU 8 if %%b LSS 2 (
        echo PHP 8.2 or later is required. Please install PHP 8.2 or later and try again.
        pause
		exit 1
    )
)

php ./cms.phar install

pause
endlocal


