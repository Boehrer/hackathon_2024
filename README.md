## SETUP

1. Install VS code
2. Install PLatform IO extension within vs code
3. Create new project with platform IO
    1. select espressif esp32 dev module as platform
    2. select arduino as platform
4. download and install CP210X USB to UART Bridg VCP driver from https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=overview
5. test with:
    1. run `Tasks: Run Build Task` -> `PlatformIO: Build`
    2. press and hold the button labeled "boot" on the chip
    2. while holding the boot button, run `PlatformIO: Upload`