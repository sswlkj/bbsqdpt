package cc.mrbird.job.task;

import cc.mrbird.common.annotation.CronTag;

@CronTag("testTask")
public class TestTask {

    public void test(String params) {
        System.out.println("我是带参数的test方法，正在被执行，参数为：" + params);
    }

    public void test1() {
        System.out.println("我是不带参数的test1方法，正在被执行");
    }

    public void test2(int num, String str, Object obj, TestTask task) {
        System.out.println("四个参数方法，正在被执行");
    }

}
