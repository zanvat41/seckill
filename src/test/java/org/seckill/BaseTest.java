package org.seckill;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Configure the integration of Spring and JUnit so that JUnit loads the Spring IOC container when it starts (using spring - test and JUnit).
 */
@RunWith(SpringJUnit4ClassRunner.class)
// provide junit spring configuration files
@ContextConfiguration({ "classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml" })
public class BaseTest {

}