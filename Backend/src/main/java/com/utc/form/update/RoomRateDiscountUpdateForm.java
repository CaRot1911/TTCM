package com.utc.form.update;

import lombok.Data;

import java.util.Date;

@Data
public class RoomRateDiscountUpdateForm {

    private double rate;

    private Date startMonth;

    private Date endMonth;
}
