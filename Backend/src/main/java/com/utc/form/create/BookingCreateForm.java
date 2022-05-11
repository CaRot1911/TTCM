package com.utc.form.create;

import com.utc.entity.UserServices;
import lombok.Data;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.Date;
import java.util.List;

@Data
public class BookingCreateForm {

    @NotBlank(message = "Can't be left empty")
    @Future(message = "The date is not in the future")
    private Date checkIn;

    @NotBlank(message = "Can't be left empty")
    @Future(message = "The date is not in the future")
    private Date checkOut;

    @Pattern(regexp = "BAKING|DIRECT" ,message = "The Payment Type must be BAKING or DIRECT")
    private String paymentType;

    @Pattern(regexp = "UNPAID|PAID" ,message = "The Status must be UNPAID or PAID")
    private String status;


}
