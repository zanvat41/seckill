package org.seckill.dao;

import javax.annotation.Resource;

import org.junit.Test;
import org.seckill.BaseTest;
import org.seckill.entity.Seckill;


import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class SeckillDaoTest extends BaseTest {

    @Resource
    private SeckillDao seckillDao;

    @Test
    public void testQueryById() {
        long id = 1000;
        Seckill seckill = seckillDao.queryById(id);
        System.out.println(seckill.getName());
        System.out.println(seckill);
    }

    @Test
    public void testQueryAll() {
        List<Seckill> seckills = seckillDao.queryAll(0, 100);
        for (Seckill seckill : seckills) {
            System.out.println(seckill);
        }
    }

    @Test
    public void testReduceNumber() {
        Date killTime = new Date();
        int updateCount = seckillDao.reduceNumber(1000L, killTime);
        System.out.println("updateCount=" + updateCount);
        assertEquals(0, updateCount);
    }
}