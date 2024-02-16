## SETUP

### dev environment

1. Install VS code
2. Install Platform IO extension within vs code
3. Install git using these instructions https://code.visualstudio.com/docs/sourcecontrol/intro-to-git
4. Clone this repo locally


### microcontroller
1. download and install CP210X USB to UART Bridge VCP driver from https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=overview
2. open the cloned repository in VS code, the platformIO extension should detect the presence of platformIO.ini and create the directory .pio
3. connect your microcontroller to your computer
4. test that you can upload code to your microcontroller with:
    1. replace `src/main.cpp` with `src/test_main.cpp`
    1. press and hold the button labeled "boot" on the microcontroller
    2. while holding the boot button, run `PlatformIO: Upload` via VS code
    3. run `PlatformIO: Serial Monitor`, "Hello World!" should be printed in a loop


### mqtt broker
This project uses terraform to create a [mosquitto](https://mosquitto.org/) instance on compute engine instance via google cloud platform.
1. [install terraform](https://developer.hashicorp.com/terraform/install)
2. [create a google cloud platform account](https://console.cloud.google.com/freetrial/) if you don't already have one
3. follow [these instructions](https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#set-up-gcp) to create a gcp project, save the service account key that they mention into the terraform directory with the name `service_account_key.json`
4. while in the `terraform` directory, run:
    ```
    terraform init
    terraform plan
    terraform apply
    ```
