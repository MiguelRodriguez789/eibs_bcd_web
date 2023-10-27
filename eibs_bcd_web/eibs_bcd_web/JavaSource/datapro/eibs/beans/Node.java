package datapro.eibs.beans;

import java.util.ArrayList;

public class Node {
	
	public String id;
	public String desc;
	public String value;
	public String type;
	public boolean selected;
	public Object data;
	public boolean mark;
	public boolean readonly;
	
	
	public ArrayList nodes;

	public ArrayList getNodes() {
		return nodes;
	}

	public void setNodes(ArrayList children) {
		this.nodes = children;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	public void addNode(Node node){
		this.nodes.add(node);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public Node(){
		this.nodes=new ArrayList(30);
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
