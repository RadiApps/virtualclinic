package com.radi.virtualclinicapi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "DOCTOR_DETAILS")
public class DoctorDetails {
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
		
	@ManyToOne
	@JoinColumn(name = "USER_ID",referencedColumnName = "ID")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "SPECIALITY_ID",referencedColumnName = "ID")
	private Speciality speciality;
	
	
	@Column(name = "IMAGE")
	private Byte[] image;
	
}
