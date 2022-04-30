package com.utc.service;

import com.utc.entity.Booking;
import com.utc.entity.Room;
import com.utc.entity.RoomBook;
import com.utc.form.create.RoomBookCreateForm;
import com.utc.form.update.RoomBookUpdateForm;
import com.utc.repository.IBookingRepository;
import com.utc.repository.IRoomBookRepository;
import com.utc.repository.IRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class RoomBookService implements IRoomBookService{

    @Autowired
    private IRoomBookRepository roomBookRepository;

    @Autowired
    private IRoomRepository roomRepository;

    @Autowired
    private IBookingRepository bookingRepository;

    @Override
    public List<RoomBook> getListRoomBook() {
        return roomBookRepository.findAll();
    }

    @Override
    public List<RoomBook> getRoomBookByBookingGuestsId(int guestsId) {
        return roomBookRepository.getRoomBookByBookingGuestsId(guestsId);
    }

    @Override
    public void createRoomBook(RoomBookCreateForm form) {

        RoomBook roomBook = new RoomBook();
        Room room = roomRepository.findById(form.getRoomId()).get();
        Booking booking = bookingRepository.findById(form.getBookingId()).get();
        roomBook.setRoom(room);
        roomBook.setBooking(booking);

        roomBookRepository.save(roomBook);
    }

    @Override
    public void updateRoomBook(int id,RoomBookUpdateForm form) {
        RoomBook roomBook = roomBookRepository.findById(id).get();
        Room room = roomRepository.findById(form.roomId).get();
        roomBook.setRoom(room);
        roomBookRepository.save(roomBook);
    }

    @Override
    public void deleteRoomBook(int id) {
        RoomBook roomBook = roomBookRepository.findById(id).get();
        roomBookRepository.delete(roomBook);
    }
}
