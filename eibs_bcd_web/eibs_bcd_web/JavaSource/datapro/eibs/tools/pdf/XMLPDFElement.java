package datapro.eibs.tools.pdf;

import java.awt.Color;

import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;

/**
 * Class to hold the Element to be print in a PDF document.
 */
	public class XMLPDFElement extends XMLElement {
		
		final public static int ALIGN_LEFT = Element.ALIGN_LEFT;
		final public static int ALIGN_CENTER = Element.ALIGN_CENTER;
		final public static int ALIGN_RIGHT = Element.ALIGN_RIGHT;

		private String fontFamily;
		private int style = Font.NORMAL;
		private Color color = null;
		private Color bgcolor = null;
		private float size = Font.UNDEFINED;
		private float x = 20;
		private float y = 20;
		private float width = 0;
		private int align = -1;
		private int valign = -1;
		private int cellborder = 0;
		private int colspan = 0;
		private Font font = FontFactory.getFont(FontFactory.HELVETICA, 7, Font.NORMAL);
		
		public void setX(float x){
			this.x = x;
		}
		public void setX(String x){
			this.x = Float.parseFloat(x);
		}
		public float getX(){
			return x;
		}
		public void setY(float y){
			this.y = y;
		}
		public void setY(String y){
			this.y = Float.parseFloat(y);
		}
		public float getY(){
			return y;
		}
		public void setWidth(float width){
			this.width = width;
		}
		public void setWidth(String width){
			this.width = Float.parseFloat(width);
		}
		public float getWidth(){
			return width;
		}
		/**
		 * Sets the horizontal align of the PDF Element 
		 * @param align - a string describing the horizontal align: left, center, right.
		 */
		public void setAlign(String align){
			if (align.equalsIgnoreCase("left")){
				this.align = Element.ALIGN_LEFT;
			} else if (align.equalsIgnoreCase("center")){
				this.align = Element.ALIGN_CENTER;
			} else if (align.equalsIgnoreCase("right")){
				this.align = Element.ALIGN_RIGHT;
			} else if (align.equalsIgnoreCase("justified")){
				this.align = Element.ALIGN_JUSTIFIED;
			} 
		}
		/**
		 * Sets the horizontal align of the PDF Element 
		 * @param align - an integer sets the horizontal align value.
		 */
		public void setAlign(int align){
			if (align == Element.ALIGN_LEFT || 
				align == Element.ALIGN_CENTER ||
				align == Element.ALIGN_RIGHT) this.align = align;
		}		
		/**
		 * Gets the horizontal align of the PDF Element 
		 */
		public int getAlign(){
			return this.align;
		}
		/**
		 * Sets the vertical align of the PDF Element 
		 * @param align - a string describing the vertical align: top, middle, bottom or baseline.
		 */
		public void setValign(String valign){
			if (valign.equalsIgnoreCase("top")){
				this.valign = Element.ALIGN_TOP;
			} else if (valign.equalsIgnoreCase("middle")){
				this.valign = Element.ALIGN_MIDDLE;
			} else if (valign.equalsIgnoreCase("bottom")){
				this.valign = Element.ALIGN_BOTTOM;
			} else if (valign.equalsIgnoreCase("baseline")){
				this.valign = Element.ALIGN_BASELINE;
			}
		}
		/**
		 * Sets the vertical align of the PDF Element 
		 * @param align - an integer sets the vertical align value.
		 */
		public void setValign(int valign){
			if (valign == Element.ALIGN_MIDDLE || 
				valign == Element.ALIGN_TOP ||
				valign == Element.ALIGN_BOTTOM ||
				valign == Element.ALIGN_BASELINE) this.valign = valign;
		}
		/**
		 * Gets the vertical align of the PDF Element 
		 */
		public int getValign(){
			return valign;
		}

		public void setCellborder(int size){
			cellborder = size;
		}
		
		public void setCellborder(String size){
			cellborder = Integer.parseInt(size);
		}
		
		public int getCellborder(){
			return cellborder;
		}

		public int getColspan() {
			return colspan;
		}
		public void setColspan(int colspan) {
			this.colspan = colspan;
		}
		public void setColspan(String colspan) {
			this.colspan = Integer.parseInt(colspan);;
		}
		/**
		 * @return
		 */
		public Font getFont() {
			return font;
		}
		
		public void setFont(String font, float size, int style, Color color){
			this.font = FontFactory.getFont(font, size, style, color);
			this.fontFamily = font;
			this.size = size;
			this.style = style;
			this.color = color;
		}
		public void setFont(String font, int size, int type){
			this.font = FontFactory.getFont(font, size, type);
			this.fontFamily = font;
			this.size = size;
		}
		
		/**
		 * @param string
		 */
		public void setFont(String string) {
			fontFamily = string;
			if (font == null) {
				font = FontFactory.getFont(fontFamily);
			} else {
				font.setFamily(fontFamily);
			}
		}
		
		/**
		 * Gets the output Font name of the PDF Element 
		 * @return a string as the Font name 
		 */
		public String getFontFamily() {
			return fontFamily;
		}
		
		/**
		 * @param string
		 */
		public void setFontFamily(String string) {
			setFont(string);
		}
		
		/**
		 * Gets the output font size of the PDF Element 
		 * @return a float as the font size
		 */
		public float getSize(){
			return size;
		}
		
		/**
		 * Sets the output font size of the PDF Element 
		 * @param size - The font size
		 */
		public void setSize(float size){
			this.size = size;
			if (font == null) {
				font = FontFactory.getFont(FontFactory.HELVETICA, size, Font.NORMAL);
			} else if (size != Font.UNDEFINED){
				font.setSize(getSize());
			}
		}
		
		/**
		 * Sets the output font size of the PDF Element 
		 * @param size - The font size
		 */
		public void setSize(String size){
			setSize(Float.parseFloat(size));
		}

		/**
		 * Gets the output style of the PDF Element 
		 * @return
		 */
		public String getStyle() {
			switch (style) {
				case Font.STRIKETHRU:
					return "strikethru";
				case Font.UNDERLINE:
					return "underline";
				case Font.BOLDITALIC:
					return "bolditalic";
				case Font.ITALIC:
					return "italic";
				case Font.BOLD:
					return "bold";
				default:
					return "normal";
			}
		}
		/** Gets the output style of the PDF Element 
		 * @param style - One of more of the following values: normal, bold, italic, underline, strike.
		 */
		public void setStyle(int style) {
			this.style = style;
			if (font == null) {
				font = FontFactory.getFont(FontFactory.HELVETICA, 7, style);
			} else {
				font.setStyle(getStyle());
			}
		}
		
		/** Sets the output style of the PDF Element 
		 * @param style - One of more of the following values: normal, bold, italic, underline, strike.
		 */
		public void setStyle(String value) {
			int style = Font.NORMAL;
			if (value.equalsIgnoreCase("normal")){
				style = Font.NORMAL;
			} else if (value.equalsIgnoreCase("bold")){
				style = Font.BOLD;
			} else if (value.equalsIgnoreCase("italic")){
				style = Font.ITALIC;
			} else if (value.equalsIgnoreCase("bolditalic")){
				style = Font.BOLDITALIC;
			} else if (value.equalsIgnoreCase("underline")){
				style = Font.UNDERLINE;
			} else if (value.equalsIgnoreCase("strikethru")){
				style = Font.STRIKETHRU;
			}
			setStyle(style);
		}
		
		/**
		 * Gets the output color of the PDF Element 
		 * @return a Color Object
		 */
		public Color getColor() {
			return color;
		}
		/**
		 * Sets the output color of the PDF Element 
		 * @param color
		 */
		public void setColor(Color color) {
			this.color = color;
			if (font == null) {
				font = FontFactory.getFont(FontFactory.HELVETICA, 7, style);
			}
			font.setColor(color);
		}
		/**
		 * Sets the output color of the PDF Element 
		 * @param color - An integer which is then converted to a Color object.
		 */
		public void setColor(int color) {
			setColor(new Color(color));
		}
		/**
		 * Sets the output color of the PDF Element 
		 * @param color - One of this colors: 
		 * black, blue, cyan, darkGray, gray, green, lightGray, magenta, orange, pink, red, white or yellow.
		 * Plus the string value is interpreted as an integer which is then converted to a Color object.
		 * If the specified property is not found or could not be parsed as an integer then null is returned.
		 */
		public void setColor(String color) {
			
			try {
				setColor(Integer.parseInt(color, 16));
			} catch (Exception e) {
				setColor(Color.getColor(color));
			}			
		}
		
		/**
		 * Gets the output background color of the PDF Element 
		 * @return a Color Object
		 */
		public Color getBgcolor() {
			return bgcolor;
		}
		
		/**
		 * Sets the output background color of the PDF Element 
		 * @param color
		 */
		public void setBgcolor(Color color) {
			bgcolor = color;
		}
		/**
		 * Sets the output background color of the PDF Element 
		 * @param color - An integer which is then converted to a Color object.
		 */
		public void setBgcolor(int color) {
			bgcolor = new Color(color);
		}
		/**
		 * Sets the output background color of the PDF Element 
		 * @param color - One of this colors: 
		 * black, blue, cyan, darkGray, gray, green, lightGray, magenta, orange, pink, red, white or yellow.
		 * Plus the string value is interpreted as an integer which is then converted to a Color object.
		 * If the specified property is not found or could not be parsed as an integer then null is returned.
		 */
		public void setBgcolor(String color) {
			
			try {
				bgcolor = new Color(Integer.parseInt(color, 16));
			} catch (Exception e) {
				bgcolor = Color.getColor(color);
			}			
		}
	}