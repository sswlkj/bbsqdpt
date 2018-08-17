package cc.mrbird.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("test")
public class TestController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("common/t1")
    public void t1() {
    }

    @RequestMapping("common/t2")
    public void t2() {
    }

    @RequestMapping("t3")
    public void t3() {
    }

    @RequestMapping("/t4/{type}")
    @ResponseBody
    public String t4(@PathVariable String type) {

        logger.info("type is %s",type);
        return type;
    }
    @GetMapping("/t5/{type}/d1")
    @ResponseBody
    public String t5(@PathVariable String type) {

        logger.info("type is %s",type);
        return type;
    }
}
