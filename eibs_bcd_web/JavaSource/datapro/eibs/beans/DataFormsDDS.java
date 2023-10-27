package datapro.eibs.beans;

/**
 * Insert the type's description here.
 * Creation date: (4/17/2012 5:38:05 PM)
 * @author: Catalina Sepulveda
 */
public class DataFormsDDS {
	public java.lang.String ddsName;
	public java.lang.String type;
	public java.lang.String id;
	public java.lang.String description;
	public java.lang.String code;
	public boolean isTable;
	
	public java.lang.String getType() {
		return type == null || type.equals("") ? getId() + "Type" : type;
	}
	public void setType(java.lang.String type) {
		this.type = type;
	}
	public java.lang.String getCode() {
		return code;
	}
	public void setCode(java.lang.String code) {
		this.code = code;
	}
	public java.lang.String getDdsName() {
		return ddsName;
	}
	public void setDdsName(java.lang.String ddsName) {
		this.ddsName = ddsName;
	}
	public java.lang.String getDescription() {
		return description;
	}
	public void setDescription(java.lang.String description) {
		this.description = description;
	}
	public java.lang.String getId() {
		return id;
	}
	public void setId(java.lang.String id) {
		this.id = id;
	}
	public boolean isTable() {
		return isTable;
	}
	public void setTable(boolean isTable) {
		this.isTable = isTable;
	}
	
	
}
