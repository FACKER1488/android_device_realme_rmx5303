# android_device_realme_rmx5303


# device_realme_rmx5303

Public Device Tree for **Realme C71 (RMX5303)**  
Chipset: **Unisoc UMS9230 (T7250)**  
Architecture: **Virtual A/B**  
Vendor: **Android 13 (API 33)**  
System: **Android 15 / 16 GSI (API 35 / 36)**

## ⚠️ WARNING — READ BEFORE BUILDING

This repository contains **source code only**. It is **not** a prebuilt recovery image.

Building and flashing custom images on Unisoc/Spreadtrum devices can **permanently hard-brick** your phone. Recovery from a hard brick requires EDL mode and a PAC firmware programmer (ResearchDownload / Upgrade Tool). The author is not responsible for any damage, data loss, or bricked devices.

**Do not proceed unless you:**
- Have a working `vendor_boot_stock.img` backup extracted from your own device.
- Know how to enter EDL and flash a full PAC to unbrick.
- Understand that `fastboot boot` is **removed** from the Realme/Unisoc bootloader on this device.

---

## Device Specifics

| Item | Value |
|------|-------|
| Model | Realme C71 (RMX5303) |
| Board | ums9230_dhaka |
| SoC | Unisoc UMS9230 / T7250 |
| GPU | Mali-G57 |
| Partitions | Virtual A/B dynamic super |
| Recovery location | Inside `vendor_boot` (no standalone recovery partition) |
| Vendor API level | 33 (Android 13) |
| System API level | 35 / 36 (Android 15 / 16 GSI) |
| Bootloader | Unlocked (`unlocked: yes`) |
| `fastboot boot` | Disabled by manufacturer |

## Repository Structure
