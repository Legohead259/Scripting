#! /bin/bash

# Update the internal packages and upgrade to latest versions
sudo apt update && apt upgrade -y

# Install SSH capability
sudo apt install openssh-server -y

# Install and configure git
sudo apt install git -y
git config --global user.name Legohead259
git config --global user.email legohead259@gmail.com

# Install ROS2 (https://docs.ros.org/en/iron/Installation/Ubuntu-Install-Debians.html)
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt install ros-dev-tools -y
sudo apt install ros-iron-desktop -y

# Setup ROS2 to be CLI accessible
source /opt/ros/iron/setup.bash

# Ensure all future terminals can access the `ros2` CLI
echo "source /opt/ros/iron/setup.bash" >> ~/.bashrc

# Get Python
sudo apt-install python3 -y
sudo apt install python3-pip -y

# Get VS Code (https://code.visualstudio.com/docs/setup/linux)
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

# VS Code Extensions
code --install-extension ms-python.python                       # Python/Pylance
code --install-extension njpwerner.autodocstring                # AutoDocstring
code --install-extension ms-vscode.cpptools                     # C++ Tools
code --install-extension ms-vscode.cmake-tools                  # CMake Tools
code --install-extension streetsidesoftware.code-spell-checker  # Code Spell Checker

# Restart system
# sudo reboot
