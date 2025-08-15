setup-cider:
    #!/usr/bin/bash
    set -euo pipefail
    source /usr/lib/ujust/ujust.sh
    OPTION=$(ugum choose "Install Cider" "Uninstall Cider")
    purchase_cider=$(Urllink "https://taproom.cider.sh/about" "click here")
    subscribe_to_am=$(Urllink "https://music.apple.com/us/subscribe" "Apple Music website")
    if [ "$OPTION" == "Install Cider" ] || [ "${OPTION,,}" == "install" ]; then
      echo "${bold}${yellow}Notice: Cider is a paid non-free client for Apple Music. The app requires an Apple Music subscription and a valid Cider license.${normal}"
      echo "${bold}${yellow}If you do not have a subscription, start yours on the ${subscribe_to_am}${bold}${yellow}.${normal}"
      echo "${bold}${yellow}To purchase Cider, ${purchase_cider}${bold}${yellow} to go to Taproom then click Sign In, and choose your purchase method.${normal}"
      read -p "${bold}Press enter to continue, or Ctrl+C to abort installation.${normal}"
      echo "${bold}Installing Cider${normal}"
      sudo wget -qO /etc/pki/rpm-gpg/RPM-GPG-KEY-cidercollective https://repo.cider.sh/RPM-GPG-KEY
      sudo bash -c 'echo "[cidercollective]" > /etc/yum.repos.d/cider.repo'
      sudo bash -c 'echo "name=Cider Collective Repository" >> /etc/yum.repos.d/cider.repo'
      sudo bash -c 'echo "baseurl=https://repo.cider.sh/rpm/RPMS" >> /etc/yum.repos.d/cider.repo'
      sudo bash -c 'echo "enabled=1" >> /etc/yum.repos.d/cider.repo'
      sudo bash -c 'echo "gpgcheck=1" >> /etc/yum.repos.d/cider.repo'
      sudo bash -c 'echo "gpgkey=https://repo.cider.sh/RPM-GPG-KEY" >> /etc/yum.repos.d/cider.repo'
      rpm-ostree install cider
      echo "{bold}Cider client installed. Please reboot system to continue Cider setup.${normal}"
    elif [ "$OPTION" == "Uninstall Cider" ] || [ "${OPTION,,}" == "uninstall" ]; then
      echo "${bold}Uninstalling Cider${normal}"
      sudo rm /etc/yum.repos.d/cider.repo
      sudo rm /etc/pki/rpm-gpg/RPM-GPG-KEY-cidercollective
      rpm-ostree remove cider
      echo "{bold}Cider client uninstalled. Please reboot system for the changes to take effect.${normal}"
    fi
