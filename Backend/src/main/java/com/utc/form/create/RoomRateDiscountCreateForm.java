package com.utc.form.create;

import lombok.Data;

import java.util.Date;

@Data
public class RoomRateDiscountCreateForm {

    private double rate;

    private Date startMonth;

    private Date endMonth;

    private int roomTypeId;

}
