package com.datapro.presentation.tree;

import com.datapro.generic.beanutil.BeanList;

/**
 * @author bthorne
 *
 */
public class JBTree implements Cloneable {

	private String tableName;							//table UNIQUE name in page
	private String tableStyleSheetFile;				//file path of the style sheet file (.css)
	private boolean tableHasRootSymbol;				//show root symbol in menu tree
	private boolean tableHasCheckboxes;				//add checkboxes to menu items and implement submit hidden fields
	private boolean rootHasCheckbox;					//add checkbox to root (to check/uncheck all)
	private String rootLabel;							//caption to show in root
	private boolean childrenOpenedInitialStatus;		//initial status of groups when parent is opened
	private boolean executeOpenAndCloseFromIcons;		//execute open/close methods when menu item icons are clicked
	private boolean executeOpenAndCloseFromCaption;	//execute open/close methods when menu item caption is clicked
	private String tableStyle;							//name of style to attach to table
	private String tableOddRowStyle;					//name of style to attach to odd rows (or all if even is blank)
	private String tableEvenRowStyle;					//name of style to attach to even rows
	private String tableMouseOverStyle;				//name of style to set caption when onMouseOver
	private String defaultItemIconFile;				//name of image file to use as menu item icon if icon not set
	private String defaultItemIconFileRollOver;		//name of image file to use as menu item rollover icon if icon not set
	private String iconImagesSet;						//url of folder where icon images are to be found
	private BeanList menuItems;						//Beanlist of class JBTreeOption with all menu items
	private boolean tableEnableSelection;				//Makes items of the tree selectable
	private BeanList selectionObjects;					//Beanlist of class JBSelection for select-interface	

	/**
	 * Returns the childrenOpenedInitialStatus.
	 * @return boolean
	 */
	public boolean isChildrenOpenedInitialStatus() {
		return childrenOpenedInitialStatus;
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
	 * Returns the iconImagesSet.
	 * @return String
	 */
	public String getIconImagesSet() {
		return iconImagesSet;
	}

	/**
	 * Returns the menuItems.
	 * @return BeanList
	 */
	public BeanList getMenuItems() {
		return menuItems;
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
	 * Sets the childrenOpenedInitialStatus.
	 * @param childrenOpenedInitialStatus The childrenOpenedInitialStatus to set
	 */
	public void setChildrenOpenedInitialStatus(boolean childrenOpenedInitialStatus) {
		this.childrenOpenedInitialStatus = childrenOpenedInitialStatus;
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
	 * Sets the iconImagesSet.
	 * @param iconImagesSet The iconImagesSet to set
	 */
	public void setIconImagesSet(String iconImagesSet) {
		this.iconImagesSet = iconImagesSet;
	}

	/**
	 * Sets the menuItems.
	 * @param menuItems The menuItems to set
	 */
	public void setMenuItems(BeanList menuItems) {
		this.menuItems = menuItems;
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
	 * Returns the selectionObjects.
	 * @return BeanList
	 */
	public BeanList getSelectionObjects() {
		return selectionObjects;
	}

	/**
	 * Sets the selectionObjects.
	 * @param selectionObjects The selectionObjects to set
	 */
	public void setSelectionObjects(BeanList selectionObjects) {
		this.selectionObjects = selectionObjects;
	}

	/**
	 * Returns the tableEnableSelection.
	 * @return boolean
	 */
	public boolean isTableEnableSelection() {
		return tableEnableSelection;
	}

	/**
	 * Sets the tableEnableSelection.
	 * @param tableEnableSelection The tableEnableSelection to set
	 */
	public void setTableEnableSelection(boolean tableEnableSelection) {
		this.tableEnableSelection = tableEnableSelection;
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
