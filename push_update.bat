@echo off
:: Premium Cosmic Batch Updater
title AR-Project Git Auto-Push
echo ===================================================
echo             AR-PROJECT AUTOMATIC UPDATER          
echo ===================================================
echo.

:: Memeriksa status Git lokal
git status >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git belum diinisialisasi di folder ini atau Git tidak terinstal!
    pause
    exit /b
)

echo Menyiapkan semua perubahan (git add)...
git add .
echo.

:: Meminta masukan pesan commit dari pengguna
set /p commit_msg="Masukkan pesan update (kosongkan untuk default 'Update WebAR Project'): "

if "%commit_msg%"=="" (
    set commit_msg=Update WebAR Project
)

echo.
echo Melakukan commit dengan pesan: "%commit_msg%"
git commit -m "%commit_msg%"
if %errorlevel% neq 0 (
    echo.
    echo [INFO] Tidak ada perubahan baru yang terdeteksi untuk dikirim.
    pause
    exit /b
)

echo.
echo Mengirimkan update ke GitHub (branch: main)...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ===================================================
    echo      [SUCCESS] Update Berhasil Dikirim ke GitHub!   
    echo ===================================================
) else (
    echo.
    echo ===================================================
    echo      [ERROR] Gagal mengirim update ke GitHub.       
    echo      Pastikan koneksi internet Anda aktif.               
    echo ===================================================
)

echo.
pause
