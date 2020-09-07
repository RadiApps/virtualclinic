package com.radi.virtualclinicapi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "COUNTRY")
public class Country {

	@Id
	@Column(name = "ID",nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "ISO" , nullable = false, length = 2 )
	private String iso;
	
	@Column(name = "NAME" , nullable = false, length = 80)
	private String name;
	
	@Column(name = "ISO3" , nullable = false, length = 3)
	private String iso3;
	
	@Column(name = "NUM_CODE" , nullable = true )
	private int numCode;
	
	@Column(name = "PHONE_CODE" , nullable = false)
	private int phoneCode;
	
}
