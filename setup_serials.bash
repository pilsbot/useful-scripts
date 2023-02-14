set -e
set -x

sudo systemctl stop serial-getty@*

pushd /dev

sudo ln -s ttyTHS1 ttyJ41_EXP_HEADER
sudo ln -s ttyS0   ttyJ50

sudo ln -s ttyJ50  ttyHoverboard
sudo ln -s ttyACM0 ttyHeadMCU

sudo ln -s ttyACM1 ttyGPS

popd
