package com.utc.repository;

import com.utc.entity.Booking;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface IBookingRepository extends JpaRepository<Booking,Integer>, JpaSpecificationExecutor<Booking> {

    @Modifying
    @Query(value = "DELETE FROM Booking b WHERE b.status =: status")
    public void deleteAllByStatus(String status);

    public Booking getBookingByGuestsIdCard(String idCard);

}
