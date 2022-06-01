#크로스 컴파일을 통하여 디바이스 드라이버 빌드 시 
#CROSS_COMPILE=/home/r/external-toolchain/bin/aarch64-linux-gnu-
#obj-m := hellomodule.o
#KDIR := /home/r/linux-3.10
#PWD := $(shell pwd)

#라즈베리파이 운영체제에서 빌드 시 사용
#만약 아래와 같은 에러가 터지면 랒파이에 맞는 커널 헤더를 설치 해줘야 한다.
#/lib/modules/5.10.63-v7l+/build: No such file or directory. Stop.
#-> sudo apt-get install raspberrypi-kernel-headers
KDIR = /lib/modules/$(shell uname -r)/build
# 오브젝트명은 소스코드 파일명과 동일해야 한다.
obj-m := main.o
PWD := $(shell pwd)

default:
	#크로스 컴파일을 통하여 디바이스 드라이버 빌드 시 
	#$(MAKE) ARCH=arm64 -C $(KDIR) M=$(PWD) modules CROSS_COMPILE=${CROSS_COMPILE}
	#라즈베리파이 운영체제에서 빌드 시
	$(MAKE) -C $(KDIR) M=$(PWD) modules

	#빌드가 끝나고 적재 하는 방법은 insmod <소스코드 파일명>.ko
	#라즈베리파이 커널 메시지 확인 -> dmesg
	# lsmod
	# rmmod

clean:
	rm -f *.ko
	rm -f *.o
	rm -f *.mod.*
	rm -f .*.cmd