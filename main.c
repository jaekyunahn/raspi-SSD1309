// header include 
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

// 디바이스 드라이버 모듈 적재 시 동작
static int hellomodule_init(void)
{
	printk("hello module\n");
	return 0;
}

// 디바이스 드라이버 모듈 해제 시 동작 
static void hellomodule_exit(void)
{
	printk("goodbye module\n");
}

// module 적재 시 동작 시킬 함수 호출
module_init(hellomodule_init);
// module 해제 시 동작 시킬 함수 호출
module_exit(hellomodule_exit);

// 소스코드 라이선스 명시
MODULE_LICENSE("Daul BSD/GPL");