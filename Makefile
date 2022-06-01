#ũ�ν� �������� ���Ͽ� ����̽� ����̹� ���� �� 
#CROSS_COMPILE=/home/r/external-toolchain/bin/aarch64-linux-gnu-
#obj-m := hellomodule.o
#KDIR := /home/r/linux-3.10
#PWD := $(shell pwd)

#��������� �ü������ ���� �� ���
#���� �Ʒ��� ���� ������ ������ �����̿� �´� Ŀ�� ����� ��ġ ����� �Ѵ�.
#/lib/modules/5.10.63-v7l+/build: No such file or directory. Stop.
#-> sudo apt-get install raspberrypi-kernel-headers
KDIR = /lib/modules/$(shell uname -r)/build
# ������Ʈ���� �ҽ��ڵ� ���ϸ�� �����ؾ� �Ѵ�.
obj-m := main.o
PWD := $(shell pwd)

default:
	#ũ�ν� �������� ���Ͽ� ����̽� ����̹� ���� �� 
	#$(MAKE) ARCH=arm64 -C $(KDIR) M=$(PWD) modules CROSS_COMPILE=${CROSS_COMPILE}
	#��������� �ü������ ���� ��
	$(MAKE) -C $(KDIR) M=$(PWD) modules

	#���尡 ������ ���� �ϴ� ����� insmod <�ҽ��ڵ� ���ϸ�>.ko
	#��������� Ŀ�� �޽��� Ȯ�� -> dmesg
	# lsmod
	# rmmod

clean:
	rm -f *.ko
	rm -f *.o
	rm -f *.mod.*
	rm -f .*.cmd