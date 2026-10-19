#!/bin/bash
set -e

DEVICE=C71
VENDOR=realme
DEVICE_BLOB_DIR=../../../vendor/$VENDOR/$DEVICE/proprietary/vendor

mkdir -p $DEVICE_BLOB_DIR

DUMP_SRC=${1:-./dump}

if [ -d "$DUMP_SRC" ]; then
    echo "[*] Extracting from local dump: $DUMP_SRC"
    for dir in bin etc firmware lib lib64; do
        if [ -d "$DUMP_SRC/vendor/$dir" ]; then
            echo "[+] Copying $dir"
            mkdir -p "$DEVICE_BLOB_DIR/$dir"
            cp -r "$DUMP_SRC/vendor/$dir/." "$DEVICE_BLOB_DIR/$dir/"
        fi
    done
    if [ -d "$DUMP_SRC/vendor" ]; then
        echo "[+] Copying remaining vendor files"
        cp -r "$DUMP_SRC/vendor/." "$DEVICE_BLOB_DIR/" 2>/dev/null || true
    fi
elif command -v adb &> /dev/null; then
    echo "[*] Extracting via adb (root required)"
    adb root
    adb remount 2>/dev/null || true
    for dir in bin etc firmware lib lib64; do
        if adb shell test -d "/vendor/$dir" 2>/dev/null; then
            echo "[+] Pulling /vendor/$dir"
            mkdir -p "$DEVICE_BLOB_DIR/$dir"
            adb pull "/vendor/$dir/." "$DEVICE_BLOB_DIR/$dir/" 2>/dev/null || echo "[!] Failed to pull /vendor/$dir"
        fi
    done
else
    echo "[!] Usage: $0 /path/to/dump"
    exit 1
fi

echo "[*] Done. Blobs are in $DEVICE_BLOB_DIR"
