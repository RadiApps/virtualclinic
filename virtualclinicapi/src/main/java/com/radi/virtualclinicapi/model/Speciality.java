package com.radi.virtualclinicapi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SPECIALITY")
public class Speciality {

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="SPECIALITY_NAME", nullable = false , length = 100)
	private String specialityName;
	
	@Column(name="DESCRIPTION", nullable = true,length = 250)
	private String description;
}
