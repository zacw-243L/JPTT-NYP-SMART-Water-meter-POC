@echo off
:: Check for Administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Suppress default header and set a custom title
title Admin SSH Session to Kerlink Wirenet iFemtoCell-Evolution 923 LoRaWAN Gateway

:: Define gateway IP address
set GATEWAY_IP=192.168.50.87

:: Ping the gateway to check if it's reachable
echo Checking connectivity to the gateway at %GATEWAY_IP%...
ping -n 1 %GATEWAY_IP% >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Gateway %GATEWAY_IP% is not reachable on the local network.
    echo Please ensure the gateway is powered on and connected to the same network.
    pause
    exit /b
)

:: Inform the user about the connection attempt
echo Connected to Kerlink Wirenet iFemtoCell-Evolution 923 LoRaWAN Gateway.

:: Execute the SSH command
ssh admin@%GATEWAY_IP%

:: Keep the window open for additional commands
cmd
