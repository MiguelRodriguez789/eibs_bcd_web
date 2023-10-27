package com.datapro.presentation.tree;

import com.datapro.generic.beanutil.BeanList;

/**
 * @author bthorne
 *
 */

public class JBTreeLeaf{

	protected String id = "";								// UNIQUE id of menu item
	protected String masterId = "null";					// id of parent menu item (leave as "null" if root)
	protected String caption = "";						// caption to show in menu
	protected boolean checked = false;					// initial status of menu item checkbox
	protected boolean opened = false;					// initial status of menu item
	protected String url = "null";						// <A * HREF="url" *>CAPTION</A>
	protected String target = "";							// <A * TARGET="target" *>CAPTION</A>
	protected String captionAppendToOnClick = "";			// <A ONCLICK="*;captionAppendToOnClick">CAPTION</A>
	protected String captionAppendToOnMouseOver = "";		// <A ONMOUSEOVER="*;captionAppendToOnMouseOver">CAPTION</A>
	protected String captionAppendToOnMouseOut = "";		// <A ONMOUSEOUT="*;captionAppendToOnMouseOut">CAPTION</A>
	protected String captionExtraProperties = "";			// <A * captionExtraProperties>CAPTION</A>
	protected BeanList icons = new BeanList();			// beanlist of JBIcon with icons(images) to show right before caption
	protected BeanList selectionObjects = new BeanList();	// BeanList of JBSelection objects holding name of hidden field and value

	private int numberOfChildren = 0;
	private int numberOfCheckedChildren = 0;
	private String parentIdx = "null";
	private String firstChildIdx = "null";
	private String nextIdx = "null";
	private String thisIdx = "null";
	private String arrayName = "";
	private BeanList children = null;

	/**
	 * Returns the caption.
	 * @return String
	 */
	public String getCaption() {
		return caption;
	}

	/**
	 * Returns the captionAppendToOnClick.
	 * @return String
	 */
	public String getCaptionAppendToOnClick() {
		return captionAppendToOnClick;
	}

	/**
	 * Returns the captionAppendToOnMouseOut.
	 * @return String
	 */
	public String getCaptionAppendToOnMouseOut() {
		return captionAppendToOnMouseOut;
	}

	/**
	 * Returns the captionAppendToOnMouseOver.
	 * @return String
	 */
	public String getCaptionAppendToOnMouseOver() {
		return captionAppendToOnMouseOver;
	}

	/**
	 * Returns the captionExtraProperties.
	 * @return String
	 */
	public String getCaptionExtraProperties() {
		return captionExtraProperties;
	}

	/**
	 * Returns the checked.
	 * @return boolean
	 */
	public boolean isChecked() {
		return checked;
	}

	/**
	 * Returns the icons.
	 * @return BeanList
	 */
	public BeanList getIcons() {
		return icons;
	}

	/**
	 * Returns the id.
	 * @return String
	 */
	public String getId() {
		return id;
	}

	/**
	 * Returns the masterId.
	 * @return String
	 */
	public String getMasterId() {
		return masterId;
	}

	/**
	 * Returns the opened.
	 * @return boolean
	 */
	public boolean isOpened() {
		return opened;
	}

	/**
	 * Returns the target.
	 * @return String
	 */
	public String getTarget() {
		return target;
	}

	/**
	 * Returns the url.
	 * @return String
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * Sets the caption.
	 * @param caption The caption to set
	 */
	public void setCaption(String caption) {
		this.caption = caption;
	}

	/**
	 * Sets the captionAppendToOnClick.
	 * @param captionAppendToOnClick The captionAppendToOnClick to set
	 */
	public void setCaptionAppendToOnClick(String captionAppendToOnClick) {
		this.captionAppendToOnClick = captionAppendToOnClick;
	}

	/**
	 * Sets the captionAppendToOnMouseOut.
	 * @param captionAppendToOnMouseOut The captionAppendToOnMouseOut to set
	 */
	public void setCaptionAppendToOnMouseOut(String captionAppendToOnMouseOut) {
		this.captionAppendToOnMouseOut = captionAppendToOnMouseOut;
	}

