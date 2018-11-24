GHC_VERSION=8.6.2
CABAL_VERSION=2.4

sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install-${CABAL_VERSION} ghc-${GHC_VERSION}

if [ $(cat ~/.bashrc | grep -c "/opt/ghc/bin:\$PATH") -lt 1 ] ; then
cat >> ~/.bashrc <<EOF
export PATH="\$HOME/.cabal/bin:/opt/cabal/bin:/opt/ghc/bin:\$PATH"
EOF
fi
