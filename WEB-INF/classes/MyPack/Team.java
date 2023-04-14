import javax.swing.*;
import java.io.*;
public class Team implements java.io.Serializable {
	private int ID;
	private String Name;
	public Team() {	
	}
	public Team(int iD, String name) {
		ID = iD;
		Name = name;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	

}
