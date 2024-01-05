set -e
set -x

sudo systemctl stop serial-getty@*

pushd /dev

sudo ln -s ttyTHS1 ttyJ41_EXP_HEADER || true
sudo chmod a+rw ttyS0
sudo ln -s ttyS0   ttyJ50 || true

sudo ln -s ttyJ50  ttyHoverboard || true

#sudo ln -s ttyACM0 ttyHeadMCU
sudo ln -s ttySparkfunProMicro* ttyHeadMCU || true
sudo ln -s ttyGPS* ttyGPS || true


echo "The following files shoud exist and point to something that exists:"
file ttySparkfunProMicro*
file ttyGPS*
file ttyHeadMCU*
file ttyLighting*

popd
