package datapro.eibs.beans;

import java.util.ArrayList;
import java.util.HashMap;

public class Tree {

	 ArrayList nodes;
	 HashMap data;
	 String desc;
	 String id;
	 boolean mark;
	 boolean readonly;
	 
	 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public HashMap getData() {
		return data;
	}
	public void setData(HashMap data) {
		this.data = data;
	}
	public ArrayList getNodes() {
		return nodes;
	}
	public void setNodes(ArrayList nodes) {
		this.nodes = nodes;
	}
	
	
	public String getDesc() {
		return desc;
	}
	
	
	
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public void addNode(Node node){
		this.nodes.add(node);
	}
	
	public ArrayList getList(){
		return this.nodes;
	}
	
	public Tree(){
		this.nodes=new ArrayList(30);
		this.data=new HashMap();
	}
	public boolean isMark() {
		return mark;
	}
	public void setMark(boolean mark) {
		this.mark = mark;
	}
	public boolean isReadonly() {
		return readonly;
	}
	public void setReadonly(boolean readonly) {
		this.readonly = readonly;
	}
}
