package com.datapro.eibs.internet.generics;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
 
public class Util {
	public Util() {
		super();
	}

	public static Random generator = new Random();

	public static String TABLE = "";
	public static String IMG0 = "Img_";
	public static String IMG1 = "Img_";
	public static String IMG2 = "Img_";
	public static String IMG3 = "Img_";
	public static String IMG4 = "Img_";
	public static String IMG5 = "Img_";
	public static String IMG6 = "Img_";
	public static String IMG7 = "Img_";
	public static String IMG8 = "Img_";
	public static String IMG9 = "Img_";

	public static int NUM0 = 0;
	public static int NUM1 = 0;
	public static int NUM2 = 0;
	public static int NUM3 = 0;
	public static int NUM4 = 0;
	public static int NUM5 = 0;
	public static int NUM6 = 0;
	public static int NUM7 = 0;
	public static int NUM8 = 0;
	public static int NUM9 = 0;

	public static String Letter1 = "";
	public static String Number1 = "";
	public static String Letter2 = "";
	public static String Number2 = "";
	public static String Letter3 = "";
	public static String Number3 = "";

	static int FNUM = getRandom();

	public static String addLeftChar(char ch, int len, String str) {

		for (int i = str.length(); i < len; i++) {
			str = ch + str;
		}
		return (str);
	}

	public static String colorCCY(String num) {

		if (num.startsWith("-"))
			num = "<FONT COLOR=RED>" + num + "</FONT>";
		return num;

	}

	public static String formatAdd(String s1, String s2, String s3) {
		String r = "";

		if (!s1.trim().equals("")) {
			r += s1.trim() + "<br>";
		}
		if (!s2.trim().equals("")) {
			r += s2.trim() + "<br>";
		}
		if (!s3.trim().equals("")) {
			r += s3.trim() + "<br>";
		}
		if (r.trim().equals("")) {
			r = "&nbsp;";
		}
		return r;
	}

	public static String formatBlank(String s) {
		String r = null;

		if (s.trim().equals("&nbsp;")) {
			r = "";
		}
		else {
			r = s.trim();
		}
		return r;
	}

	public static String formatCell(String s) {
		String r = null;
		String rs = null;
		String ls = null;
		int pos = 0;
		if (s.trim().equals("")) {
			r = "&nbsp;";
		}
		else {
			s = s.trim();
			while (s.indexOf("'") != -1) {
				pos = s.indexOf("'");
				ls = s.substring(0, pos);
				rs = s.substring(pos + 1, s.length());
				s = ls + "&#39;" + rs;
			}

			while (s.indexOf("\"") != -1) {
				pos = s.indexOf("\"");
				ls = s.substring(0, pos);
				rs = s.substring(pos + 1, s.length());
				s = ls + "&#34;" + rs;
			}
			r = s;
		}
		return r;
	}

	public static String formatDate(String d1, String d2, String d3) {

		d1 = d1.length() == 1 ? "0" + d1 : d1;
		d2 = d2.length() == 1 ? "0" + d2 : d2;
		d3 = d3.length() == 1 ? "0" + d3 : d3;

		if (d1.equals("00") && d2.equals("00") && d3.equals("00"))
			return "&nbsp;";
		else
			return (d1 + "/" + d2 + "/" + d3);

	}

	public static String formatID(String c, String l) {
		String fc = "";
		for (int i = 0; i < (9 - c.length()); i++) {
			fc += "0";
		}
		String fl = "";
		for (int i = 0; i < (4 - l.length()); i++) {
			fl += "0";
		}
		return (fc + c + fl + l);
	}

	public static String formatYear(int y) {

		return formatYear(Integer.toString(y));

	}

	public static String formatYear(String y) {

		if (y.length() < 4) {
			try {
				int aux = Integer.parseInt(y);
				if (aux == 0) {
					y = "2000";
				}
				else if (aux > 52) {
					y = "19" + y;
				}
				else {
					y = "20" + justifyRight(y, 2);
				}
			}
			catch (Exception e) {
				y = "";
			}
		}

		return y;

	}

	public static String justifyLeft(String c, int l) {
		String fc = "";
		for (int i = 0; i < (l - c.length()); i++) {
			fc += "0";
		}
		return (c + fc);
	}

	public static String justifyRight(String c, int l) {
		String fc = "";
		for (int i = 0; i < (l - c.length()); i++) {
			fc += "0";
		}
		return (fc + c);
	}

	public static String leftValue(String s) {

		int pos = 0;
		for (pos = 0; pos < s.length(); pos++) {
			if (s.charAt(pos) == '_')
				break;
		}
		return (s.substring(0, pos));

	}

	public static String rightValue(String s) {

		int pos = 0;
		for (pos = 0; pos < s.length(); pos++) {
			if (s.charAt(pos) == '_')
				break;
		}
		if (pos == s.length())
			return ("0");
		else
			return (s.substring(pos + 1));

	}

