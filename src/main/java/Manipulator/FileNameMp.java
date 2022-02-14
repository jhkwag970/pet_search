package Manipulator;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import petDAO.PetFilesDAO;

public class FileNameMp {
	
	public FileNameMp() {}
	
	public ArrayList<String> nameMp (ArrayList<String> fNames) throws ClassNotFoundException, SQLException{
		ArrayList<String> fArr = new ArrayList<String>();
		ArrayList<String> tmpArr = new ArrayList<String>();
		PetFilesDAO fDAO = new PetFilesDAO();
		int count = 0;
		
		for(String str : fNames) {
			StringTokenizer token = new StringTokenizer(str, "." );
			while(token.hasMoreTokens()){
				String file = token.nextToken();
				tmpArr.add(file);
			}
		}
		for(int i = 0;  i < tmpArr.size(); i+=2) {
			count = fDAO.getFileNum(tmpArr.get(i));
			if(count != 0 ) {
				fArr.add(tmpArr.get(i)+count+"."+tmpArr.get(i+1));
			}else {
				fArr.add(tmpArr.get(i)+"."+tmpArr.get(i+1));
			}
		}
		return fArr;
	}
	
	

}
