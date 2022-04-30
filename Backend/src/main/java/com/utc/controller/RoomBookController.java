package com.utc.controller;

import com.utc.dto.RoomBookDTO;
import com.utc.entity.RoomBook;
import com.utc.form.create.RoomBookCreateForm;
import com.utc.form.create.RoomCreateForm;
import com.utc.form.update.RoomBookUpdateForm;
import com.utc.service.IRoomBookService;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/UTCDemo/roomBook")
public class RoomBookController {

    @Autowired
    private IRoomBookService roomBookService;

    @Autowired
    private ModelMapper modelMapper;

    @GetMapping
    public ResponseEntity<?> getListRoomBook(){
        List<RoomBook> roomBookList = roomBookService.getListRoomBook();
        List<RoomBookDTO> roomBookDTOList = modelMapper.map(roomBookList,new TypeToken<List<RoomBookDTO>>(){}.getType());

        return new ResponseEntity<>(roomBookDTOList, HttpStatus.OK);
    }

    @GetMapping("/guestsId")
    public ResponseEntity<?> getRoomBookByBookingGuestsId(@RequestParam(name = "guestsId") int guestsId){
        List<RoomBook> roomBookList = roomBookService.getRoomBookByBookingGuestsId(guestsId);
        List<RoomBookDTO> roomBookDTOList = modelMapper.map(roomBookList,new TypeToken<List<RoomBookDTO>>(){}.getType());

        return new ResponseEntity<>(roomBookDTOList, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<?> createRoomBooking(@RequestBody RoomBookCreateForm form){
        roomBookService.createRoomBook(form);
//        Thay doi status cua room
        return new ResponseEntity<>("Create Success!!!", HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<?> updateRoomBooking(@RequestParam(name = "id")int id,@RequestBody RoomBookUpdateForm form){
        roomBookService.updateRoomBook(id,form);
        return new ResponseEntity<>("Update Success!!!", HttpStatus.OK);
    }

    @DeleteMapping
    public ResponseEntity<?> deleteRoomBooking(@RequestParam(name = "id") int id){
        roomBookService.deleteRoomBook(id);
//        Thay doi trang thai cua room;
        return new ResponseEntity<>("Delete Success!!!", HttpStatus.OK);
    }
}
