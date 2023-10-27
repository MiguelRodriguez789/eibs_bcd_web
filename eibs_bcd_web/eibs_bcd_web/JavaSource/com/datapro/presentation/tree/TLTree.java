package com.datapro.presentation.tree;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.datapro.generic.beanutil.BeanList;
import com.datapro.generic.beanutil.BeanProxy;

/**
 * @author ogarcia
 *
 */

public class TLTree extends TagSupport {

// fields containing data source information

	private String 	context = ""; 						//prefix to be added to URL of all captions in data BeanList
	private String 	beanList = ""; 						//name of attribute in request that holds BeanList with data to be displayed in tree
	private BeanList 	listTree;							//BeanList of all data (which name contained in beanList property) to be displayed in tree 
	private BeanList	list;								//BeanList of all data mapped and ready for code generation
	

// fields containing table properties

	private String 	tableName="";						//table UNIQUE name in page
	private String 	tableStyleSheetFile="";				//file path of the style sheet file (.css)
	private boolean 	tableHasRootSymbol=false;			//show root symbol in menu tree
	private boolean 	tableHasCheckboxes=false;			//add checkboxes to menu items and implement submit hidden fields
	private boolean 	rootHasCheckbox=false;				//add checkbox to root (to check/uncheck all)
	private String 	rootLabel="";						//caption to show in root
	private boolean 	childrenOpenedInitialStatus=false;	//initial status of groups when parent is opened
	private boolean 	executeOpenAndCloseFromIcons=true;	//execute open/close methods when menu item icons are clicked
	private boolean 	executeOpenAndCloseFromCaption=true;//execute open/close methods when menu item caption is clicked
	private String 	tableStyle="";						//name of style to attach to table
	private String 	tableOddRowStyle="";				//name of style to attach to odd rows (or all if even is blank)
	private String 	tableEvenRowStyle="";				//name of style to attach to even rows
	private String 	tableMouseOverStyle="";				//name of style to set caption when onMouseOver
	private String 	defaultItemIconFile="";				//name of image file to use as menu item icon if icon not set
	private String 	defaultItemIconFileRollOver="";		//name of image file to use as menu item rollover icon if icon not set
	private String 	iconImagesSet="";					//url of folder where icon images are to be found

//name of fields that contain menu-item data(matches name) in source BeanList for mapping

	private String 	fn_id = "";							// name of field in BeanList that holds UNIQUE id of menu item
	private String 	fn_masterId = "";					// name of field in BeanList that holds id of parent menu item (leave blank if root)
	private String 	fn_caption = "";					// name of field in BeanList that holds caption to show in menu
	private String 	fn_checked = "";					// name of field in BeanList that holds initial status of menu item checkbox
	private String 	fn_opened = "";						// name of field in BeanList that holds initial status of menu item
	private String 	fn_url = "";						// name of field in BeanList that holds url - <A * HREF="url" *>CAPTION</A>
	private String 	fn_target = "";						// name of field in BeanList that holds target - <A * TARGET="target" *>CAPTION</A>
	private String 	fn_captionAppendToOnClick = "";		// name of field in BeanList that holds onClick - <A ONCLICK="*;captionAppendToOnClick">CAPTION</A>
	private String 	fn_captionAppendToOnMouseOver = "";	// name of field in BeanList that holds onMouseOver - <A ONMOUSEOVER="*;captionAppendToOnMouseOver">CAPTION</A>
	private String 	fn_captionAppendToOnMouseOut = "";	// name of field in BeanList that holds onMouseOut - <A ONMOUSEOUT="*;captionAppendToOnMouseOut">CAPTION</A>
	private String 	fn_captionExtraProperties = "";		// name of field in BeanList that holds extraProperties - <A * captionExtraProperties>CAPTION</A>
	private String 	v_checked = "";						// name of field in BeanList that holds initial status of menu item checkbox
	private String 	v_opened = "";						// name of field in BeanList that holds initial status of menu item
	private String 	v_url = "";							// name of field in BeanList that holds url - <A * HREF="url" *>CAPTION</A>
	private String 	v_target = "";						// name of field in BeanList that holds target - <A * TARGET="target" *>CAPTION</A>
	private String 	v_captionAppendToOnClick = "";		// name of field in BeanList that holds onClick - <A ONCLICK="*;captionAppendToOnClick">CAPTION</A>
	private String 	v_captionAppendToOnMouseOver = "";	// name of field in BeanList that holds onMouseOver - <A ONMOUSEOVER="*;captionAppendToOnMouseOver">CAPTION</A>
	private String 	v_captionAppendToOnMouseOut = "";	// name of field in BeanList that holds onMouseOut - <A ONMOUSEOUT="*;captionAppendToOnMouseOut">CAPTION</A>
	private String 	v_captionExtraProperties = "";		// name of field in BeanList that holds extraProperties - <A * captionExtraProperties>CAPTION</A>
	
// icon fields mapping

	private BeanList	iconMappingList=new BeanList();	// BeanList of JBIcon objects holding field mapping for icon generation

// div - scroll parameters

	private boolean	tableHasScroll = false;			// set scroll property
	private String 	scroll_height = "95%";				// height of scroll layer
	private String 	scroll_width = "150";				// width of scroll layer
	private String 	scroll_overFlowX = "auto";			// overFlowX of scroll layer
	private String 	scroll_overFlowY = "auto";			// overFlowY of scroll layer

// selection parameters and objects
	
