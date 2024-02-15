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

### ESPHome https://esphome.io
1. Install ESPhome https://esphome.io/guides/getting_started_command_line.html
    - `pip install wheel esphome`
2. Create a project
    - `esphome wizard hackathon.yaml`
3. Edit the project and add a switch, for example.
    - https://esphome.io/components/switch/gpio
```
# Example configuration entry
output:
  - platform: gpio
    pin: GPIO23
    id: led

interval:
  - interval: 1000ms
    then:
      - output.turn_on: led
      - delay: 500ms
      - output.turn_off: led
```
4. Compile and upload the project to the microcontroller
    - https://esphome.io/guides/getting_started_command_line.html#first-uploading
    - `esphome run hackathon.yaml`

### Home Assistant https://www.home-assistant.io/
### Mosquitto mqtt broker https://mosquitto.org/