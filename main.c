// header include 
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

// ����̽� ����̹� ��� ���� �� ����
static int hellomodule_init(void)
{
	printk("hello module\n");
	return 0;
}

// ����̽� ����̹� ��� ���� �� ���� 
static void hellomodule_exit(void)
{
	printk("goodbye module\n");
}

// module ���� �� ���� ��ų �Լ� ȣ��
module_init(hellomodule_init);
// module ���� �� ���� ��ų �Լ� ȣ��
module_exit(hellomodule_exit);

// �ҽ��ڵ� ���̼��� ���
MODULE_LICENSE("Daul BSD/GPL");