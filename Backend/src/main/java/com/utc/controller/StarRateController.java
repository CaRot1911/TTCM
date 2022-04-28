package com.utc.controller;

import com.utc.dto.StarRateDTO;
import com.utc.entity.StarRate;
import com.utc.form.create.StarRateCreateForm;
import com.utc.form.update.StarRateUpdateForm;
import com.utc.service.IStarRateService;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/UTCDemo/starRate")
public class StarRateController {

    @Autowired
    private IStarRateService starRateService;

    @Autowired
    private ModelMapper modelMapper;

    @GetMapping
    public ResponseEntity<?> getListStarRateByHotelName(@RequestParam(name = "search") String search){
        List<StarRate> starRateList = starRateService.getListStarRateByHotelName(search);
        List<StarRateDTO> dtoList = modelMapper.map(starRateList,new TypeToken<List<StarRateDTO>>(){}.getType());
        return new ResponseEntity<>(dtoList, HttpStatus.OK);
    }

    @GetMapping("/page")
    public ResponseEntity<?> getPageStarRateByHotelName(@RequestParam(name = "search") String search, Pageable pageable){
        Page<StarRate> starRatePage = starRateService.getPageStarRateByHotelName(search, pageable);
        List<StarRateDTO> starRateDTOS = modelMapper.map(starRatePage.getContent(),new TypeToken<List<StarRateDTO>>(){}.getType());
        Page<StarRateDTO> starRateDTOPage = new PageImpl<>(starRateDTOS,pageable,starRatePage.getTotalElements());

        return new ResponseEntity<>(starRateDTOPage,HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<?> createStarRate(@RequestBody StarRateCreateForm form){
        starRateService.createStarRate(form);
        return new ResponseEntity<>("Create Success!!",HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<?> updateStarRate(@RequestParam(name = "id") int id, StarRateUpdateForm form){
        starRateService.updateStarRate(id, form);
        return new ResponseEntity<>("Update Success!!!",HttpStatus.OK);
    }

    @DeleteMapping
    public ResponseEntity<?> deleteMultipleImage(@RequestBody List<Integer> ids){
        starRateService.deleteMultipleImage(ids);
        return new ResponseEntity<>("Delete Multiple Star Rate Success!!!",HttpStatus.OK);
    }

}
