# sudo apt-add-repository ppa:fish-shell/release-3
# sudo apt update
# sudo apt install fish

# dnf install fish

# bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

sysr() {
    systemctl restart $1
}

syss() {
    systemctl status $1
}

syse() {
    systemctl enable $1
}

