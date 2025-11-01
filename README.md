## Initial Setup

1. Clone this repository: `git clone https://github.com/simonschwaiger/mobile-robotics-sensorbox.git --recursive`
2. Set your platform (x86_64 or arm64) in `Dockerfile.remote`
3. Set your lidar's ip address in `src/livox_ros_driver2/config/MID360_config.json`. The ip will be 192.168.1.1XX, where XX is the last two digits of the lidar's serial number (found on the qr code on the lidar's side).
4. Build the Docker image: `docker compose build`

## Running the setup

1. Disable firewall (required for the lidar): `sudo ufw disable`
2. Set your PC to a static IP address of `192.168.1.5`. If you choose a different address, update `src/livox_ros_driver2/config/MID360_config.json` accordingly and rebuild the Docker image.
3. You can check whether or not your PC recieves the lidar's udp packets with `sudo tcpdump -i enp4s0 udp portrange 56000-56500 -n`. With the lidar connected and powered on, you should see packets being received.
4. Start the Docker containers: `docker compose up`