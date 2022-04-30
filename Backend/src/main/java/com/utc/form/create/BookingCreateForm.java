package com.utc.form.create;

import com.utc.entity.UserServices;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class BookingCreateForm {

    private Date checkIn;

    private Date checkOut;

    private String paymentType;

    private String status;

    private List<String> hotelServiceNames;



}