	public static String[] splitField(String field, int row, int col) {
		String[] result = new String[row];
		for (int i = 0; i < row; i++) {
			result[i] = "";
		}
		if (field.length() > 0) {
			if (field.length() <= col) {
				result[0] = field;
			}
			else {
				int enter = field.length() / col;
				double rest = field.length() % col;
				if (rest > 0) {
					enter++;
				}
				for (int i = 0; i < enter; i++) {
					if (i == enter - 1) {
						result[i] = field.substring(i * col, field.length());
					}
					else {
						result[i] = field.substring(i * col, i * col + col);
					}
				}
			}
		}

		return (result);
	}

	public static String addRightChar(char ch, int len, String str) {

		for (int i = str.length(); i < len; i++) {
			str = str + ch;
		}

		return (str);
	}

	public static String concat(String s[], String ch) {
		String r = "";

		int count = 0;
		while (true) {
			try {
				if (!r.equals("") && !s[count].trim().equals(""))
					r += ch + s[count].trim();
				else
					r += s[count].trim();
				count++;
			}
			catch (Exception e) {
				break;
			}
		}
		return r;
	}

	public static String concatBR(String s[]) {
		String r = "";

		int count = 0;
		while (true) {
			try {
				if (!r.equals("") && !s[count].trim().equals(""))
					r += "<BR>" + s[count].trim();
				else
					r += s[count].trim();
				count++;
			}
			catch (Exception e) {
				break;
			}
		}
		return r;
	}

	public static String fcolorDate(String d1, String d2, String d3, String mature) {

		d1 = d1.length() == 1 ? "0" + d1 : d1;
		d2 = d2.length() == 1 ? "0" + d2 : d2;
		d3 = d3.length() == 1 ? "0" + d3 : d3;

		String date = "";
		String fdate = "";

		if (d1.equals("00") && d2.equals("00") && d3.equals("00"))
			return "&nbsp;";
		else
			date = d1 + "/" + d2 + "/" + d3;
		if (mature == "R") {
			fdate = "<FONT COLOR=RED>" + date + "</FONT>";
		}
		else if (mature == "O") {
			fdate = "<FONT COLOR=ORANGE>" + date + "</FONT>";
		}
		else {
			fdate = d1 + "/" + d2 + "/" + d3;
		}

		return (fdate);

	}

	public static String formatDate(String d) {

		d = d.length() == 5 ? "0" + d : d;
		if (d.length() == 6) {
			String d1 = d.substring(0, 2);
			String d2 = d.substring(2, 4);
			String d3 = d.substring(4, 6);
			return (d1 + "/" + d2 + "/" + d3);
		}
		else {
			return "";
		}
	}

	public static String trim(String s) {
		return s.trim();
	}

	public static String getCurrentMMDDYY() {

		Calendar calendar = Calendar.getInstance();
		String year = "" + calendar.get(Calendar.YEAR);
		String month = "" + (calendar.get(Calendar.MONTH) + 1);
		String day = "" + calendar.get(Calendar.DAY_OF_MONTH);

		year = year.substring(2);
		month = month.length() == 1 ? "0" + month : month;
		day = day.length() == 1 ? "0" + day : day;

		return (month + "/" + day + "/" + year);

	}

	public static String getCurrentHHMMSS() {

		Calendar calendar = Calendar.getInstance();
		String hour = "" + calendar.get(Calendar.HOUR_OF_DAY);
		String minute = "" + calendar.get(Calendar.MINUTE);
		String second = "" + calendar.get(Calendar.SECOND);

		hour = hour.length() == 1 ? "0" + hour : hour;
		minute = minute.length() == 1 ? "0" + minute : minute;
		second = second.length() == 1 ? "0" + second : second;

		return (hour + ":" + minute + ":" + second);

	}

