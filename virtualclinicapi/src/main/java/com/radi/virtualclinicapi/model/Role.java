package com.radi.virtualclinicapi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ROLE")
public class Role {

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="ROLE_NAME", nullable = false , length = 50)
	private String roleName;
	
	@Column(name="DESCRIPTION", nullable = true,length = 250)
	private String description;
	
}
