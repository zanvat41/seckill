package org.seckill.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.BaseTest;
import org.seckill.entity.SuccessKilled;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

public class SuccessKilledDaoTest extends BaseTest {

    @Resource
    private SuccessKilledDao successKilledDao;

    @Test
    public void testInsertSuccessKilled() {
        long id = 1000;
        long phone = 13631231234L;
        int insertCount = successKilledDao.insertSuccessKilled(id, phone);
        System.out.println("insertCount=" + insertCount);
    }

    @Test
    public void testQueryByIdWithSeckill() {
        long id = 1000;
        long phone = 13631231234L;
        SuccessKilled successKilled = successKilledDao.queryByIdWithSeckill(id, phone);
        System.out.println(successKilled);
        System.out.println(successKilled.getSeckill());
    }
}