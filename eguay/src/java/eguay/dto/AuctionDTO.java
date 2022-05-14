/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eguay.dto;

import java.util.Date;

/**
 *
 * @author pedro
 */
public class AuctionDTO {
    // DB
    private Long id;
    
    // Conceptual
    private Date startDate;
    private Date closeDate;
    private Integer closeNumberofBids;
    private Float closePrice;
    private Float maxBid;
    private Boolean active;
    
    // Relationships
    //private UserDTO seller;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(Date closeDate) {
        this.closeDate = closeDate;
    }

    public Integer getCloseNumberofBids() {
        return closeNumberofBids;
    }

    public void setCloseNumberofBids(Integer closeNumberofBids) {
        this.closeNumberofBids = closeNumberofBids;
    }

    public Float getClosePrice() {
        return closePrice;
    }

    public void setClosePrice(Float closePrice) {
        this.closePrice = closePrice;
    }

    public Float getMaxBid() {
        return maxBid;
    }

    public void setMaxBid(Float maxBid) {
        this.maxBid = maxBid;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}