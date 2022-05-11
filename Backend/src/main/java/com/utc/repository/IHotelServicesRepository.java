package com.utc.repository;

import com.utc.entity.HotelServices;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface IHotelServicesRepository extends JpaRepository<HotelServices,Integer>, JpaSpecificationExecutor<HotelServices> {

    public HotelServices getHotelServicesByNameAndHotelName(String name,String hotelName);

    public HotelServices getHotelServicesByHotelName(String name);

    public HotelServices getHotelServicesByName(String hotelServicesName);

}
