package com.utc.form.create;

import lombok.Data;

@Data
public class RoomCreateForm {

    private String number;

    private String statusRoom;

    private int roomType;

    private int hotelId;
}
