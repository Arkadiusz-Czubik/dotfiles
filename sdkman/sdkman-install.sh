curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 11.0.6-amzn
sdk install maven
sdk install gradle
