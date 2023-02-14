set -e
set -x

sudo systemctl stop serial-getty@*

pushd /dev

sudo ln -s ttyTHS1 ttyJ41_EXP_HEADER || true
sudo ln -s ttyS0   ttyJ50 || true

sudo ln -s ttyJ50  ttyHoverboard || true

#sudo ln -s ttyACM0 ttyHeadMCU
sudo ln -s ttySparkfunProMicro* ttyHeadMCU || true
sudo ln -s ttyGPS* ttyGPS || true

popd
