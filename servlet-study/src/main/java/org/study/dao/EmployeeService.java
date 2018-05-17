package org.study.dao;

import java.util.List;

public interface EmployeeService {
	int pager = 10;
	
	public boolean saveEmployee(Employee e);
	
	public List<Employee> listEmployee();
	
	public Employee listEmployee(int id);
	
	public List<Employee> listEmployeeByPage(int page);
	
	public boolean deleteEmployee(int id);
	
	public boolean updateEmployee(Employee e);
}
