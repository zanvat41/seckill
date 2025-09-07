package org.seckill.dao;

import org.apache.ibatis.annotations.Param;
import org.seckill.entity.Seckill;
import org.seckill.entity.SuccessKilled;

public interface SuccessKilledDao {

    /**
     * insert SuccessKilled record, ignore repeated kill
     *
     * @param seckillId
     * @param userPhone
     * @return inserted row count
     */
    int insertSuccessKilled(@Param("seckillId") long seckillId, @Param("userPhone") long userPhone);

    /**
     * find SuccessKilled record using seckill id nad user phone
     *
     * @param seckillId
     * @param userPhone
     * @return
     */
    SuccessKilled queryByIdWithSeckill(@Param("seckillId") long seckillId, @Param("userPhone") long userPhone);
}