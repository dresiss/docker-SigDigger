FROM debian:latest
LABEL maintainer=Andrés Pérez <andres.perez.ea1iff@gmail.com>
RUN apt update && apt install -y libsndfile1-dev libfftw3-dev libsoapysdr-dev libxml2-dev libvolk1-dev qt5-default g++ git cmake
RUN git clone https://github.com/BatchDrake/sigutils.git && git clone https://github.com/BatchDrake/suscan.git && git clone https://github.com/BatchDrake/SuWidgets && git clone https://github.com/BatchDrake/SigDigger
RUN cd sigutils && mkdir build && cd build && cmake .. && make && make install && ldconfig
RUN cd suscan && mkdir build && cd build && cmake .. && make && make install && ldconfig
RUN cd SuWidgets && qmake SuWidgetsLib.pro && make && make install
RUN cd SigDigger && qmake SigDigger.pro && make && make install && ldconfig
