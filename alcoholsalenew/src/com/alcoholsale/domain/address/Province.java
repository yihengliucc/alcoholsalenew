package com.alcoholsale.domain.address;

import java.util.HashSet;
import java.util.Set;


/**
 * Province entity. @author MyEclipse Persistence Tools
 */

public class Province  implements java.io.Serializable {

    // Fields    

     private Integer idprovince;
     private String name;
     private Set cities = new HashSet(0);

    // Constructors

    /** default constructor */
    public Province() {
    }

	/** minimal constructor */
    public Province(String name) {
        this.name = name;
    }
    
    
    // Property accessors

    public Integer getIdprovince() {
        return this.idprovince;
    }
    
    public void setIdprovince(Integer idprovince) {
        this.idprovince = idprovince;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public Set getCities() {
        return this.cities;
    }
    
    public void setCities(Set cities) {
        this.cities = cities;
    }

 }