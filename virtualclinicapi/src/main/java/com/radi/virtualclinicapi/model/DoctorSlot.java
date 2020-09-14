package com.radi.virtualclinicapi.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "DOCTOR_SLOT")
public class DoctorSlot {

		
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "USER_ID",referencedColumnName = "ID",nullable = false)
	private User user;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "FREE_DATE" 	)
	private Date freeDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "FREE_TIME")
	private Date freeTime;
	
	@Column(name = "IS_RESERVED"  ,columnDefinition = "CHAR DEFAULT 'N' ")
	private char isReserved;
	
	@Column(name = "IS_CLOSED"  ,columnDefinition = "CHAR DEFAULT 'N' " )
	private char isClosed;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATED_DATE")
	private Date createdDate;
	
	
}
