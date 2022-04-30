package com.utc.controller;

import com.utc.repository.IBookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/UTCDemo/booking")
public class BookingController {

    @Autowired
    private IBookingRepository repository;

    @GetMapping
    public ResponseEntity<?> getAllBooking(){
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }
}
