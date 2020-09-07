package com.radi.virtualclinicapi.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="USER")
public class User {

	@Id
	@Column(name = "ID",nullable = false)
	@GeneratedValue(generator = "seq-generator")
    @GenericGenerator(name = "seq-generator", strategy = "com.radi.virtualclinicapi.utils.SequenceGenerator")
	private Long id;
	
	@Column(name = "FIRST_NAME",nullable = false, length = 100)
	private String firstName;
	
	@Column(name = "LAST_NAME",nullable = false, length = 100)
	private String lastName;
	
	@Column(name = "EMAIL",nullable = false, length = 150)
	private String email;
	
	@Column(name = "CIVIL_ID",nullable = false, length = 12)
	private Integer civilId;
	
	@Column(name = "PHONE_NUMBER",nullable = false, length = 20)
	private Integer phoneNumber;
	
	@Column(name = "PASSWORD",nullable = false, length = 250)
	private String password;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "BIRTH_DATE")
	private Date birthDate;
	
	@Column(name = "ADDRESS")
	private String Address;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COUNTRY_ID", nullable = false)
	private Country country;
	
	
}
