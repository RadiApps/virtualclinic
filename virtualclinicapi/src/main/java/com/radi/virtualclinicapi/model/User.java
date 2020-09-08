package com.radi.virtualclinicapi.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="USER")
public class User {

	@Id
	@Column(name = "ID")
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
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATED_DATE")
	private Date createdDate;
	
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "UPDATED_DATE")
	private Date updatedDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COUNTRY_ID", nullable = false,referencedColumnName = "ID")
	private Country country;
	
	@ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
        name = "USER_ROLE", 
        joinColumns = { @JoinColumn(name = "USER_ID") }, 
        inverseJoinColumns = { @JoinColumn(name = "ROLE_ID") }
    )
    private Set<Role> roles = new HashSet<>();
}
