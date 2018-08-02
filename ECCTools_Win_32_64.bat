@echo OFF &SETLOCAL 
cls
GOTO :main
:main
	cls
	echo "Welcome to ECC tools for Windows"
	pause
	cls
	GOTO :menu
exit 0

:menu 
	echo PLEASE CHOOSE FROM THE FOLLOWING OPTIONS.
	echo 1. ECC Version Check
	echo.
	echo 2. Clear Current Daemon
	echo.
	echo 3. Clear Banlist and Peers
	echo.
	echo 4. Clear ECC Data Directory (will not remove wallet files)
	echo.
	echo 5. Clear Sapphire Data Directory
	echo.
	echo 6. Exit
	
	CHOICE /C 123456 /N
	if %errorlevel% == 6 exit 0
	if %errorlevel% == 5 GOTO :clear_sapphire
	if %errorlevel% == 4 GOTO :clear_data
	if %errorlevel% == 3 GOTO :clear_ban_peer 
	if %errorlevel% == 2 GOTO :clear_daemon
	if %errorlevel% == 1 GOTO :version_check
	
exit 0
:clear_ban_peer 
	cls
	if exist "%userprofile%\AppData\Roaming\eccoin" (
		echo Do you want to delete the banlist and peers?
		echo Type Y or N and press enter twice.	
		set /p "clearBP="
		if /i "%clearBP%"=="n" GOTO :menu
		if /i "%clearBP%"=="N" GOTO :menu
		if /i "%clearBP%"=="y" GOTO :ban_peer_clear
		if /i "%clearBP%"=="Y" GOTO :ban_peer_clear
		GOTO :clear_ban_peer 
	) else (
		cls
		echo Data directory not detected
		echo.				
	)							
exit 0

:ban_peer_clear
	if exist "%userprofile%\AppData\Roaming\eccoin\banlist.dat" del /s "%userprofile%\AppData\Roaming\eccoin\banlist.dat"
	if exist "%userprofile%\AppData\Roaming\eccoin\peers.dat" del /s "%userprofile%\AppData\Roaming\eccoin\peers.dat"
	pause
	cls
	GOTO :menu
exit 0

:version_check
	cls
	if exist "%userprofile%\.eccoin-wallet\" (
		if exist "%userprofile%\.eccoin-wallet\wallet-version.txt" (
			for /f "tokens=* delims=" %%x in (%userprofile%\.eccoin-wallet\wallet-version.txt) do echo ECC daemon detected - Version %%x 
			echo.
			GOTO :menu
		) else (
			cls
			echo Daemon not detected
			echo.	
			GOTO :menu		
		)
	) else (
		cls
		echo Daemon directory not detected
		echo.
		GOTO :menu				
	)	
GOTO :menu						
exit 0

:clear_daemon
	cls
	if exist "%userprofile%\.eccoin-wallet\" (
		echo Do you want to clear the Daemon directory?
		echo Type Y or N and press enter twice.	
		set /p "clearD="
		if /i "%clearD%"=="n" GOTO :menu
		if /i "%clearD%"=="N" GOTO :menu
		if /i "%clearD%"=="y" GOTO :daemon_clear
		if /i "%clearD%"=="Y" GOTO :daemon_clear
		GOTO :clear_daemon
	) else (
		cls
		echo Daemon directory not detected
		echo.				
	)							
exit 0

:daemon_clear
	del /s "%userprofile%\.eccoin-wallet\*"
	pause
	cls
	GOTO :menu
exit 0


:clear_data
cls
	if exist "%userprofile%\AppData\Roaming\eccoin" (
		echo Do you want to clear the data directory?
		echo Type Y or N and press enter twice.	
		set /p "clearData="
		if /i "%clearData%"=="n" GOTO :menu
		if /i "%clearData%"=="N" GOTO :menu
		if /i "%clearData%"=="y" GOTO :data_clear
		if /i "%clearData%"=="Y" GOTO :data_clear
		GOTO :clear_data 
	) else (
		cls
		echo Data directory not detected
		echo.				
	)							
exit 0

:data_clear
if exist "%userprofile%\AppData\Roaming\eccoin\fee_estimates.dat" del /s "%userprofile%\AppData\Roaming\eccoin\fee_estimates.dat"
if exist "%userprofile%\AppData\Roaming\eccoin\banlist.dat" del /s "%userprofile%\AppData\Roaming\eccoin\banlist.dat"
if exist "%userprofile%\AppData\Roaming\eccoin\peers.dat" del /s "%userprofile%\AppData\Roaming\eccoin\peers.dat"
if exist "%userprofile%\AppData\Roaming\eccoin\.lock" del /s "%userprofile%\AppData\Roaming\eccoin\.lock"
if exist "%userprofile%\AppData\Roaming\eccoin\db.log" del /s "%userprofile%\AppData\Roaming\eccoin\db.log"
if exist "%userprofile%\AppData\Roaming\eccoin\debug.log" del /s "%userprofile%\AppData\Roaming\eccoin\debug.log"
if exist "%userprofile%\AppData\Roaming\eccoin\eccoin.conf" del /s "%userprofile%\AppData\Roaming\eccoin\eccoin.conf"
if exist "%userprofile%\AppData\Roaming\eccoin\blocks" rd /s "%userprofile%\AppData\Roaming\eccoin\blocks"
if exist "%userprofile%\AppData\Roaming\eccoin\chainstate" rd /s "%userprofile%\AppData\Roaming\eccoin\chainstate"
if exist "%userprofile%\AppData\Roaming\eccoin\database" rd /s "%userprofile%\AppData\Roaming\eccoin\database"
if exist "%userprofile%\AppData\Roaming\eccoin\services" rd /s "%userprofile%\AppData\Roaming\eccoin\services"
pause
cls
GOTO :menu
exit 0

:clear_sapphire
	cls
	if exist "%userprofile%\AppData\Roaming\Sapphire" (
		echo Do you want to clear the Sapphire data directory?
		echo Type Y or N and press enter twice.	
		set /p "clearSData="
		if /i "%clearSData%"=="n" GOTO :menu
		if /i "%clearSData%"=="N" GOTO :menu
		if /i "%clearSData%"=="y" GOTO :sapphire_clear
		if /i "%clearSData%"=="Y" GOTO :sapphire_clear
		GOTO :clear_sapphire 
	) else (
		cls
		echo Data directory not detected
		echo.				
	)							
exit 0

:sapphire_clear
	rd /s "%userprofile%\AppData\Roaming\Sapphire"
	pause
	cls
	GOTO :menu
exit 0