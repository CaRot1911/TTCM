package com.utc.form.create;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;

@Data
public class RoomBookCreateForm {

    @NotBlank(message = "Can't be left empty")
    @Positive(message = "Cost must be greater than 0")
    private int roomId;

    @NotBlank(message = "Can't be left empty")
    @Positive(message = "Cost must be greater than 0")
    private int bookingId;

}
