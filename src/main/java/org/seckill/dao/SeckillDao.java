package org.seckill.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.seckill.entity.Seckill;


public interface SeckillDao {

    /**
     * reduce storage quantity
     *
     * @param seckillId
     * @param killTime
     * @return updated row count
     */
    int reduceNumber(@Param("seckillId") long seckillId, @Param("killTime") Date killTime);

    /**
     * find seckill record using id
     *
     * @param seckillId
     * @return
     */
    Seckill queryById(long seckillId);

    /**
     * get a list of seckill records based on offset and limit
     *
     * @param offset
     * @param limit
     * @return
     */
    List<Seckill> queryAll(@Param("offset") int offset, @Param("limit") int limit);

    /**
     * using stored mysql procedure to execute seckill
     *
     * @param paramMap
     */
    void killByProcedure(Map<String, Object> paramMap);

}