package org.seckill.enums;

public enum SeckillStateEnum {
    SUCCESS(1, "Success Killed"), END(0, "Kill Closed"), REPEAT_KILL(-1, "Repeated Killed"), INNER_ERROR(-2, "System Error"), DATA_REWRITE(-3, "Data Rewrite");

    private final int state;

    private final String stateInfo;

    private SeckillStateEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public int getState() {
        return state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public static SeckillStateEnum stateOf(int index) {
        for (SeckillStateEnum state : values()) {
            if (state.getState() == index) {
                return state;
            }
        }
        return null;
    }
}
