package com.utc.service;

import com.utc.entity.Booking;
import com.utc.entity.Guests;
import com.utc.form.create.BookingCreateForm;
import com.utc.form.filter.BookingFilter;
import com.utc.form.update.BookingUpdateForm;
import com.utc.repository.*;
import com.utc.specification.BookingSpecification;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class BookingService implements IBookingService{

    @Autowired
    private IBookingRepository bookingRepository;

    @Autowired
    private IGuestsService guestsService;

    @Autowired
    private IHotelServicesRepository hotelServicesRepository;

    @Autowired
    private IRoomBookRepository roomBookRepository;

    @Autowired
    private IUserServicesRepository userServicesRepository;

    @Autowired
    private ModelMapper modelMapper;


    @Override
    public Page<Booking> getListBookingByPage(String search, BookingFilter filter, Pageable pageable) {
        Specification<Booking> where = BookingSpecification.buildWhere(search, filter);
        return bookingRepository.findAll(where,pageable);
    }

    @Override
    public Page<Booking> getListBookingByIdCard(String idCard, Pageable pageable) {
        return bookingRepository.getBookingByGuestsIdCard(idCard,pageable);
    }

    @Override
    public void updateBooking(String idCard, BookingUpdateForm form) {
        Booking booking = bookingRepository.getBookingByGuestsIdCard(idCard);
        booking.setType(Booking.PaymentType.toEnum(form.getPaymentType()));
        booking.setStatus(Booking.bStatus.toEnum(form.getStatus()));

        bookingRepository.save(booking);
    }

    @Override
    public void createBooking(String idCard,BookingCreateForm form) {
        Guests guests = guestsService.getGuestsByIdCard(idCard);
        Booking booking = modelMapper.map(form,Booking.class);
        booking.setGuests(guests);
        bookingRepository.save(booking);
    }

    @Override
    public void deleteBookingById(int id) {
        Booking booking = bookingRepository.findById(id).get();
        bookingRepository.delete(booking);
    }

    @Override
    public void deleteAllByStatus(String status) {
        bookingRepository.deleteAllByStatus(status);
    }
}
