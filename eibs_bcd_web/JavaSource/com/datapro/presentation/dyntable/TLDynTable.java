package com.datapro.presentation.dyntable;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.datapro.eibs.constants.StyleID;
import com.datapro.presentation.helps.TLHelpUtil;

import datapro.eibs.beans.ESS0030DSMessage;

/**
 * @author ogarcia
 *
 */

public class TLDynTable extends TagSupport {
	
	private String name = null;
	private String list = null;		
	private String scope = null;
	private String form = null;			
	private String urlDetail = "";
	private String urlEdit = "";
	private String urlRelated = "";
	private List listElement;
	private String styleClass = StyleID.STYLEID_TBINFO;
	private String styleClassScrollBar = StyleID.STYLEID_SCBARCOLOR;
	private String iconImagesSet = "/images";
	private String formatDate = null;
	private boolean actionAdd = true;
	private boolean actionDelete = true;
	private boolean actionDeleteAll = true;
	private boolean actionClone = true;
	private boolean actionEdit = true;
	private String statusField = null;
	// fields containing table properties
	private int flag = 1;
	private boolean childrenOpenedInitialStatus = false;
	//initial status of groups when parent is opened
	private boolean executeOpenAndCloseFromIcons = true;
	//execute open/close methods when menu item icons are clicked
	private boolean executeOpenAndCloseFromCaption = true;
	//execute open/close methods when menu item caption is clicked
	private String tableStyle = ""; //name of style to attach to table
	private String tableOddRowStyle = "";
	//name of style to attach to odd rows (or all if even is blank)
	private String tableEvenRowStyle = "";
	//name of style to attach to even rows
	private String tableMouseOverStyle = "";
	//name of style to set caption when onMouseOver
	private String defaultItemIconFile = "";
	//name of image file to use as menu item icon if icon not set
	private String defaultItemIconFileRollOver = "";
	//name of image file to use as menu item rollover icon if icon not set
	private boolean readonly = false;
	//allows only one single row un the dynamic table
	private boolean single_row = false; // set scroll property

	// div - scroll parameters

	private boolean tableHasScroll = false; // set scroll property
	private String scroll_height = "95%"; // height of scroll layer
	private String scroll_width = "150"; // width of scroll layer
	private String scroll_overFlowX = "auto"; // overFlowX of scroll layer
	private String scroll_overFlowY = "auto"; // overFlowY of scroll layer
	

	private int width = 640;
	private int height = 480;

	// selection parameters and objects

