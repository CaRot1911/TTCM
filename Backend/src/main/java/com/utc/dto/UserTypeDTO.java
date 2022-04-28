package com.utc.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;


@Data
public class UserTypeDTO {

    @JsonFormat(pattern = "ID")
    private int id;

    @JsonFormat(pattern = "Type")
    private String type;


}
