package com.bolsadeideas.springboot.app.models.dao;

import java.util.List;

import com.bolsadeideas.springboot.app.models.entity.Cliente;

public interface IClienteDao {
	/**
	 * para listar los clientes
	 * @return
	 */
	public List<Cliente> findAll();
	
	/**
	 * metodo para guardar u nuevo cliente
	 */
	public void save(Cliente cliente);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public Cliente findOne(Long id);

}