	public static int getMonth() {
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH);
		return (month + 1);
	}

	public static int getYear() {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		String yearstr = year + "";
		yearstr = yearstr.trim().substring(2);
		return (Integer.parseInt(yearstr.trim()));
	}

	public static int getDay() {
		Calendar calendar = Calendar.getInstance();
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		return (day);
	}

	public static int getHour() {
		Calendar calendar = Calendar.getInstance();
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		return (hour);
	}

	public static int getMinute() {
		Calendar calendar = Calendar.getInstance();
		int min = calendar.get(Calendar.MINUTE);
		return (min);
	}

	public static int getSecond() {
		Calendar calendar = Calendar.getInstance();
		int sec = calendar.get(Calendar.SECOND);
		return (sec);
	}

	public static Timestamp getTimestamp() {
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		return ts;
	}

	public static String getCurrentYMDHMSS() {
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyyMMddhhmmssSS");
		Date currentTime = new Date();
		String dateString = formatDate.format(currentTime);
		dateString = dateString.length() > 16 ? dateString.substring(0, 16) : dateString;
		return dateString;
	}

	public static String formatStr(String mask, double value) {
		DecimalFormat fmt = new DecimalFormat(mask);
		return fmt.format(value);
	}

	public static String formatStr(String mask, String value) {
		double dv = Double.parseDouble(value);
		return formatStr(mask, dv);
	}

	public static int parseInt(String value) {
		int iv;
		try {
			iv = Integer.parseInt(value);
		}
		catch (Exception e) {
			iv = 0;
		}
		return iv;
	}

	public static String addDot(String number) {
		String result = "";

		if (number.length() == 1) {
			number = number + "00";
		}
		result = number.substring(0, number.length() - 2) + "." + number.substring(number.length() - 2);
		return (result);
	}

	public static String formatCCY_D(String num) {
		String num2 = "";
		String result = "";
		String sign = "";

		if (num != "") {
			sign = num.substring(0, 1);
			if (sign.equals("-"))
				num = num.substring(1);
			else
				sign = "";

			int posi = num.indexOf(".");
			if (posi > -1) {
				int x = num.length();
				num2 = "." + num.substring(posi + 1, x); //decimals
				if (num2.length() < 3)
					num2 = num2 + "0";
				num = num.substring(0, posi); //integers;
			}
			else { //if no exist decimal add it
				num2 = ".00";
			}
			int count = 0;
			int y = num.length() - 1;
			for (int x = y; x > -1; x--) {
				char nx = num.charAt(x);
				result = nx + result;
				++count;
				if (count == 3 || count == 6 || count == 9 || count == 12) {
					if (x > 0) {
						result = "," + result;
					} // add separator
				}

			}
			result = sign + result + num2;
		}
		else {
			result = "0.00";
		}
		return (result);

	}

	public static String formatCCY_C(String num) {
		String num2 = "";
		String result = "";
		String sign = "";

		if (num != "") {
			sign = num.substring(0, 1);
			if (sign.equals("-"))
				num = num.substring(1);
			else
				sign = "";

			int posi = num.indexOf(".");
			if (posi > -1) {
				int x = num.length();
				num2 = "," + num.substring(posi + 1, x); //decimals
				if (num2.length() < 3)
					num2 = num2 + "0";
				num = num.substring(0, posi); //integers;
			}
			else { //if no exist decimal add it
				num2 = ",00";
			}
			int count = 0;
			int y = num.length() - 1;
			for (int x = y; x > -1; x--) {
				char nx = num.charAt(x);
				result = nx + result;
				++count;
				if (count == 3 || count == 6 || count == 9 || count == 12) {
					if (x > 0) {
						result = "." + result;
					} // add separator
				}

			}
			result = sign + result + num2;
		}
		else {
			result = "0,00";
		}
		return (result);

	}

	public static String formatCCY(String num, String DPOINT) {
		if (DPOINT.equals("2")) {
			return formatCCY_D(num);
		}
		else {
			return formatCCY_C(num);
		}
	}

	public static String formatCCY(double real, String DPOINT) {
		if (DPOINT.equals("2")) {
			return formatCCY_D(String.valueOf(real));
		}
		else {
			return formatCCY_C(String.valueOf(real));
		}
	}

	public static String formatCCY(BigDecimal real, String DPOINT) {
		if (DPOINT.equals("2")) {
			return formatCCY_D(String.valueOf(real));
		}
		else {
			return formatCCY_C(String.valueOf(real));
		}
	}

	public static String CCY2NUM(String num, String DPOINT) {
		if (DPOINT.equals("2")) {
			return takeComa(num);
		}
		else {
			String dec = "";
			String result = "";
			String sign = "";
			if (num == "")
				return result;
			sign = num.substring(0, 1);
			if (sign == "-")
				num = num.substring(1);
			else
				sign = "";

			int posi = num.indexOf(",");
			if (posi > -1) {
				int x = num.length();
				dec = num.substring(posi + 1, x); //add "."
				if (dec.length() < 2)
					dec = dec + "0"; //add "0"
				dec = "." + dec; //add "."
				num = num.substring(0, posi);
			}
			else {
				dec = ".00";
			}
			int y = num.length();
			int count = 0;
			for (count = 0; count < y; count++) {
				char nx = num.charAt(count);
				if (nx != '.')
					result = result + nx;
			}

			result = sign + result + dec;
			return (result);
		}
	}

	public static String getDate(String FDate) {
		String rdateString = "";

		if (FDate.equals("1")) {
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yy");
			Date currentTime_1 = new Date();
			rdateString = formatter.format(currentTime_1);
		}
		if (FDate.equals("2")) {
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
			Date currentTime_1 = new Date();
			rdateString = formatter.format(currentTime_1);
		}

		return rdateString;
	}

	public static String takeCero(String number) {
		String result = "";
		boolean scero = false;
		int lgt = 0;

		scero = number.startsWith("0");
		result = number;
		lgt = number.length();
		while (scero) {
			result = result.substring(1, lgt);
			scero = result.startsWith("0");
			lgt = result.length();
		}
		return (result);
	}

	public static String formatTime(String t) {

		if (t.length() == 5)
			t = "0" + t;

		if (t.length() == 6) {
			String t1 = t.substring(0, 2);
			String t2 = t.substring(2, 4);
			String t3 = t.substring(4, 6);

			return (t1 + ":" + t2 + ":" + t3);
		}
		else
			return t;

	}

	public static String getRefNum() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		Date currentTime_1 = new Date();
		String rdateString = formatter.format(currentTime_1);
		return rdateString;
	}

	public static String takeComa(String number) {
		String result = "";
		int posi = number.indexOf(",");
		if (posi > -1) {
			while (posi > -1) {
				result = number.substring(0, posi);
				result = result + number.substring(posi + 1);
				posi = result.indexOf(",");
				number = result;
			}
		}
		else {
			result = number;
		}
		return (result);
	}

	public static String takeSS(String number) {
		String result = "";
		int posi = number.indexOf("/");
		if (posi > -1) {
			while (posi > -1) {
				result = number.substring(0, posi);
				result = result + number.substring(posi + 1);
				posi = result.indexOf("/");
				number = result;
			}
		}
		else {
			result = number;
		}
		return (result);
	}

	public static String takeDot(String number) {
		String result = "";
		int posi = number.indexOf(".");
		if (posi > -1) {
			result = number.substring(0, posi);
			result = result + number.substring(posi + 1);
		}
		else {
			result = number + "00";
		}
		return (result);
	}

	public static String getMM() {

		Calendar calendar = Calendar.getInstance();
		String month = "" + (calendar.get(Calendar.MONTH) + 1);

		month = month.length() == 1 ? "0" + month : month;

		return (month);

	}

	public static String getDD() {

		Calendar calendar = Calendar.getInstance();
		String day = "" + calendar.get(Calendar.DAY_OF_MONTH);

		day = day.length() == 1 ? "0" + day : day;

		return (day);

	}

	public static String getYY() {

		Calendar calendar = Calendar.getInstance();
		String year = "" + calendar.get(Calendar.YEAR);

		year = year.substring(2);

		return (year);

	}

	public static boolean IsRutValid(String rut) {
		rut = rut.toUpperCase();
		int factor[] = { 5, 4, 3, 2, 7, 6, 5, 4, 3, 2 };
		char dv[] = { 'X', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'K', '0' };
		int len = rut.length() - 1;
		int ceros = 10 - len;
		int i = 0;
		if (ceros > 0) {
			for (i = 0; i < ceros; i++)
				rut = "0" + rut;
		}
		int count = 0;
		int suma = 0;
		int auxInt = 0;
		for (count = 0; count < 10; count++) {
			auxInt = parseInt(rut.substring(count, count + 1));
			suma = suma + auxInt * factor[count];
		}
		int index = 11 - (suma % 11);
		return rut.charAt(10) == dv[index];
	}

	public static String getRUT(String rut) {
		return rut.substring(0, rut.indexOf("-"));
	}

	public static String getDigit(String rut) {
		return rut.substring(rut.indexOf("-") + 1, rut.length());
	}

	public static int getDayofWeek(int m, int d, int y) {
		// return an int for any given date (0 for Sunday, ..., 6 for Saturday)
		m -= 2;
		if (m < 1) {
			m += 12;
			y--;
		}
		int cc = y / 100;
		int yy = y % 100;
		int dow = (d + (int) Math.floor(2.6 * m - 0.2) - 2 * cc + yy + yy / 4 + cc / 4) % 7;
		if (dow < 0)
			dow += 7;
		//return String.valueOf(dow);
		return dow;
	}

	public static String getDaySpell(String date, String format) {
		String Dias[] = { "Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado" };
		String Days[] = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
		String result = "";
		int d;
		int m;
		int y;
		int day;

		if (format == "MM/DD/AA") {
			d = Integer.parseInt(date.substring(3, 5));
			m = Integer.parseInt(date.substring(0, 2));
			y = Integer.parseInt(date.substring(6, 8));
			day = getDayofWeek(m, d, y);
			result = Dias[day];
		}
		if (format == "DD/MM/AA") {
			m = Integer.parseInt(date.substring(3, 5));
			d = Integer.parseInt(date.substring(0, 2));
			y = Integer.parseInt(date.substring(6, 8));
			day = getDayofWeek(m, d, y);
			result = Dias[day];
		}
		if (format == "MM/DD/YY") {
			d = Integer.parseInt(date.substring(3, 5));
			m = Integer.parseInt(date.substring(0, 2));
			y = Integer.parseInt(date.substring(6, 8));
			day = getDayofWeek(m, d, y);
			result = Days[day];
		}
		if (format == "DD/MM/YY") {
			m = Integer.parseInt(date.substring(3, 5));
			d = Integer.parseInt(date.substring(0, 2));
			y = Integer.parseInt(date.substring(6, 8));
			day = getDayofWeek(m, d, y);
			result = Days[day];
		}
		return result;
	}

	public static String getMonthSpell(String mm, String LNG) {
		String Meses[] = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
		String Months[] = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
		String result = "";
		int m = Integer.parseInt(mm);

		if (LNG.equals("e/")) {
			result = Months[m - 1];
		}
		else {
			result = Meses[m - 1];
		}

		return result;
	}

	public static boolean compareYYMMDD(String YY, String DD, String MM, String AYY, String ADD, String AMM) {

		boolean rerror = false;

		int VYY = Integer.parseInt(YY);
		int VMM = Integer.parseInt(MM);
		int VDD = Integer.parseInt(DD);

		int CYY = Integer.parseInt(AYY);
		int CMM = Integer.parseInt(AMM);
		int CDD = Integer.parseInt(ADD);

		if (CYY > VYY) {
			rerror = true;
		}
		if (CMM > VMM && (CYY > VYY || CYY == VYY)) {
			rerror = true;
		}
		if (CDD > VDD && (CMM > VMM || CMM == VMM) && (CYY > VYY || CYY == VYY)) {
			rerror = true;
		}

		if (VDD == CDD && VMM == CMM && CYY == VYY) {
			rerror = false;
		}

		return (rerror);
	}

	public static String getYYYY() {
		Calendar calendar = Calendar.getInstance();
		String year = "" + calendar.get(Calendar.YEAR);
		return (year);
	}

	public static String getTDATE() {
		String TDATE = String.valueOf(Integer.parseInt(getYYYY()) * 10000 + Integer.parseInt(getMM()) * 100 + Integer.parseInt(getDD()));
		return TDATE;
	}

	public static String getKEYVAL(int KEYVAL) {

		String RTNVAL = "";

		switch (KEYVAL) {
			case 1 :
				RTNVAL = "A";
				break;
			case 2 :
				RTNVAL = "B";
				break;
			case 3 :
				RTNVAL = "C";
				break;
			case 4 :
				RTNVAL = "D";
				break;
			case 5 :
				RTNVAL = "E";
				break;
			case 6 :
				RTNVAL = "F";
				break;
			case 7 :
				RTNVAL = "G";
				break;
			case 8 :
				RTNVAL = "H";
				break;
			case 9 :
				RTNVAL = "I";
				break;
			case 10 :
				RTNVAL = "J";
				break;
			case 11 :
				RTNVAL = "K";
				break;
			case 12 :
				RTNVAL = "L";
				break;
			case 13 :
				RTNVAL = "M";
				break;
			case 14 :
				RTNVAL = "N";
				break;
			case 15 :
				RTNVAL = "O";
				break;
			case 16 :
				RTNVAL = "P";
				break;
			case 17 :
				RTNVAL = "Q";
				break;
			case 18 :
				RTNVAL = "R";
				break;
			case 19 :
				RTNVAL = "S";
				break;
			case 20 :
				RTNVAL = "T";
				break;
			case 21 :
				RTNVAL = "U";
				break;
			case 22 :
				RTNVAL = "V";
				break;
			case 23 :
				RTNVAL = "W";
				break;
			case 24 :
				RTNVAL = "X";
				break;
			case 25 :
				RTNVAL = "Y";
				break;
			case 26 :
				RTNVAL = "Z";
				break;
			case 27 :
				RTNVAL = "1";
				break;
			case 28 :
				RTNVAL = "2";
				break;
			case 29 :
				RTNVAL = "3";
				break;
			case 30 :
				RTNVAL = "4";
				break;
			case 31 :
				RTNVAL = "5";
				break;
			case 32 :
				RTNVAL = "6";
				break;
			case 33 :
				RTNVAL = "7";
				break;
			case 34 :
				RTNVAL = "8";
				break;
			case 35 :
				RTNVAL = "9";
				break;
		}

		return (RTNVAL);
	}

	public static String getLetterVal(int KEYVAL) {

		String RTNVAL = "";

		switch (KEYVAL) {
			case 1 :
				RTNVAL = "A";
				break;
			case 2 :
				RTNVAL = "B";
				break;
			case 3 :
				RTNVAL = "C";
				break;
			case 4 :
				RTNVAL = "D";
				break;
			case 5 :
				RTNVAL = "E";
				break;
			case 6 :
				RTNVAL = "F";
				break;
			case 7 :
				RTNVAL = "G";
				break;
			case 8 :
				RTNVAL = "H";
				break;
			case 9 :
				RTNVAL = "J";
				break;
			case 10 :
				RTNVAL = "K";
				break;
		}

		return (RTNVAL);
	}

	public static String getKEY1() {
		Letter1 = "";
		Number1 = "";
		generator = new Random();
		int num = generator.nextInt(9) + 1; // random letter A-B-C-D-E-F-G-H-J-K
		Letter1 = getLetterVal(num);
		num = generator.nextInt(4) + 1; // random number 1-5
		Number1 = String.valueOf(num);

		return Letter1 + Number1;
	}

	public static String getKEY2() {
		Letter2 = "";
		Number2 = "";
		generator = new Random();
		int num = 0;
		num = generator.nextInt(9) + 1; // random letter A-B-C-D-E-F-G-H-J-K
		Letter2 = getLetterVal(num);
		while (Letter2.equals(Letter1)) {
			num = generator.nextInt(9) + 1; // random letter A-B-C-D-E-F-G-H-J-K
			Letter2 = getLetterVal(num);
		}
		num = generator.nextInt(4) + 1; // random number 1-5
		Number2 = String.valueOf(num);
		while (Number2.equals(Number1)) {
			num = generator.nextInt(4) + 1; // random number 1-5
			Number2 = String.valueOf(num);
		}
		return Letter2 + Number2;
	}
	
	public static String getKEY3() {
		Letter3 = "";
		Number3 = "";
		generator = new Random();
		int num = 0;
		num = generator.nextInt(9) + 1; // random letter A-B-C-D-E-F-G-H-J-K
		Letter3 = getLetterVal(num);
		while (Letter3.equals(Letter2) || Letter3.equals(Letter1)) {
			num = generator.nextInt(9) + 1; // random letter A-B-C-D-E-F-G-H-J-K
			Letter3 = getLetterVal(num);
		}
		num = generator.nextInt(4) + 1; // random number 1-5
		Number3 = String.valueOf(num);
		while (Number3.equals(Number2) || Number3.equals(Number1)) {
			num = generator.nextInt(4) + 1; // random number 1-5
			Number3 = String.valueOf(num);
		}
		return Letter3 + Number3;
	}

	public static String getRandom(int NCHAR) {
		String PASSWORD = "";
		String PASVAL = "";

		for (int i = 0; i < NCHAR; i++) {
			Random generator = new Random();
			int NUM = generator.nextInt(34) + 1; // random number for letter(A-Z) and numbers(1-9)
			PASVAL = getKEYVAL(NUM); // getting the letter or number for that random number

			while (PASSWORD.indexOf(PASVAL) != -1) {
				NUM = generator.nextInt(34) + 1;
				PASVAL = getKEYVAL(NUM); // getting the letter or number for that random number
			}

			PASSWORD = PASSWORD + PASVAL;
		}

		return PASSWORD;
	}

	public static int getRandom() {

		int NUM = generator.nextInt(9) + 1;

		return NUM;
	}

	public static String getVKeyTop() {
		String TABLE = "";
		String IMG0 = "Img_";
		String LTR0 = "Teclado Virtual - Numero ";
		String IMG1 = "Img_";
		String LTR1 = "Teclado Virtual - Numero ";
		String IMG2 = "Img_";
		String LTR2 = "Teclado Virtual - Numero ";
		String IMG3 = "Img_";
		String LTR3 = "Teclado Virtual - Numero ";
		String IMG4 = "Img_";
		String LTR4 = "Teclado Virtual - Numero ";
		String IMG5 = "Img_";
		String LTR5 = "Teclado Virtual - Numero ";
		String IMG6 = "Img_";
		String LTR6 = "Teclado Virtual - Numero ";
		String IMG7 = "Img_";
		String LTR7 = "Teclado Virtual - Numero ";
		String IMG8 = "Img_";
		String LTR8 = "Teclado Virtual - Numero ";
		String IMG9 = "Img_";
		String LTR9 = "Teclado Virtual - Numero ";

		int NUM0 = 0;
		int NUM1 = 0;
		int NUM2 = 0;
		int NUM3 = 0;
		int NUM4 = 0;
		int NUM5 = 0;
		int NUM6 = 0;
		int NUM7 = 0;
		int NUM8 = 0;
		int NUM9 = 0;

		int FNUM = getRandom();

		int x = 0;

		while (FNUM < 10 && x < 10) {
			switch (x) {
				case 0 :
					IMG0 = IMG0 + FNUM;
					LTR0 = LTR0 + FNUM;
					NUM0 = FNUM;
					break;
				case 1 :
					IMG1 = IMG1 + FNUM;
					LTR1 = LTR1 + FNUM;
					NUM1 = FNUM;
					break;
				case 2 :
					IMG2 = IMG2 + FNUM;
					LTR2 = LTR2 + FNUM;
					NUM2 = FNUM;
					break;
				case 3 :
					IMG3 = IMG3 + FNUM;
					LTR3 = LTR3 + FNUM;
					NUM3 = FNUM;
					break;
				case 4 :
					IMG4 = IMG4 + FNUM;
					LTR4 = LTR4 + FNUM;
					NUM4 = FNUM;
					break;
				case 5 :
					IMG5 = IMG5 + FNUM;
					LTR5 = LTR5 + FNUM;
					NUM5 = FNUM;
					break;
				case 6 :
					IMG6 = IMG6 + FNUM;
					LTR6 = LTR6 + FNUM;
					NUM6 = FNUM;
					break;
				case 7 :
					IMG7 = IMG7 + FNUM;
					LTR7 = LTR7 + FNUM;
					NUM7 = FNUM;
					break;
				case 8 :
					IMG8 = IMG8 + FNUM;
					LTR8 = LTR8 + FNUM;
					NUM8 = FNUM;
					break;
				case 9 :
					IMG9 = IMG9 + FNUM;
					LTR9 = LTR9 + FNUM;
					NUM9 = FNUM;
					break;
			}

			FNUM++;
			x++;

		}

		FNUM = 0;

		while (FNUM < 10 && x < 10) {
			switch (x) {
				case 0 :
					IMG0 = IMG0 + FNUM;
					LTR0 = LTR0 + FNUM;
					NUM0 = FNUM;
					break;
				case 1 :
					IMG1 = IMG1 + FNUM;
					LTR1 = LTR1 + FNUM;
					NUM1 = FNUM;
					break;
				case 2 :
					IMG2 = IMG2 + FNUM;
					LTR2 = LTR2 + FNUM;
					NUM2 = FNUM;
					break;
				case 3 :
					IMG3 = IMG3 + FNUM;
					LTR3 = LTR3 + FNUM;
					NUM3 = FNUM;
					break;
				case 4 :
					IMG4 = IMG4 + FNUM;
					LTR4 = LTR4 + FNUM;
					NUM4 = FNUM;
					break;
				case 5 :
					IMG5 = IMG5 + FNUM;
					LTR5 = LTR5 + FNUM;
					NUM5 = FNUM;
					break;
				case 6 :
					IMG6 = IMG6 + FNUM;
					LTR6 = LTR6 + FNUM;
					NUM6 = FNUM;
					break;
				case 7 :
					IMG7 = IMG7 + FNUM;
					LTR7 = LTR7 + FNUM;
					NUM7 = FNUM;
					break;
				case 8 :
					IMG8 = IMG8 + FNUM;
					LTR8 = LTR8 + FNUM;
					NUM8 = FNUM;
					break;
				case 9 :
					IMG9 = IMG9 + FNUM;
					LTR9 = LTR9 + FNUM;
					NUM9 = FNUM;
					break;
			}

			FNUM++;
			x++;

		}

		TABLE = "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";

		//Primera Fila
		TABLE += "<TR>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG0
			+ "\" src=\"../images/"
			+ IMG0
			+ ".gif\"  border=\"0\" title=\""
			+ LTR0
			+ "\" title=\""
			+ LTR0
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM0
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG1
			+ "\" src=\"../images/"
			+ IMG1
			+ ".gif\"  border=\"0\" title=\""
			+ LTR1
			+ "\" title=\""
			+ LTR1
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM1
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG2
			+ "\" src=\"../images/"
			+ IMG2
			+ ".gif\"  border=\"0\" title=\""
			+ LTR2
			+ "\" title=\""
			+ LTR2
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM2
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG3
			+ "\" src=\"../images/"
			+ IMG3
			+ ".gif\"  border=\"0\" title=\""
			+ LTR3
			+ "\" title=\""
			+ LTR3
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM3
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG4
			+ "\" src=\"../images/"
			+ IMG4
			+ ".gif\"  border=\"0\" title=\""
			+ LTR4
			+ "\" title=\""
			+ LTR4
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM4
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG5
			+ "\" src=\"../images/"
			+ IMG5
			+ ".gif\"  border=\"0\" title=\""
			+ LTR5
			+ "\" title=\""
			+ LTR5
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM5
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG6
			+ "\" src=\"../images/"
			+ IMG6
			+ ".gif\"  border=\"0\" title=\""
			+ LTR6
			+ "\" title=\""
			+ LTR6
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM6
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG7
			+ "\" src=\"../images/"
			+ IMG7
			+ ".gif\"  border=\"0\" title=\""
			+ LTR7
			+ "\" title=\""
			+ LTR7
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM7
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG8
			+ "\" src=\"../images/"
			+ IMG8
			+ ".gif\"  border=\"0\" title=\""
			+ LTR8
			+ "\" title=\""
			+ LTR8
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM8
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG9
			+ "\" src=\"../images/"
			+ IMG9
			+ ".gif\"  border=\"0\" title=\""
			+ LTR9
			+ "\" title=\""
			+ LTR9
			+ "\" onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM9
			+ "');\" class=\"botonesEnvio\"></td>";
		TABLE += "</TR>";

		TABLE += "</TABLE>";
		return TABLE;
	}

	public static String getTable1() {

		getVKeyTop();

		TABLE = "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";

		//Primera Fila
		TABLE += "<TR>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG0
			+ "\" src=\"../images/"
			+ IMG0
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM0
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG1
			+ "\" src=\"../images/"
			+ IMG1
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM1
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG2
			+ "\" src=\"../images/"
			+ IMG2
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM2
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG3
			+ "\" src=\"../images/"
			+ IMG3
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM3
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG4
			+ "\" src=\"../images/"
			+ IMG4
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM4
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG5
			+ "\" src=\"../images/"
			+ IMG5
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM5
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG6
			+ "\" src=\"../images/"
			+ IMG6
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM6
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG7
			+ "\" src=\"../images/"
			+ IMG7
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM7
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG8
			+ "\" src=\"../images/"
			+ IMG8
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM8
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG9
			+ "\" src=\"../images/"
			+ IMG9
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM9
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "</TR>";

		TABLE += "</TABLE>";
		return TABLE;
	}

	public static String getTable2() {

		IMG0 = "Img_a";
		IMG1 = "Img_a";
		IMG2 = "Img_a";
		IMG3 = "Img_a";
		IMG4 = "Img_a";
		IMG5 = "Img_a";
		IMG6 = "Img_a";
		IMG7 = "Img_a";
		IMG8 = "Img_a";
		IMG9 = "Img_a";

		TABLE = "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";

		//Primera Fila
		TABLE += "<TR>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG0
			+ "\" src=\"../images/"
			+ IMG0
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM0
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG1
			+ "\" src=\"../images/"
			+ IMG1
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM1
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG2
			+ "\" src=\"../images/"
			+ IMG2
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM2
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG3
			+ "\" src=\"../images/"
			+ IMG3
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM3
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG4
			+ "\" src=\"../images/"
			+ IMG4
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM4
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG5
			+ "\" src=\"../images/"
			+ IMG5
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM5
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG6
			+ "\" src=\"../images/"
			+ IMG6
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM6
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG7
			+ "\" src=\"../images/"
			+ IMG7
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM7
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG8
			+ "\" src=\"../images/"
			+ IMG8
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM8
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "<td valign=\"top\"><img name=\""
			+ IMG9
			+ "\" src=\"../images/"
			+ IMG9
			+ ".gif\"  border=\"0\" "
			+ " onMouseUp=\"JavaScript:anadirLetra ('"
			+ NUM9
			+ "');\" onMouseOver=\"JavaScript:SHOWA ();\" onmouseout=\"JavaScript:SHOWN ();\""
			+ " class=\"botonesEnvio\"></td>";
		TABLE += "</TR>";

		TABLE += "</TABLE>";
		return TABLE;
	}

	public static int getLETRAS(String PASSSWORD) {
		int letras = 0;
		for (int x = 0; x < PASSSWORD.length(); x++) {
			char nx = PASSSWORD.charAt(x);
			if (nx > 64 && nx < 91) {
				letras++;
			}
		}
		return letras;
	}

	public static int getREPETIDOS(String PASSSWORD) {
		int repetidos = 0;
		char nx0 = 33;
		char nx1 = 34;
		char nx2 = 35;
		char nx3 = 36;
		char nx4 = 37;
		char nx5 = 38;
		char nx6 = 39;
		char nx7 = 40;
		char nx8 = 41;
		char nx9 = 42;

		for (int x = 0; x < PASSSWORD.length(); x++) {
			switch (x) {
				case 0 :
					nx0 = PASSSWORD.charAt(x);
					break;
				case 1 :
					nx1 = PASSSWORD.charAt(x);
					break;
				case 2 :
					nx2 = PASSSWORD.charAt(x);
					break;
				case 3 :
					nx3 = PASSSWORD.charAt(x);
					break;
				case 4 :
					nx4 = PASSSWORD.charAt(x);
					break;
				case 5 :
					nx5 = PASSSWORD.charAt(x);
					break;
				case 6 :
					nx6 = PASSSWORD.charAt(x);
					break;
				case 7 :
					nx7 = PASSSWORD.charAt(x);
					break;
				case 8 :
					nx8 = PASSSWORD.charAt(x);
					break;
				case 9 :
					nx9 = PASSSWORD.charAt(x);
					break;
			}
		}

		if (nx0 == nx1 || nx0 == nx2 || nx0 == nx3 || nx0 == nx4 || nx0 == nx5 || nx0 == nx6 || nx0 == nx7 || nx0 == nx8 || nx0 == nx9) {
			repetidos++;
		}
		if (nx1 == nx2 || nx1 == nx3 || nx1 == nx4 || nx1 == nx5 || nx1 == nx6 || nx1 == nx7 || nx1 == nx8 || nx1 == nx9) {
			repetidos++;
		}
		if (nx2 == nx3 || nx2 == nx4 || nx2 == nx5 || nx2 == nx6 || nx2 == nx7 || nx2 == nx8 || nx2 == nx9) {
			repetidos++;
		}
		if (nx3 == nx4 || nx3 == nx5 || nx3 == nx6 || nx3 == nx7 || nx3 == nx8 || nx3 == nx9) {
			repetidos++;
		}
		if (nx4 == nx5 || nx4 == nx6 || nx4 == nx7 || nx4 == nx8 || nx4 == nx9) {
			repetidos++;
		}
		if (nx5 == nx6 || nx5 == nx7 || nx5 == nx8 || nx5 == nx9) {
			repetidos++;
		}
		if (nx6 == nx7 || nx6 == nx8 || nx6 == nx9) {
			repetidos++;
		}
		if (nx7 == nx8 || nx7 == nx9) {
			repetidos++;
		}
		if (nx8 == nx9) {
			repetidos++;
		}
		return repetidos;
	}
}