	private boolean tableEnableSelection = false;
	// Makes items of the tree selectable

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		listElement = new ArrayList();
		return (EVAL_BODY_INCLUDE);
	}
	
	public void release() {
		actionAdd = true;
		actionDelete = true;
		actionDeleteAll = false;
		actionClone = true;
		actionEdit = true;
		readonly = false;
		single_row=false;
		styleClass = "tableinfo";
		styleClassScrollBar = StyleID.STYLEID_SCBARCOLOR;
		iconImagesSet = "/images";
		formatDate = null;
		urlDetail = "";
		urlEdit = "";
		urlRelated = "";
	}
	
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {

		try {

			List listData = (List) TLHelpUtil.lookup(pageContext, list, scope);
		
			StringBuffer dataTable = new StringBuffer();
			StringBuffer mdRecord = new StringBuffer();
			StringBuffer headerTable = new StringBuffer();
			int count = 0;
			Iterator metaDataIter = listElement.listIterator();
			while (metaDataIter.hasNext()) {
				JBMetaData md = (JBMetaData) metaDataIter.next();
				int colIndex = ( md.getColCaption() == null ) ? 0 : ++count;
				StringBuffer options = new StringBuffer();
				if (md.getOptions() != null) {
					options.append(
							"new Array(");
					Iterator iter = md.getOptions().entrySet().iterator();
					while (iter.hasNext()) {
						Entry e = (Entry) iter.next();
						options.append("\""+e.getKey()+"\",\""+e.getValue()+"\"");
						if (iter.hasNext()) 
							options.append(",");
					}
					options.append(")");
				}
				StringBuffer attributes = new StringBuffer();
				if (md.getAttributes() != null) {
					attributes.append(
							"new Array(");
					Iterator iter = md.getAttributes().entrySet().iterator();
					while (iter.hasNext()) {
						Entry e = (Entry) iter.next();
						attributes.append("\""+e.getKey()+"\",\""+e.getValue()+"\"");
						if (iter.hasNext()) 
							attributes.append(",");
					}
					attributes.append(")");
				}
				mdRecord.append(
					"new Array(\""
						+ md.getCaption()
						+ "\",\""
						+ md.getType()
						+ "\",\""
						+ md.getFieldName()
						+ "\",\""
						+ md.getFieldNameD()
						+ "\",\""
						+ md.getFieldNameM()
						+ "\",\""
						+ md.getFieldNameY()
						+ "\",\""
						+ colIndex
						+ "\",\""
						+ md.getAlign()
						+ "\",\""
						+ md.getDefaultValue()
						+ "\",\""
						+ md.getDefaultDValue()
						+ "\",\""
						+ md.getDefaultMValue()
						+ "\",\""
						+ md.getDefaultYValue()
						+ "\",\""
						+ statusField
						+ "\",\""
						+ md.getMaxlength()
						+ "\","
						+ (md.getAttributes() == null ? "''" : attributes.toString())
						+ ","
						+ (md.getOptions() == null ? "''" : options.toString())
						+ ")");
				if (metaDataIter.hasNext()) {
					mdRecord.append(",");
				}
				if (colIndex > 0 ) headerTable.append("<TH align=\"" + md.getColAlign() + "\">" + md.getColCaption() + "</TH>");
			}
			//headerTable.append("</TH>");
			
			if (formatDate == null) {
				formatDate = ((ESS0030DSMessage) 
						TLHelpUtil.lookup(pageContext, "currUser", null)).getE01DTF();
			} 
			boolean hasFirst;
			Iterator listDataIter = listData.listIterator();			
			while (listDataIter.hasNext()) {
				Object beanData = (Object) listDataIter.next();
				StringBuffer dataRecord = new StringBuffer();
				metaDataIter = listElement.listIterator();
				while (metaDataIter.hasNext()) {
					JBMetaData md = (JBMetaData) metaDataIter.next();
					if (md.getFieldName().equals("")) {
						String valueD = TLHelpUtil.getProperty(beanData, md.getFieldNameD()).toString();
						String valueM = TLHelpUtil.getProperty(beanData, md.getFieldNameM()).toString();
						String valueY = TLHelpUtil.getProperty(beanData, md.getFieldNameY()).toString();
						
						valueD =  valueD.equals("0") ? "" : valueD;
						valueM =  valueM.equals("0") ? "" : valueM;
						valueY =  valueY.equals("0") ? "" : valueY;
						
						if (formatDate.equals("MDY")) dataRecord.append("\"" + valueM + "\",\"" + valueD +  "\",\"" + valueY + "\"");
						else if (formatDate.equals("DMY")) dataRecord.append("\"" + valueD + "\",\"" + valueM +  "\",\"" + valueY + "\"");
						else dataRecord.append("\"" + valueY + "\",\"" + valueM +  "\",\"" + valueD + "\"");
					} else {
						String value = TLHelpUtil.getProperty(beanData, md.getFieldName()).toString();
						dataRecord.append("\"" + value + "\"");
					}
					
					if (metaDataIter.hasNext()) {
						dataRecord.append(",");
					}else{
						if (statusField != null){
							String value = TLHelpUtil.getProperty(beanData, statusField).toString();
							dataRecord.append(",\"" + value + "\"");
						}
							
					}
				}
				dataTable.append("new Array(" + dataRecord + ")");
							
				if (listDataIter.hasNext()&&!isSingle_row()) {
					dataTable.append(",");
				}				
			}
			
			hasFirst = listData.isEmpty()&& single_row? false:true;
			
			JspWriter out = pageContext.getOut();

			if (tableHasScroll) {
				//TODO
			}
			
			String contextPath = TLHelpUtil.getContextPath(pageContext);
			
			if (!readonly && !single_row) {
				
				out.println("<table class=\"tbenter\" width=\"100%\" align=\"center\">");
				out.println("	<tr>");
				if (actionAdd) {
					out.println("   <td class=\"" + StyleID.STYLEID_TDBKG + "\" align=\"center\">");
					out.println("		<div align=\"center\">");
					out.println("		<a href=\"javascript:" +
							"newElement('" + contextPath + urlDetail + "','" + name + "','','" + width + "','" + height + "');\">");
					out.println("		<b>Agregar</b></a>");
					out.println("		</div>");
					out.println("	</td>");
				}
				if (actionClone) {
					out.println("   <td class=\"" + StyleID.STYLEID_TDBKG + "\" align=\"center\">");
					out.println("		<div align=\"center\">");
					out.println("		<a href=\"javascript:" +
							"cloneElements('" + name + "', (typeof(cloneCallback)=='undefined' ? undefined : cloneCallback))\">");
					out.println("		<b>Copiar</b></a>");
					out.println("		</div>");
					out.println("	</td>");
				}
				if (actionDelete) {
					out.println("   <td class=\"" + StyleID.STYLEID_TDBKG + "\" align=\"center\">");
					out.println("		<div align=\"center\">");
					out.println("		<a href=\"javascript:" +
							"deleteElements('" + name + "', (typeof(deleteCallback)=='undefined' ? undefined : deleteCallback))\">");
					out.println("		<b>Eliminar</b></a>");
					out.println("		</div>");
					out.println("	</td>");					
				}
				if (actionDeleteAll) {
					out.println("   <td class=\"" + StyleID.STYLEID_TDBKG + "\" align=\"center\">");
					out.println("		<div align=\"center\">");
					out.println("		<a href=\"javascript:" +
							"deleteAllElements('" + name + "', (typeof(deleteAllCallback)=='undefined' ? undefined : deleteAllCallback))\">");
					out.println("		<b>Eliminar Todos</b></a>");
					out.println("		</div>");
					out.println("	</td>");	
				}
				out.println("	</tr>");
				out.println("</table>");
				
			}else if(single_row && !hasFirst){
				out.println("<table>");
				out.println("	<tr>");
				if (actionAdd) {
					out.println("   <td align=\"center\">");
					out.println("		<input type=\"button\" name=\"add"
							+ name
							+ "\" value=\"add\" onClick=\"newElement('"
							+ contextPath + urlDetail + "','" + name + "',''"
							+ ",'" + width + "','" + height + "'"
							+ ");\" class=\""+ StyleID.STYLEID_EIBSBTN + "\">");
					out.println("	</td>");
				}
				
				out.println("	</tr>");
				out.println("</table>");
			
			}
			
			out.println("<table class=\""
					+ styleClass
					+ "\" id=\"tb"
					+ name
					+ "\" name=\"tb"
					+ name
					+ "\" width=\"100%\" >");
			out.println("<tr class=\"TRDARK\">");
			if (headerTable.toString() != null) out.println("<TH></TH>" + headerTable.toString());
			out.println("</tr>");
			out.println("</table>");
			int maxrec = (listData.isEmpty()) ? 0 : listData.size();
			
			out.println("<input type=\"hidden\" name=\"" + name + "_SIZE\" value=\"" + maxrec + "\">");
			if (tableHasScroll) {
				// TODO
			}
			
			out.println("<script language=\"javascript\" src=\""+ contextPath+ "/pages/s/javascripts/dynTable.js\"></script>\n");
			out.println("<script language=\"javascript\">");
			out.println("	var fmtDate" + name+ " = \""+ formatDate + "\"");
			out.println("	var ro"+ name+ " = \""+ (readonly ? "readonly" : "")+ "\";");
			out.println("	var considerStatus"+ name+ " = \""+ (statusField == null? "false" : "true")+ "\";");
			out.println("	var img = \"" + contextPath + iconImagesSet + "/dynTableImage.gif\";");
			out.println("	var urlDetail"+ name+ " = \"" + contextPath + urlDetail + "\";");
			if (!urlRelated.equals("")) {
				out.println("	var "+name+"Related = \"" 
						+ contextPath + urlRelated + "&list=" + getList() + "\";");	
			}
			out.println("	function createArrayFor" + name + "() {");
			out.println("		initDynTable();");
			out.println("		initCaptions('" + name + "',new Array(" + mdRecord + "));");
			out.println("		initArray('" + name + "',new Array(" + dataTable + "));");
			out.println("	}");
			out.println("	createArrayFor" + name + "();");
			out.println("</script>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return (EVAL_PAGE);
	}

	/**
	 * Returns the beanList.
	 * @return String
	 */
	public String getList() {
		return list;
	}

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
	 * Returns the listElement.
	 * @return BeanList
	 */
	public List getListElement() {
		return listElement;
	}

	/**
	 * Returns the readonly.
	 * @return boolean
	 */
	public boolean isReadonly() {
		return readonly;
	}	

	/**
	 * @return Returns the single_row.
	 */
	public boolean isSingle_row() {
		return single_row;
	}
	/**
	 * @param single_row The single_row to set.
	 */
	public void setSingle_row(boolean single_row) {
		this.single_row = single_row;
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
	 * Returns the tableEnableSelection.
	 * @return boolean
	 */
	public boolean isTableEnableSelection() {
		return tableEnableSelection;
	}

	/**
	 * Returns the tableEvenRowStyle.
	 * @return String
	 */
	public String getTableEvenRowStyle() {
		return tableEvenRowStyle;
	}

	/**
	 * Returns the tableHasScroll.
	 * @return boolean
	 */
	public boolean isTableHasScroll() {
		return tableHasScroll;
	}

	/**
	 * Returns the tableMouseOverStyle.
	 * @return String
	 */
	public String getTableMouseOverStyle() {
		return tableMouseOverStyle;
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
	 * Sets the beanList.
	 * @param beanList The beanList to set
	 */
	public void setList(String list) {
		this.list = list;
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
	 * Sets the listElement.
	 * @param listElement The listElement to set
	 */
	public void setListElement(List listElement) {
		this.listElement = listElement;
	}

	/**
	 * Sets the readonly.
	 * @param readonly The readonly to set
	 */
	public void setReadonly(boolean readonly) {
		this.readonly = readonly;
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
	 * Sets the tableEnableSelection.
	 * @param tableEnableSelection The tableEnableSelection to set
	 */
	public void setTableEnableSelection(boolean tableEnableSelection) {
		this.tableEnableSelection = tableEnableSelection;
	}

	/**
	 * Sets the tableEvenRowStyle.
	 * @param tableEvenRowStyle The tableEvenRowStyle to set
	 */
	public void setTableEvenRowStyle(String tableEvenRowStyle) {
		this.tableEvenRowStyle = tableEvenRowStyle;
	}

	/**
	 * Sets the tableHasScroll.
	 * @param tableHasScroll The tableHasScroll to set
	 */
	public void setTableHasScroll(boolean tableHasScroll) {
		this.tableHasScroll = tableHasScroll;
	}

	/**
	 * Sets the tableMouseOverStyle.
	 * @param tableMouseOverStyle The tableMouseOverStyle to set
	 */
	public void setTableMouseOverStyle(String tableMouseOverStyle) {
		this.tableMouseOverStyle = tableMouseOverStyle;
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
	 * Returns the flag.
	 * @return int
	 */
	public int getFlag() {
		return flag;
	}

	/**
	 * Sets the flag.
	 * @param flag The flag to set
	 */
	public void setFlag(int flag) {
		this.flag = flag;
	}

	/**
	 * Returns the styleClass.
	 * @return String
	 */
	public String getStyleClass() {
		return styleClass;
	}

	/**
	 * Sets the styleClass.
	 * @param styleClass The styleClass to set
	 */
	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}

	/**
	 * Returns the iconImagesSet.
	 * @return String
	 */
	public String getIconImagesSet() {
		return iconImagesSet;
	}

	/**
	 * Sets the iconImagesSet.
	 * @param iconImagesSet The iconImagesSet to set
	 */
	public void setIconImagesSet(String iconImagesSet) {
		this.iconImagesSet = iconImagesSet;
	}


	/**
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return
	 */
	public String getScope() {
		return scope;
	}

	/**
	 * @return
	 */
	public String getStyleClassScrollBar() {
		return styleClassScrollBar;
	}


	/**
	 * @param string
	 */
	public void setName(String string) {
		name = string;
	}

	/**
	 * @param string
	 */
	public void setScope(String string) {
		scope = string;
	}

	/**
	 * @param string
	 */
	public void setStyleClassScrollBar(String string) {
		styleClassScrollBar = string;
	}

	/**
	 * @return
	 */
	public String getUrlDetail() {
		return urlDetail;
	}

	/**
	 * @param string
	 */
	public void setUrlDetail(String string) {
		urlDetail = string;
	}

	public String getUrlEdit() {
		return urlEdit;
	}

	public void setUrlEdit(String urlEdit) {
		this.urlEdit = urlEdit;
	}

	public String getUrlRelated() {
		return urlRelated;
	}

	public void setUrlRelated(String urlRelated) {
		this.urlRelated = urlRelated;
	}

	/**
	 * @return
	 */
	public boolean isActionAdd() {
		return actionAdd;
	}

	/**
	 * @return
	 */
	public boolean isActionClone() {
		return actionClone;
	}

	/**
	 * @return
	 */
	public boolean isActionDelete() {
		return actionDelete;
	}

	/**
	 * @return
	 */
	public boolean isActionEdit() {
		return actionEdit;
	}

	/**
	 * @param b
	 */
	public void setActionAdd(boolean b) {
		actionAdd = b;
	}

	/**
	 * @param b
	 */
	public void setActionClone(boolean b) {
		actionClone = b;
	}

	/**
	 * @param b
	 */
	public void setActionDelete(boolean b) {
		actionDelete = b;
	}

	/**
	 * @param b
	 */
	public void setActionEdit(boolean b) {
		actionEdit = b;
	}

	/**
	 * @return
	 */
	public String getFormatDate() {
		return formatDate;
	}

	/**
	 * @param string
	 */
	public void setFormatDate(String string) {
		formatDate = string;
	}
	
	/**
	 * @return
	 */
	public String getForm() {
		return form;
	}

	/**
	 * @param string
	 */
	public void setForm(String string) {
		form = string;
	}

	/**
	 * @return
	 */
	public int getHeight() {
		return height;
	}

	/**
	 * @return
	 */
	public int getWidth() {
		return width;
	}

	/**
	 * @param i
	 */
	public void setHeight(int i) {
		height = i;
	}

	/**
	 * @param i
	 */
	public void setWidth(int i) {
		width = i;
	}

	/**
	 * @return the statusField
	 */
	public String getStatusField() {
		return statusField;
	}

	/**
	 * @param statusField the statusField to set
	 */
	public void setStatusField(String statusField) {
		this.statusField = statusField;
	}

}