	private boolean	tableEnableSelection = false;		// Makes items of the tree selectable
	private boolean	createHiddenSelectionFields=false;	// Creates hidden fields to store values on selection
	private BeanList	selectionObjects = new BeanList();	// BeanList of JBSelection objects holding name of hidden field and value

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		return (EVAL_BODY_INCLUDE);
	}

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {

		try{
			// create tree list
			if(fn_id.equals("")||fn_masterId.equals("")||fn_caption.equals("")){
				throw new IllegalStateException("at least id,masterId and caption fields must be mapped from data source bean list using tag attributes");
			}
			ServletRequest request = pageContext.getRequest();
			listTree = (BeanList) request.getAttribute(beanList);
			list = new BeanList();
			listTree.initRow();
			while(listTree.getNextRow()) {
				JBTreeLeaf leaf = new JBTreeLeaf();
				Object beanItem = (Object) listTree.getRecord();
				BeanProxy beanProxy = new BeanProxy(beanItem);
				if(!fn_id.equals(""))
					leaf.setId(beanProxy.get(fn_id).toString());
				if(!fn_masterId.equals(""))
					leaf.setMasterId(beanProxy.get(fn_masterId).toString().trim());
				if(!fn_caption.equals(""))
					leaf.setCaption(beanProxy.get(fn_caption).toString());
				if(!fn_url.equals("")) {
					String value = beanProxy.get(fn_url).toString().trim();
					String prefix = "";
					if (value.length() > 3) {
						prefix = (value.substring(0,4).equalsIgnoreCase("http"))?"":context;
					}
					leaf.setUrl(prefix + value);
				}
				else if(!v_url.equals("")) {
					String value = v_url.trim();
					String prefix = "";
					if (value.length() > 3) {
						prefix = (value.substring(0,4).equalsIgnoreCase("http"))?"":context;
					}
					leaf.setUrl(prefix + value);
				}
				if(!fn_target.equals(""))
					leaf.setTarget(beanProxy.get(fn_target).toString());
				else if(!v_target.equals(""))
					leaf.setTarget(v_target);
				if(!fn_checked.equals(""))
					leaf.setChecked(((Boolean)beanProxy.get(fn_checked)).booleanValue());
				else if(!v_checked.equals(""))
					leaf.setChecked((new Boolean(v_checked)).booleanValue());
				if(!fn_opened.equals(""))
					leaf.setOpened(((Boolean)beanProxy.get(fn_opened)).booleanValue());
				else if(!v_opened.equals(""))
					leaf.setOpened((new Boolean(v_opened)).booleanValue());
				if(!fn_captionAppendToOnClick.equals(""))
					leaf.setCaptionAppendToOnClick(beanProxy.get(fn_captionAppendToOnClick).toString());
				else if(!v_captionAppendToOnClick.equals(""))
					leaf.setCaptionAppendToOnClick(v_captionAppendToOnClick);
				if(!fn_captionAppendToOnMouseOver.equals(""))
					leaf.setCaptionAppendToOnMouseOver(beanProxy.get(fn_captionAppendToOnMouseOver).toString());
				else if(!v_captionAppendToOnMouseOver.equals(""))
					leaf.setCaptionAppendToOnMouseOver(v_captionAppendToOnMouseOver);
				if(!fn_captionAppendToOnMouseOut.equals(""))
					leaf.setCaptionAppendToOnMouseOut(beanProxy.get(fn_captionAppendToOnMouseOut).toString());
				else if(!v_captionAppendToOnMouseOut.equals(""))
					leaf.setCaptionAppendToOnMouseOut(v_captionAppendToOnMouseOut);
				if(!fn_captionExtraProperties.equals(""))
					leaf.setCaptionExtraProperties(beanProxy.get(fn_captionExtraProperties).toString());
				else if(!v_captionExtraProperties.equals(""))
					leaf.setCaptionExtraProperties(v_captionExtraProperties);
				BeanList iconList = leaf.getIcons();
				iconMappingList.initRow();
				while(iconMappingList.getNextRow()){
					JBIconMetaData iconMD = (JBIconMetaData)iconMappingList.getRecord();
					JBIcon icon = new JBIcon();
					if(!iconMD.getFn_fileName().equals(""))
						icon.setFileName(beanProxy.get(iconMD.getFn_fileName()).toString());
					else if(!iconMD.getV_fileName().equals(""))
						icon.setFileName(iconMD.getV_fileName());
					if(!iconMD.getFn_fileNameRollOver().equals(""))
						icon.setFileNameRollOver(beanProxy.get(iconMD.getFn_fileNameRollOver()).toString());
					else if(!iconMD.getV_fileNameRollOver().equals(""))
						icon.setFileNameRollOver(iconMD.getV_fileNameRollOver());
					if(!iconMD.getFn_alt().equals(""))
						icon.setAlt(beanProxy.get(iconMD.getFn_alt()).toString());
					else if(!iconMD.getV_alt().equals(""))
						icon.setAlt(iconMD.getV_alt());
					if(!iconMD.getFn_url().equals("")) {
						String value = beanProxy.get(iconMD.getFn_url()).toString().trim();
						String prefix = "";
						if (value.length() > 3) {
							prefix = (value.substring(0,4).equalsIgnoreCase("http"))?"":context;
						}
						icon.setUrl(prefix + value);
					}
					else if(!iconMD.getV_url().equals("")) {
						String value = iconMD.getV_url().trim();
						String prefix = "";
						if (value.length() > 3) {
							prefix = (value.substring(0,4).equalsIgnoreCase("http"))?"":context;
						}
						icon.setUrl(prefix + value);
					}
					if(!iconMD.getFn_target().equals(""))
						icon.setTarget(beanProxy.get(iconMD.getFn_target()).toString());
					else if(!iconMD.getV_target().equals(""))
						icon.setTarget(iconMD.getV_target());
					if(!iconMD.getFn_otherProperties().equals(""))
						icon.setOtherProperties(beanProxy.get(iconMD.getFn_otherProperties()).toString());
					else if(!iconMD.getV_otherProperties().equals(""))
						icon.setOtherProperties(iconMD.getV_otherProperties());
					if(!iconMD.getFn_appendToOnClick().equals(""))
						icon.setAppendToOnClick(beanProxy.get(iconMD.getFn_appendToOnClick()).toString());
					else if(!iconMD.getV_appendToOnClick().equals(""))
						icon.setAppendToOnClick(iconMD.getV_appendToOnClick());
					if(!iconMD.getFn_appendToOnMouseOver().equals(""))
						icon.setAppendToOnMouseOver(beanProxy.get(iconMD.getFn_appendToOnMouseOver()).toString());
					else if(!iconMD.getV_appendToOnMouseOver().equals(""))
						icon.setAppendToOnMouseOver(iconMD.getV_appendToOnMouseOver());
					if(!iconMD.getFn_appendToOnMouseOut().equals(""))
						icon.setAppendToOnMouseOut(beanProxy.get(iconMD.getFn_appendToOnMouseOut()).toString());
					else if(!iconMD.getV_appendToOnMouseOut().equals(""))
						icon.setAppendToOnMouseOut(iconMD.getV_appendToOnMouseOut());
					iconList.addRow(icon);
				}
				BeanList leafSelObj = leaf.getSelectionObjects();
				selectionObjects.initRow();
				while(selectionObjects.getNextRow()){
					JBSelection sel = (JBSelection) selectionObjects.getRecord();
					JBSelection newsel = new JBSelection();
					newsel.setHiddenFieldName(sel.getHiddenFieldName());
					newsel.setCreateHiddenField(sel.isCreateHiddenField());
					if(!sel.getFn_hiddenFieldValue().equals(""))
						newsel.setHiddenFieldValue(beanProxy.get(sel.getFn_hiddenFieldValue()).toString());
					else if(!sel.getV_hiddenFieldValue().equals(""))
						newsel.setHiddenFieldValue(sel.getV_hiddenFieldValue());
					else if(!sel.getTree_hiddenFieldValue().equals(""))
						newsel.setHiddenFieldValue("TREE_"+sel.getTree_hiddenFieldValue().toUpperCase());
					leafSelObj.addRow(newsel);
				}
				list.addRow(leaf);
			}

			// create tree
			JBTree tree = new JBTree();
			tree.setTableName(tableName);
			tree.setTableStyleSheetFile(tableStyleSheetFile);
			tree.setTableHasRootSymbol(tableHasRootSymbol);
			tree.setTableHasCheckboxes(tableHasCheckboxes);
			tree.setRootHasCheckbox(rootHasCheckbox);
			tree.setRootLabel(rootLabel);
			tree.setChildrenOpenedInitialStatus(childrenOpenedInitialStatus);
			tree.setExecuteOpenAndCloseFromIcons(executeOpenAndCloseFromIcons);
			tree.setExecuteOpenAndCloseFromCaption(executeOpenAndCloseFromCaption);
			tree.setTableStyle(tableStyle);
			tree.setTableOddRowStyle(tableOddRowStyle);
			tree.setTableEvenRowStyle(tableEvenRowStyle);
			tree.setTableMouseOverStyle(tableMouseOverStyle);
			tree.setDefaultItemIconFile(defaultItemIconFile);
			tree.setDefaultItemIconFileRollOver(defaultItemIconFileRollOver);
			tree.setIconImagesSet(context + iconImagesSet);
			tree.setMenuItems(list);
			tree.setSelectionObjects(selectionObjects);
			tree.setTableEnableSelection(tableEnableSelection);

			// attach new list to tree
			prepareForDisplay(tree);

			JspWriter out = pageContext.getOut();
			out.println("<link rel=stylesheet href=\""+tree.getTableStyleSheetFile()+"\" type=\"text/css\">");
			out.println(getCode(tree));
            out.println((tableHasScroll)?"<div id=\""+tableName+"_menuDiv\" class=\"scbarcolor\">":"");
			out.println("\t<table id=\"" + tableName + "\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" class=\"" + tableStyle + "\"></table>");
            out.println((tableHasScroll)?"</div>":"");
			out.println("<script language=\"javascript\">");
			out.println("\tbuildTree("+tableName+");");
			if(tableHasScroll){
				out.println("\t"+tableName+"_menuDiv.style.height=\""+scroll_height+"\";");
				out.println("\t"+tableName+"_menuDiv.style.width=\""+scroll_width+"\";");
				out.println("\t"+tableName+"_menuDiv.style.overflowX=\""+scroll_overFlowX+"\";");
				out.println("\t"+tableName+"_menuDiv.style.overflowY=\""+scroll_overFlowY+"\";");
			}
			out.println("</script>");
			if(tree.isTableHasCheckboxes())
				out.println(getHiddenFields(tree));
			if(isTableEnableSelection())
				out.println(getSelectionFields(tree));
		}
		catch (Exception e) {
			System.out.println("Error in tree code generation: "+e.toString());
		}

		return (EVAL_PAGE);
	}

	public boolean prepareForDisplay(JBTree tree) {
		boolean succeed = false;
		//create instance of treeLeafList
		BeanList treeLeafList = new BeanList();
		//add root leaf to treeLeafList if tree.isRootHasCheckbox
		int counter = 0;
		JBTreeLeaf rootLeaf=null;
		if (!tree.getRootLabel().equals("")){
			rootLeaf = new JBTreeLeaf();
			rootLeaf.setCaption(tree.getRootLabel());
			rootLeaf.setId(tree.getRootLabel().replace(' ', '_'));
			rootLeaf.setParentIdx("null");
			rootLeaf.setMasterId("null");
			rootLeaf.setThisIdx((counter++) + "");
			rootLeaf.setOpened(true);
			treeLeafList.addRow(rootLeaf);
		}
		//generate treeLeafList from menuItems
		BeanList menuItems = (BeanList) tree.getMenuItems();
		while (menuItems.getNextRow()) {
 			JBTreeLeaf treeLeaf = (JBTreeLeaf) menuItems.getRecord();
			treeLeaf.setThisIdx((counter++) + "");
			if(!tree.getRootLabel().equals("")&&treeLeaf.getMasterId().equalsIgnoreCase("null"))
				treeLeaf.setMasterId(rootLeaf.getId());
			treeLeafList.addRow(treeLeaf);
		}
		//fix treeLeafList
		fixTreeLeafList(treeLeafList);
		//attach treeLeafList to tree (instead of menuItems)
		tree.setMenuItems(treeLeafList);
		succeed = true;
		return succeed;
	}

	private void fixTreeLeafList(BeanList leafList) {
		//fill fields required for linkage
		leafList.initRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf = (JBTreeLeaf) leafList.getRecord();

			JBTreeLeaf firstChildLeaf = getFirstChild(leafList, tempLeaf);
			if (firstChildLeaf != null)
				tempLeaf.setFirstChildIdx(firstChildLeaf.getThisIdx());

			JBTreeLeaf parentLeaf = getParent(leafList, tempLeaf);
			if (parentLeaf != null)
				tempLeaf.setParentIdx(parentLeaf.getThisIdx());
		}
		// fill next link
		leafList.initRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf = (JBTreeLeaf) leafList.getRecord();

			JBTreeLeaf nextLeaf = getNext(leafList, tempLeaf);
			if (nextLeaf != null)
				tempLeaf.setNextIdx(nextLeaf.getThisIdx());
		}
		//fill numberOfChildren and numberOfCheckedChildren
		leafList.initRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf = (JBTreeLeaf) leafList.getRecord();
			tempLeaf.setNumberOfChildren(
				getNumberOfChildren(leafList, tempLeaf));
			tempLeaf.setNumberOfCheckedChildren(
				getNumberOfCheckedChildren(leafList, tempLeaf));
		}
		// return leafList;
	}

	private int getNumberOfChildren(BeanList leafList, JBTreeLeaf source) {
		int noc = 0;
		int pos = leafList.getCurrentRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf = (JBTreeLeaf) leafList.getRecord();
			if (tempLeaf
				.getParentIdx()
				.equalsIgnoreCase(source.getThisIdx())) {
				noc++;
				if (!tempLeaf.getFirstChildIdx().equalsIgnoreCase("null"))
					noc += getNumberOfChildren(leafList, tempLeaf);
			}
		}
		leafList.setCurrentRow(pos);
		return noc;
	}

	private int getNumberOfCheckedChildren(
		BeanList leafList,
		JBTreeLeaf source) {
		int nocc = 0;
		int pos = leafList.getCurrentRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf = (JBTreeLeaf) leafList.getRecord();
			if (tempLeaf
				.getParentIdx()
				.equalsIgnoreCase(source.getThisIdx())) {
				if (tempLeaf.isChecked())
					nocc++;
				if (!tempLeaf.getFirstChildIdx().equalsIgnoreCase("null"))
					nocc += getNumberOfCheckedChildren(leafList, tempLeaf);
			}
		}
		leafList.setCurrentRow(pos);
		return nocc;
	}

	private JBTreeLeaf getParent(BeanList leafList, JBTreeLeaf source) {
		int pos = leafList.getCurrentRow();
		leafList.initRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf2 = (JBTreeLeaf) leafList.getRecord();
			if (tempLeaf2.getId().equalsIgnoreCase(source.getMasterId())) {
				leafList.setCurrentRow(pos);
				return tempLeaf2;
			}
		}
		leafList.setCurrentRow(pos);
		return null;
	}

	private JBTreeLeaf getFirstChild(BeanList leafList, JBTreeLeaf source) {
		int pos = leafList.getCurrentRow();
		leafList.initRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf2 = (JBTreeLeaf) leafList.getRecord();
			if (tempLeaf2.getMasterId().equalsIgnoreCase(source.getId())) {
				leafList.setCurrentRow(pos);
				return tempLeaf2;
			}
		}
		leafList.setCurrentRow(pos);
		return null;
	}

	private JBTreeLeaf getNext(BeanList leafList, JBTreeLeaf source) {
		int pos = leafList.getCurrentRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf2 = (JBTreeLeaf) leafList.getRecord();
			if (tempLeaf2
				.getMasterId()
				.equalsIgnoreCase(source.getMasterId())) {
				leafList.setCurrentRow(pos);
				return tempLeaf2;
			}
		}
		leafList.setCurrentRow(pos);
		return null;
	}

	// get index of first root in tree's menu items

	private int getTreeRootIndex(BeanList leafList) {
		leafList.initRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf2 = (JBTreeLeaf) leafList.getRecord();
			if (tempLeaf2.getMasterId().equalsIgnoreCase("null")) {
				return leafList.getCurrentRow();
			}
		}
		return 0;
	}

	// javascript code generation from tree

	public String getCode(JBTree tree) {
		StringBuffer out = new StringBuffer();
		String tableName = tree.getTableName();
		out.append(
			"<script language=\"javascript\" src=\"javascripts/menuTree.js\"></script>\n");
		out.append("<script language=\"javascript\">\n");
		out.append(
			"//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
		out.append("//	TABLE " + tableName + " GLOBAL PROPERTIES\n");
		out.append(
			"//	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
		out.append("var " + tree.getTableName() + " = new Array();\n");
		out.append(tableName + ".tableName=\"" + tableName + "\";\n");
		out.append(
			tableName
				+ ".rootIndex=\""
				+ tableName
				+ "["
				+ getTreeRootIndex(tree.getMenuItems())
				+ "]"
				+ "\";\n");
		out.append(
			tableName + ".rootSymbol=" + tree.isTableHasRootSymbol() + ";\n");
		out.append(
			tableName + ".hasChecks=" + tree.isTableHasCheckboxes() + ";\n");
		out.append(
			tableName
				+ ".iconFile=\""
				+ tree.getDefaultItemIconFile()
				+ "\";\n");
		out.append(
			tableName
				+ ".iconFileRollOver=\""
				+ tree.getDefaultItemIconFileRollOver()
				+ "\";\n");
		out.append(
			tableName
				+ ".childrenInitialStatus="
				+ tree.isChildrenOpenedInitialStatus()
				+ ";\n");
		out.append(
			tableName
				+ ".methodsInIcon="
				+ tree.isExecuteOpenAndCloseFromIcons()
				+ ";\n");
		out.append(
			tableName
				+ ".methodsInCaption="
				+ tree.isExecuteOpenAndCloseFromCaption()
				+ ";\n");
		out.append(
			tableName
				+ ".selectable="
				+ tree.isTableEnableSelection()
				+ ";\n");
		out.append(
			tableName 
				+ ".set=\"" 
				+ tree.getIconImagesSet() 
				+ "\";\n");
		out.append(
			"//	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
		out.append("//	TABLE " + tableName.toUpperCase() + " DATA --- "
			+ "(0)id,(1)caption,(2)opened,(3)checked,(4)numberOfChildren,(5)numberOfCheckedChildren,(6)url,(7)target,(8)parentIdx,(9)firstChildIdx,(10)nextIdx,(11)thisIdx,(12)tableName,(13)appendToOnClick,(14)appendToOnMouseOver,(15)appendToOnMouseOut,(16)otherProperties,(17)<<ARRAY OF ICONS:((0)fileName,(1)fileNameRollOver,(2)alt,(3)url,(4)target,(5)appendToOnClick,(6)appendToOnMouseOver,(7)appendToOnMouseOut,(8)otherProperties)>>,(18)<<ARRAY OF \"SELECTIONS\":((0)idOfField,(1)fieldValue)>>"
			+ "\n");
		out.append(
			"//	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");

		BeanList leafList = tree.getMenuItems();
		leafList.initRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf = (JBTreeLeaf) leafList.getRecord();
			out.append(
				tree.getTableName()
					+ "["
					+ tempLeaf.getThisIdx()
					+ "] = "
					+ "new Array("
					+ "\""
					+ tableName
					+ "_node_"
					+ tempLeaf.getId()
					+ "\""
					+ ","
					+ "\""
					+ tempLeaf.getCaption()
					+ "\""
					+ ","
					+ ((tree.isChildrenOpenedInitialStatus())
						? true
						: tempLeaf.isOpened())
					+ ","
					+ tempLeaf.isChecked()
					+ ","
					+ tempLeaf.getNumberOfChildren()
					+ ","
					+ tempLeaf.getNumberOfCheckedChildren()
					+ ","
					+ ((!tempLeaf.getUrl().equalsIgnoreCase("null"))
						? ("\"" + tempLeaf.getUrl() + "\"")
						: ("null"))
					+ ","
					+ "\""
					+ tempLeaf.getTarget()
					+ "\""
					+ ","
					+ ((!tempLeaf.getParentIdx().equalsIgnoreCase("null"))
						? ("\""
							+ tableName
							+ "["
							+ tempLeaf.getParentIdx()
							+ "]\"")
						: ("null"))
					+ ","
					+ ((!tempLeaf.getFirstChildIdx().equalsIgnoreCase("null"))
						? ("\""
							+ tableName
							+ "["
							+ tempLeaf.getFirstChildIdx()
							+ "]\"")
						: ("null"))
					+ ","
					+ ((!tempLeaf.getNextIdx().equalsIgnoreCase("null"))
						? ("\""
							+ tableName
							+ "["
							+ tempLeaf.getNextIdx()
							+ "]\"")
						: ("null"))
					+ ","
					+ ((!tempLeaf.getThisIdx().equalsIgnoreCase("null"))
						? ("\""
							+ tableName
							+ "["
							+ tempLeaf.getThisIdx()
							+ "]\"")
						: ("null"))
					+ ","
					+ "\""
					+ tableName
					+ "\""
					+ ","
					+ "\""
					+ tempLeaf.getCaptionAppendToOnClick()
					+ "\""
					+ ","
					+ "\""
					+ tempLeaf.getCaptionAppendToOnMouseOver()
					+ "\""
					+ ","
					+ "\""
					+ tempLeaf.getCaptionAppendToOnMouseOut()
					+ "\""
					+ ","
					+ "\""
					+ tempLeaf.getCaptionExtraProperties()
					+ "\""
					+ ",");

			out.append("new Array(");
			BeanList iconList = tempLeaf.getIcons();
			iconList.initRow();
			while (iconList.getNextRow()) {
				JBIcon tempIcon = (JBIcon) iconList.getRecord();
				out.append(
					"new Array("
						+ "\""
						+ tempIcon.getFileName()
						+ "\""
						+ ","
						+ "\""
						+ tempIcon.getFileNameRollOver()
						+ "\""
						+ ","
						+ "\""
						+ tempIcon.getAlt()
						+ "\""
						+ ","
						+ "\""
						+ tempIcon.getUrl()
						+ "\""
						+ ","
						+ "\""
						+ tempIcon.getTarget()
						+ "\""
						+ ","
						+ "\""
						+ tempIcon.getAppendToOnClick()
						+ "\""
						+ ","
						+ "\""
						+ tempIcon.getAppendToOnMouseOver()
						+ "\""
						+ ","
						+ "\""
						+ tempIcon.getAppendToOnMouseOut()
						+ "\""
						+ ","
						+ "\""
						+ tempIcon.getOtherProperties()
						+ "\""
						+ "),");
			}
			if (out.charAt(out.length() - 1) == ',')
				out.deleteCharAt(out.length() - 1);
			out.append(")");
			out.append(",");
			out.append("new Array(");
			BeanList selobj = tempLeaf.getSelectionObjects();
			selobj.initRow();
			while (selobj.getNextRow()) {
				JBSelection sel = (JBSelection) selobj.getRecord();
				out.append(
					"new Array("
						+ "\""
						+ sel.getHiddenFieldName()
						+ "\""
						+ ","
						+ "\""
						+ sel.getHiddenFieldValue()
						+ "\""
						+ "),");
			}
			if (out.charAt(out.length() - 1) == ',')
				out.deleteCharAt(out.length() - 1);
			out.append(")");
			out.append(");\n");
		}
		out.append("</script>");
		return out.toString();
	}

	// hidden fields generation from tree

	public String getHiddenFields(JBTree tree) {
		StringBuffer out = new StringBuffer();
		BeanList leafList = tree.getMenuItems();
		leafList.initRow();
		while (leafList.getNextRow()) {
			JBTreeLeaf tempLeaf = (JBTreeLeaf) leafList.getRecord();
			out.append(
				"<input type=\"hidden\" name=\""
					+ tree.getTableName()
					+ "_hid_"
					+ tempLeaf.getId()
					+ "\" value=\""
					+ tempLeaf.isChecked()
					+ "\">\n");
		}
		return out.toString();
	}

	public String getSelectionFields(JBTree tree) {
		StringBuffer out = new StringBuffer();
		BeanList leafList = tree.getSelectionObjects();
		leafList.initRow();
		while (leafList.getNextRow()) {
			JBSelection sel = (JBSelection) leafList.getRecord();
			if(sel.isCreateHiddenField())
				out.append("<input type=\"hidden\" id=\""+sel.getHiddenFieldName()+"\" name=\"" + sel.getHiddenFieldName()+ "\" value=\"\">\n");
		}
		out.append("<input type=\"hidden\" id=\""+tableName+"_PSR\" name=\""+tableName+"_PSR\" value=\"\">\n");
		return out.toString();
	}

//getters and setters

	/**
	 * Returns the beanList.
	 * @return String
	 */
	public String getBeanList() {
		return beanList;
	}

	/**
	 * Returns the childrenOpenedInitialStatus.
	 * @return boolean
	 */
	public boolean isChildrenOpenedInitialStatus() {
		return childrenOpenedInitialStatus;
	}

	/**
	 * Returns the context.
	 * @return String
	 */
	public String getContext() {
		return context;
	}

	/**
	 * Returns the defaultItemIconFile.
	 * @return String
	 */
	public String getDefaultItemIconFile() {
		return defaultItemIconFile;
	}

	/**
	 * Returns the defaultItemIconFileRollOver.
	 * @return String
	 */
	public String getDefaultItemIconFileRollOver() {
		return defaultItemIconFileRollOver;
	}

	/**
	 * Returns the executeOpenAndCloseFromCaption.
	 * @return boolean
	 */
	public boolean isExecuteOpenAndCloseFromCaption() {
		return executeOpenAndCloseFromCaption;
	}

	/**
	 * Returns the executeOpenAndCloseFromIcons.
	 * @return boolean
	 */
	public boolean isExecuteOpenAndCloseFromIcons() {
		return executeOpenAndCloseFromIcons;
	}

	/**
	 * Returns the fn_caption.
	 * @return String
	 */
	public String getFn_caption() {
		return fn_caption;
	}

	/**
	 * Returns the fn_captionAppendToOnClick.
	 * @return String
	 */
	public String getFn_captionAppendToOnClick() {
		return fn_captionAppendToOnClick;
	}

	/**
	 * Returns the fn_captionAppendToOnMouseOut.
	 * @return String
	 */
	public String getFn_captionAppendToOnMouseOut() {
		return fn_captionAppendToOnMouseOut;
	}

	/**
	 * Returns the fn_captionAppendToOnMouseOver.
	 * @return String
	 */
	public String getFn_captionAppendToOnMouseOver() {
		return fn_captionAppendToOnMouseOver;
	}

	/**
	 * Returns the fn_captionExtraProperties.
	 * @return String
	 */
	public String getFn_captionExtraProperties() {
		return fn_captionExtraProperties;
	}

	/**
	 * Returns the fn_checked.
	 * @return String
	 */
	public String getFn_checked() {
		return fn_checked;
	}

	/**
	 * Returns the fn_id.
	 * @return String
	 */
	public String getFn_id() {
		return fn_id;
	}

	/**
	 * Returns the fn_masterId.
	 * @return String
	 */
	public String getFn_masterId() {
		return fn_masterId;
	}

	/**
	 * Returns the fn_opened.
	 * @return String
	 */
	public String getFn_opened() {
		return fn_opened;
	}

	/**
	 * Returns the fn_target.
	 * @return String
	 */
	public String getFn_target() {
		return fn_target;
	}

	/**
	 * Returns the fn_url.
	 * @return String
	 */
	public String getFn_url() {
		return fn_url;
	}

	/**
	 * Returns the iconImagesSet.
	 * @return String
	 */
	public String getIconImagesSet() {
		return iconImagesSet;
	}

	/**
	 * Returns the list.
	 * @return BeanList
	 */
	public BeanList getList() {
		return list;
	}

	/**
	 * Returns the listTree.
	 * @return BeanList
	 */
	public BeanList getListTree() {
		return listTree;
	}

	/**
	 * Returns the rootHasCheckbox.
	 * @return boolean
	 */
	public boolean isRootHasCheckbox() {
		return rootHasCheckbox;
	}

	/**
	 * Returns the rootLabel.
	 * @return String
	 */
	public String getRootLabel() {
		return rootLabel;
	}

	/**
	 * Returns the tableEvenRowStyle.
	 * @return String
	 */
	public String getTableEvenRowStyle() {
		return tableEvenRowStyle;
	}

	/**
	 * Returns the tableHasCheckboxes.
	 * @return boolean
	 */
	public boolean isTableHasCheckboxes() {
		return tableHasCheckboxes;
	}

	/**
	 * Returns the tableHasRootSymbol.
	 * @return boolean
	 */
	public boolean isTableHasRootSymbol() {
		return tableHasRootSymbol;
	}

	/**
	 * Returns the tableMouseOverStyle.
	 * @return String
	 */
	public String getTableMouseOverStyle() {
		return tableMouseOverStyle;
	}

	/**
	 * Returns the tableName.
	 * @return String
	 */
	public String getTableName() {
		return tableName;
	}

	/**
	 * Returns the tableOddRowStyle.
	 * @return String
	 */
	public String getTableOddRowStyle() {
		return tableOddRowStyle;
	}

	/**
	 * Returns the tableStyle.
	 * @return String
	 */
	public String getTableStyle() {
		return tableStyle;
	}

	/**
	 * Returns the v_captionAppendToOnClick.
	 * @return String
	 */
	public String getV_captionAppendToOnClick() {
		return v_captionAppendToOnClick;
	}

	/**
	 * Returns the v_captionAppendToOnMouseOut.
	 * @return String
	 */
	public String getV_captionAppendToOnMouseOut() {
		return v_captionAppendToOnMouseOut;
	}

	/**
	 * Returns the v_captionAppendToOnMouseOver.
	 * @return String
	 */
	public String getV_captionAppendToOnMouseOver() {
		return v_captionAppendToOnMouseOver;
	}

	/**
	 * Returns the v_captionExtraProperties.
	 * @return String
	 */
	public String getV_captionExtraProperties() {
		return v_captionExtraProperties;
	}

	/**
	 * Returns the v_checked.
	 * @return String
	 */
	public String getV_checked() {
		return v_checked;
	}

	/**
	 * Returns the v_opened.
	 * @return String
	 */
	public String getV_opened() {
		return v_opened;
	}

	/**
	 * Returns the v_target.
	 * @return String
	 */
	public String getV_target() {
		return v_target;
	}

	/**
	 * Returns the v_url.
	 * @return String
	 */
	public String getV_url() {
		return v_url;
	}

	/**
	 * Sets the beanList.
	 * @param beanList The beanList to set
	 */
	public void setBeanList(String beanList) {
		this.beanList = beanList;
	}

	/**
	 * Sets the childrenOpenedInitialStatus.
	 * @param childrenOpenedInitialStatus The childrenOpenedInitialStatus to set
	 */
	public void setChildrenOpenedInitialStatus(boolean childrenOpenedInitialStatus) {
		this.childrenOpenedInitialStatus = childrenOpenedInitialStatus;
	}

	/**
	 * Sets the context.
	 * @param context The context to set
	 */
	public void setContext(String context) {
		this.context = context;
	}

	/**
	 * Sets the defaultItemIconFile.
	 * @param defaultItemIconFile The defaultItemIconFile to set
	 */
	public void setDefaultItemIconFile(String defaultItemIconFile) {
		this.defaultItemIconFile = defaultItemIconFile;
	}

	/**
	 * Sets the defaultItemIconFileRollOver.
	 * @param defaultItemIconFileRollOver The defaultItemIconFileRollOver to set
	 */
	public void setDefaultItemIconFileRollOver(String defaultItemIconFileRollOver) {
		this.defaultItemIconFileRollOver = defaultItemIconFileRollOver;
	}

	/**
	 * Sets the executeOpenAndCloseFromCaption.
	 * @param executeOpenAndCloseFromCaption The executeOpenAndCloseFromCaption to set
	 */
	public void setExecuteOpenAndCloseFromCaption(boolean executeOpenAndCloseFromCaption) {
		this.executeOpenAndCloseFromCaption = executeOpenAndCloseFromCaption;
	}

	/**
	 * Sets the executeOpenAndCloseFromIcons.
	 * @param executeOpenAndCloseFromIcons The executeOpenAndCloseFromIcons to set
	 */
	public void setExecuteOpenAndCloseFromIcons(boolean executeOpenAndCloseFromIcons) {
		this.executeOpenAndCloseFromIcons = executeOpenAndCloseFromIcons;
	}

	/**
	 * Sets the fn_caption.
	 * @param fn_caption The fn_caption to set
	 */
	public void setFn_caption(String fn_caption) {
		this.fn_caption = fn_caption;
	}

	/**
	 * Sets the fn_captionAppendToOnClick.
	 * @param fn_captionAppendToOnClick The fn_captionAppendToOnClick to set
	 */
	public void setFn_captionAppendToOnClick(String fn_captionAppendToOnClick) {
		this.fn_captionAppendToOnClick = fn_captionAppendToOnClick;
	}

	/**
	 * Sets the fn_captionAppendToOnMouseOut.
	 * @param fn_captionAppendToOnMouseOut The fn_captionAppendToOnMouseOut to set
	 */
	public void setFn_captionAppendToOnMouseOut(String fn_captionAppendToOnMouseOut) {
		this.fn_captionAppendToOnMouseOut = fn_captionAppendToOnMouseOut;
	}

	/**
	 * Sets the fn_captionAppendToOnMouseOver.
	 * @param fn_captionAppendToOnMouseOver The fn_captionAppendToOnMouseOver to set
	 */
	public void setFn_captionAppendToOnMouseOver(String fn_captionAppendToOnMouseOver) {
		this.fn_captionAppendToOnMouseOver = fn_captionAppendToOnMouseOver;
	}

	/**
	 * Sets the fn_captionExtraProperties.
	 * @param fn_captionExtraProperties The fn_captionExtraProperties to set
	 */
	public void setFn_captionExtraProperties(String fn_captionExtraProperties) {
		this.fn_captionExtraProperties = fn_captionExtraProperties;
	}

	/**
	 * Sets the fn_checked.
	 * @param fn_checked The fn_checked to set
	 */
	public void setFn_checked(String fn_checked) {
		this.fn_checked = fn_checked;
	}

	/**
	 * Sets the fn_id.
	 * @param fn_id The fn_id to set
	 */
	public void setFn_id(String fn_id) {
		this.fn_id = fn_id;
	}

	/**
	 * Sets the fn_masterId.
	 * @param fn_masterId The fn_masterId to set
	 */
	public void setFn_masterId(String fn_masterId) {
		this.fn_masterId = fn_masterId;
	}

	/**
	 * Sets the fn_opened.
	 * @param fn_opened The fn_opened to set
	 */
	public void setFn_opened(String fn_opened) {
		this.fn_opened = fn_opened;
	}

	/**
	 * Sets the fn_target.
	 * @param fn_target The fn_target to set
	 */
	public void setFn_target(String fn_target) {
		this.fn_target = fn_target;
	}

	/**
	 * Sets the fn_url.
	 * @param fn_url The fn_url to set
	 */
	public void setFn_url(String fn_url) {
		this.fn_url = fn_url;
	}

	/**
	 * Sets the iconImagesSet.
	 * @param iconImagesSet The iconImagesSet to set
	 */
	public void setIconImagesSet(String iconImagesSet) {
		this.iconImagesSet = iconImagesSet;
	}

	/**
	 * Sets the list.
	 * @param list The list to set
	 */
	public void setList(BeanList list) {
		this.list = list;
	}

	/**
	 * Sets the listTree.
	 * @param listTree The listTree to set
	 */
	public void setListTree(BeanList listTree) {
		this.listTree = listTree;
	}

	/**
	 * Sets the rootHasCheckbox.
	 * @param rootHasCheckbox The rootHasCheckbox to set
	 */
	public void setRootHasCheckbox(boolean rootHasCheckbox) {
		this.rootHasCheckbox = rootHasCheckbox;
	}

	/**
	 * Sets the rootLabel.
	 * @param rootLabel The rootLabel to set
	 */
	public void setRootLabel(String rootLabel) {
		this.rootLabel = rootLabel;
	}

	/**
	 * Sets the tableEvenRowStyle.
	 * @param tableEvenRowStyle The tableEvenRowStyle to set
	 */
	public void setTableEvenRowStyle(String tableEvenRowStyle) {
		this.tableEvenRowStyle = tableEvenRowStyle;
	}

	/**
	 * Sets the tableHasCheckboxes.
	 * @param tableHasCheckboxes The tableHasCheckboxes to set
	 */
	public void setTableHasCheckboxes(boolean tableHasCheckboxes) {
		this.tableHasCheckboxes = tableHasCheckboxes;
	}

	/**
	 * Sets the tableHasRootSymbol.
	 * @param tableHasRootSymbol The tableHasRootSymbol to set
	 */
	public void setTableHasRootSymbol(boolean tableHasRootSymbol) {
		this.tableHasRootSymbol = tableHasRootSymbol;
	}

	/**
	 * Sets the tableMouseOverStyle.
	 * @param tableMouseOverStyle The tableMouseOverStyle to set
	 */
	public void setTableMouseOverStyle(String tableMouseOverStyle) {
		this.tableMouseOverStyle = tableMouseOverStyle;
	}

	/**
	 * Sets the tableName.
	 * @param tableName The tableName to set
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	/**
	 * Sets the tableOddRowStyle.
	 * @param tableOddRowStyle The tableOddRowStyle to set
	 */
	public void setTableOddRowStyle(String tableOddRowStyle) {
		this.tableOddRowStyle = tableOddRowStyle;
	}

	/**
	 * Sets the tableStyle.
	 * @param tableStyle The tableStyle to set
	 */
	public void setTableStyle(String tableStyle) {
		this.tableStyle = tableStyle;
	}

	/**
	 * Sets the v_captionAppendToOnClick.
	 * @param v_captionAppendToOnClick The v_captionAppendToOnClick to set
	 */
	public void setV_captionAppendToOnClick(String v_captionAppendToOnClick) {
		this.v_captionAppendToOnClick = v_captionAppendToOnClick;
	}

	/**
	 * Sets the v_captionAppendToOnMouseOut.
	 * @param v_captionAppendToOnMouseOut The v_captionAppendToOnMouseOut to set
	 */
	public void setV_captionAppendToOnMouseOut(String v_captionAppendToOnMouseOut) {
		this.v_captionAppendToOnMouseOut = v_captionAppendToOnMouseOut;
	}

	/**
	 * Sets the v_captionAppendToOnMouseOver.
	 * @param v_captionAppendToOnMouseOver The v_captionAppendToOnMouseOver to set
	 */
	public void setV_captionAppendToOnMouseOver(String v_captionAppendToOnMouseOver) {
		this.v_captionAppendToOnMouseOver = v_captionAppendToOnMouseOver;
	}

	/**
	 * Sets the v_captionExtraProperties.
	 * @param v_captionExtraProperties The v_captionExtraProperties to set
	 */
	public void setV_captionExtraProperties(String v_captionExtraProperties) {
		this.v_captionExtraProperties = v_captionExtraProperties;
	}

	/**
	 * Sets the v_checked.
	 * @param v_checked The v_checked to set
	 */
	public void setV_checked(String v_checked) {
		this.v_checked = v_checked;
	}

	/**
	 * Sets the v_opened.
	 * @param v_opened The v_opened to set
	 */
	public void setV_opened(String v_opened) {
		this.v_opened = v_opened;
	}

	/**
	 * Sets the v_target.
	 * @param v_target The v_target to set
	 */
	public void setV_target(String v_target) {
		this.v_target = v_target;
	}

	/**
	 * Sets the v_url.
	 * @param v_url The v_url to set
	 */
	public void setV_url(String v_url) {
		this.v_url = v_url;
	}

	/**
	 * Returns the iconMapping.
	 * @return BeanList
	 */
	public BeanList getIconMappingList() {
		return iconMappingList;
	}

	/**
	 * Sets the iconMapping.
	 * @param iconMapping The iconMapping to set
	 */
	public void setIconMappingList(BeanList iconMappingList) {
		this.iconMappingList = iconMappingList;
	}
	/**
	 * Returns the scroll_height.
	 * @return String
	 */
	public String getScroll_height() {
		return scroll_height;
	}

	/**
	 * Returns the scroll_overFlowX.
	 * @return String
	 */
	public String getScroll_overFlowX() {
		return scroll_overFlowX;
	}

	/**
	 * Returns the scroll_overFlowY.
	 * @return String
	 */
	public String getScroll_overFlowY() {
		return scroll_overFlowY;
	}

	/**
	 * Returns the scroll_width.
	 * @return String
	 */
	public String getScroll_width() {
		return scroll_width;
	}

	/**
	 * Returns the tableHasScroll.
	 * @return boolean
	 */
	public boolean isTableHasScroll() {
		return tableHasScroll;
	}

	/**
	 * Sets the scroll_height.
	 * @param scroll_height The scroll_height to set
	 */
	public void setScroll_height(String scroll_height) {
		this.scroll_height = scroll_height;
	}

	/**
	 * Sets the scroll_overFlowX.
	 * @param scroll_overFlowX The scroll_overFlowX to set
	 */
	public void setScroll_overFlowX(String scroll_overFlowX) {
		this.scroll_overFlowX = scroll_overFlowX;
	}

	/**
	 * Sets the scroll_overFlowY.
	 * @param scroll_overFlowY The scroll_overFlowY to set
	 */
	public void setScroll_overFlowY(String scroll_overFlowY) {
		this.scroll_overFlowY = scroll_overFlowY;
	}

	/**
	 * Sets the scroll_width.
	 * @param scroll_width The scroll_width to set
	 */
	public void setScroll_width(String scroll_width) {
		this.scroll_width = scroll_width;
	}

	/**
	 * Sets the tableHasScroll.
	 * @param tableHasScroll The tableHasScroll to set
	 */
	public void setTableHasScroll(boolean tableHasScroll) {
		this.tableHasScroll = tableHasScroll;
	}

	/**
	 * Returns the selectionObjects.
	 * @return BeanList
	 */
	public BeanList getSelectionObjects() {
		return selectionObjects;
	}

	/**
	 * Returns the tableEnableSelection.
	 * @return boolean
	 */
	public boolean isTableEnableSelection() {
		return tableEnableSelection;
	}

	/**
	 * Sets the selectionObjects.
	 * @param selectionObjects The selectionObjects to set
	 */
	public void setSelectionObjects(BeanList selectionObjects) {
		this.selectionObjects = selectionObjects;
	}

	/**
	 * Sets the tableEnableSelection.
	 * @param tableEnableSelection The tableEnableSelection to set
	 */
	public void setTableEnableSelection(boolean tableEnableSelection) {
		this.tableEnableSelection = tableEnableSelection;
	}

	/**
	 * Returns the createHiddenSelectionFields.
	 * @return boolean
	 */
	public boolean isCreateHiddenSelectionFields() {
		return createHiddenSelectionFields;
	}

	/**
	 * Sets the createHiddenSelectionFields.
	 * @param createHiddenSelectionFields The createHiddenSelectionFields to set
	 */
	public void setCreateHiddenSelectionFields(boolean createHiddenSelectionFields) {
		this.createHiddenSelectionFields = createHiddenSelectionFields;
	}

	/**
	 * Returns the tableStyleSheetFile.
	 * @return String
	 */
	public String getTableStyleSheetFile() {
		return tableStyleSheetFile;
	}

	/**
	 * Sets the tableStyleSheetFile.
	 * @param tableStyleSheetFile The tableStyleSheetFile to set
	 */
	public void setTableStyleSheetFile(String tableStyleSheetFile) {
		this.tableStyleSheetFile = tableStyleSheetFile;
	}

}