	/**
	 * Sets the captionAppendToOnMouseOver.
	 * @param captionAppendToOnMouseOver The captionAppendToOnMouseOver to set
	 */
	public void setCaptionAppendToOnMouseOver(String captionAppendToOnMouseOver) {
		this.captionAppendToOnMouseOver = captionAppendToOnMouseOver;
	}

	/**
	 * Sets the captionExtraProperties.
	 * @param captionExtraProperties The captionExtraProperties to set
	 */
	public void setCaptionExtraProperties(String captionExtraProperties) {
		this.captionExtraProperties = captionExtraProperties;
	}

	/**
	 * Sets the checked.
	 * @param checked The checked to set
	 */
	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	/**
	 * Sets the icons.
	 * @param icons The icons to set
	 */
	public void setIcons(BeanList icons) {
		this.icons = icons;
	}

	/**
	 * Sets the id.
	 * @param id The id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * Sets the masterId.
	 * @param masterId The masterId to set
	 */
	public void setMasterId(String masterId) {
		if(!masterId.equals("")&&!masterId.equals("0"))
			this.masterId = masterId;
	}

	/**
	 * Sets the opened.
	 * @param opened The opened to set
	 */
	public void setOpened(boolean opened) {
		this.opened = opened;
	}

	/**
	 * Sets the target.
	 * @param target The target to set
	 */
	public void setTarget(String target) {
		this.target = target;
	}

	/**
	 * Sets the url.
	 * @param url The url to set
	 */
	public void setUrl(String url) {
		if(!url.equals(""))
			this.url = url;
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
	 * Returns the arrayName.
	 * @return String
	 */
	public String getArrayName() {
		return arrayName;
	}

	/**
	 * Returns the children.
	 * @return BeanList
	 */
	public BeanList getChildren() {
		return children;
	}

	/**
	 * Returns the firstChildIdx.
	 * @return String
	 */
	public String getFirstChildIdx() {
		return firstChildIdx;
	}

	/**
	 * Returns the nextIdx.
	 * @return String
	 */
	public String getNextIdx() {
		return nextIdx;
	}

	/**
	 * Returns the numberOfCheckedChildren.
	 * @return int
	 */
	public int getNumberOfCheckedChildren() {
		return numberOfCheckedChildren;
	}

	/**
	 * Returns the numberOfChildren.
	 * @return int
	 */
	public int getNumberOfChildren() {
		return numberOfChildren;
	}

	/**
	 * Returns the parentIdx.
	 * @return String
	 */
	public String getParentIdx() {
		return parentIdx;
	}

	/**
	 * Returns the thisIdx.
	 * @return String
	 */
	public String getThisIdx() {
		return thisIdx;
	}

	/**
	 * Sets the arrayName.
	 * @param arrayName The arrayName to set
	 */
	public void setArrayName(String arrayName) {
		this.arrayName = arrayName;
	}

	/**
	 * Sets the children.
	 * @param children The children to set
	 */
	public void setChildren(BeanList children) {
		this.children = children;
	}

	/**
	 * Sets the firstChildIdx.
	 * @param firstChildIdx The firstChildIdx to set
	 */
	public void setFirstChildIdx(String firstChildIdx) {
		this.firstChildIdx = firstChildIdx;
	}

	/**
	 * Sets the nextIdx.
	 * @param nextIdx The nextIdx to set
	 */
	public void setNextIdx(String nextIdx) {
		this.nextIdx = nextIdx;
	}

	/**
	 * Sets the numberOfCheckedChildren.
	 * @param numberOfCheckedChildren The numberOfCheckedChildren to set
	 */
	public void setNumberOfCheckedChildren(int numberOfCheckedChildren) {
		this.numberOfCheckedChildren = numberOfCheckedChildren;
	}

	/**
	 * Sets the numberOfChildren.
	 * @param numberOfChildren The numberOfChildren to set
	 */
	public void setNumberOfChildren(int numberOfChildren) {
		this.numberOfChildren = numberOfChildren;
	}

	/**
	 * Sets the parentIdx.
	 * @param parentIdx The parentIdx to set
	 */
	public void setParentIdx(String parentIdx) {
		this.parentIdx = parentIdx;
	}

	/**
	 * Sets the thisIdx.
	 * @param thisIdx The thisIdx to set
	 */
	public void setThisIdx(String thisIdx) {
		this.thisIdx = thisIdx;
	}

}
