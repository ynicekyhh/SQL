package prob12;

import java.util.List;

public class MainApp {

	public static void main(String[] args) {
		//updateDoubleSalaryTest();
		listSEmployeesTest();
	}
	
	private static void updateDoubleSalaryTest() {
		try {
			EmployeeDao employeeDao = new EmployeeDao();
			boolean result =  employeeDao.updateDoubleSalary( 100L );
			
			if( result ) {
				System.out.println( "월급 갱싱 성공" );
			}
		} catch( Exception ex ) {
			ex.printStackTrace();
		}
	}

	private static void listSEmployeesTest() {
		try {
			EmployeeDao employeeDao = new EmployeeDao();
			List<EmployeeVo> list =  employeeDao.getAllEmployees();
			
			for( EmployeeVo vo : list ) {
				System.out.println( vo );
			}
		} catch( Exception ex ) {
			ex.printStackTrace();
		}
	}
	
}
