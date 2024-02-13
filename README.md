## SETUP

### VS Code, PlatformIO, and Git

1. Install VS code
2. Install Platform IO extension within vs code
3. Install git using these instructions https://code.visualstudio.com/docs/sourcecontrol/intro-to-git
4. Clone this repo locally


### Microcontroller setup
1. download and install CP210X USB to UART Bridge VCP driver from https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=overview
2. open the cloned repository in VS code, the platformIO extension should detect the presence of platformIO.ini and create the directory .pio
3. connect your microcontroller to your computer
4. test that you can upload code to your microcontroller with:
    1. replace `src/main.cpp` with `src/test_main.cpp`
    1. press and hold the button labeled "boot" on the microcontroller
    2. while holding the boot button, run `PlatformIO: Upload` via VS code
    3. run `PlatformIO: Serial Monitor`, "Hello World!" should be printed in a loop