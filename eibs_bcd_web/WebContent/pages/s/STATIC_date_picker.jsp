<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="java.util.Locale, java.text.DateFormatSymbols"%>

<HTML>
<HEAD>
<TITLE>Selección de Fecha</TITLE>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></script>


<STYLE TYPE='text/css'>
INPUT {
	width: 90%;
}

INPUT:hover {
	width: 90%;
	background: #0066cc;
    text-shadow: 0 1px 0 #38678f;
    color: white;
}
</STYLE>

</HEAD>

<%
	int FROMYEAR = 1900;
	int TOYEAR = 2199; 
%>

<BODY onload="init();">
<FORM NAME='CalendarForm'>
<TABLE BORDER='1' CELLSPACING='0' CELLPADDING='0' WIDTH='100%' HEIGHT='100%'>
	<TR>
		<TD>
			<INPUT name='previous' id='previous'
				onclick='gotoPreviousMonth()' HEIGHT='24' WIDTH='30' type='button'
				value='&lt;'>
		</TD>
		<TD align="center" colspan='3'>
			<SELECT name=s1 id=s1 onchange='gotoSelectedMonth()'>
<%
			String lang = "s".equalsIgnoreCase(currUser.getE01LAN()) ? "es" : "en";
			String month = "";
			Locale locale = new Locale(lang);
			DateFormatSymbols datefmt = new DateFormatSymbols(locale);
			for (int m = 0; m < 12; m++) {	
				 month = datefmt.getMonths()[m];
%>			
				<OPTION><%= month %></OPTION>
<%
			} 
%>			
			</SELECT>
		</TD>
		<TD align="center"  colspan='2'>
			<SELECT name=s2 id=s2 onchange='gotoSelectedYear()'>
<%
			for (int i=FROMYEAR; i<TOYEAR+1; i++) { 
%>			
      
        		<OPTION><%= i %></OPTION>
<% 
			}
%>      
			</SELECT>
		</TD>
		<TD>
			<INPUT name='next' id='next' onclick='gotoNextMonth()' HEIGHT='24' WIDTH='30' type=button value='&gt;'>
		</TD>
	</TR>
	<TR align=center bgColor=#0066cc borderColor=ivory>
<%
		String days = ""; 
		for (int d = 1; d < 8; d++) {	
			 days = datefmt.getWeekdays()[d];
%>	
			<TD WIDTH='30' ALIGN='CENTER'><font color=#ffffff><%= days.substring(0, 3).toUpperCase(locale).trim() %></font></TD>
<% 
		}	 
%>		
	</TR>
	<TR align=center >
		<TD align=center ><INPUT WIDTH='30' name=b1 id=b1
			onclick=updateParentWindowDateElement(1) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b2 id=b2
			onclick=updateParentWindowDateElement(2) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b3 id=b3
			onclick=updateParentWindowDateElement(3) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b4 id=b4
			onclick=updateParentWindowDateElement(4) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b5 id=b5
			onclick=updateParentWindowDateElement(5) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b6 id=b6
			onclick=updateParentWindowDateElement(6) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b7 id=b7
			onclick=updateParentWindowDateElement(7) type=button></TD>
	</TR>
	<TR align=center >
		<TD align=center ><INPUT WIDTH='30' name=b8 id=b8
			onclick=updateParentWindowDateElement(8) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b9 id=b9
			onclick=updateParentWindowDateElement(9) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b10 id=b10
			onclick=updateParentWindowDateElement(10) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b11 id=b11
			onclick=updateParentWindowDateElement(11) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b12 id=b12
			onclick=updateParentWindowDateElement(12) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b13 id=b13
			onclick=updateParentWindowDateElement(13) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b14 id=b14
			onclick=updateParentWindowDateElement(14) type=button></TD>
	</TR>
	<TR align=center >
		<TD align=center ><INPUT WIDTH='30' name=b15 id=b15
			onclick=updateParentWindowDateElement(15) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b16 id=b16
			onclick=updateParentWindowDateElement(16) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b17 id=b17
			onclick=updateParentWindowDateElement(17) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b18 id=b18
			onclick=updateParentWindowDateElement(18) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b19 id=b19
			onclick=updateParentWindowDateElement(19) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b20 id=b20
			onclick=updateParentWindowDateElement(20) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b21 id=b21
			onclick=updateParentWindowDateElement(21) type=button></TD>
	</TR>
	<TR align=center >
		<TD align=center ><INPUT WIDTH='30' name=b22 id=b22
			onclick=updateParentWindowDateElement(22) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b23 id=b23
			onclick=updateParentWindowDateElement(23) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b24 id=b24
			onclick=updateParentWindowDateElement(24) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b25 id=b25
			onclick=updateParentWindowDateElement(25) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b26 id=b26
			onclick=updateParentWindowDateElement(26) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b27 id=b27
			onclick=updateParentWindowDateElement(27) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b28 id=b28
			onclick=updateParentWindowDateElement(28) type=button></TD>
	</TR>
	<TR align=center >
		<TD align=center ><INPUT WIDTH='30' name=b29 id=b29
			onclick=updateParentWindowDateElement(29) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b30 id=b30
			onclick=updateParentWindowDateElement(30) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b31 id=b31
			onclick=updateParentWindowDateElement(31) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b32 id=b32
			onclick=updateParentWindowDateElement(32) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b33 id=b33
			onclick=updateParentWindowDateElement(33) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b34 id=b34
			onclick=updateParentWindowDateElement(34) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b35 id=b35
			onclick=updateParentWindowDateElement(35) type=button></TD>
	</TR>
	<TR align=center >
		<TD align=center ><INPUT WIDTH='30' name=b36 id=b36
			onclick=updateParentWindowDateElement(36) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b37 id=b37
			onclick=updateParentWindowDateElement(37) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b38 id=b38
			onclick=updateParentWindowDateElement(38) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b39 id=b39
			onclick=updateParentWindowDateElement(39) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b40 id=b40
			onclick=updateParentWindowDateElement(40) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b41 id=b41
			onclick=updateParentWindowDateElement(41) type=button></TD>
		<TD align=center ><INPUT WIDTH='30' name=b42 id=b42
			onclick=updateParentWindowDateElement(42) type=button></TD>
	</TR>
</TABLE>

<SCRIPT language=JavaScript>

var currentDate = new Date(String('<%= currUser.getE01RDY() %>'),
							String('<%= Integer.valueOf(currUser.getE01RDM()).intValue() - 1%>'),
							String('<%= currUser.getE01RDD() %>'));
var userMonth, userDay, userYear;
var STARTYEAR = <%= FROMYEAR %>;
var ENDYEAR = <%= TOYEAR %>;

function padZeroIfSingleDigit(str) {
	return (str.toString().length == 1) ? '0' + str.toString() : str;
}

function getDaysInMonth(month, year) {
    return new Date(year, month + 1, 0).getDate();
}

function updateParentWindowDateElement(k) {
	var month;
  	var day;
  	var year;
  	if (document.all) {
    	id = document.all("b"+k);
    	if (id.style.color == "white") {
      		if (k < 8) {
        		if (document.all.s1.selectedIndex == 0) {
					month = "12";
					day = padZeroIfSingleDigit(id.value);
					year = ((document.all.s2.selectedIndex == 0) ? "" + ENDYEAR : document.all.s2.selectedIndex + STARTYEAR - 1);
        		} else {
					month = padZeroIfSingleDigit(document.all.s1.selectedIndex);
					day = padZeroIfSingleDigit(id.value);
					year = (document.all.s2.selectedIndex + STARTYEAR);
	 			}
        		enter(month, day, year);
        		return;
      		} else {
        		if (document.all.s1.selectedIndex == 11) {
					month = "01";
					day = padZeroIfSingleDigit(id.value);
					year = ((document.all.s2.selectedIndex == 119) ? "" + STARTYEAR : document.all.s2.selectedIndex + STARTYEAR + 1);
	 			} else {
					month = padZeroIfSingleDigit(document.all.s1.selectedIndex + 2);
					day = padZeroIfSingleDigit(id.value);
					year = (document.all.s2.selectedIndex + STARTYEAR);
	 			}
        		enter(month, day, year);
        		return;
      		}
    	} else {
      		month = padZeroIfSingleDigit(document.all.s1.selectedIndex + 1);
      		day = padZeroIfSingleDigit(id.value);
      		year = (document.all.s2.selectedIndex + STARTYEAR);
  			enter(month, day, year);
    	}
  	} else {
    	id = document.CalendarForm.elements["b"+k];
    	if (id.value == "") return;
    	month = padZeroIfSingleDigit(document.CalendarForm.s1.selectedIndex + 1);
    	day = padZeroIfSingleDigit(id.value);
    	year = (document.CalendarForm.s2.selectedIndex + STARTYEAR);
  		enter(month, day, year);
  	}
}

function getCurrentFullYear() {
	return currentDate.getFullYear();
}

function gotoSelectedMonth() {
	var currentFullYear = getCurrentFullYear();
  	var currentDateDay = currentDate.getDate();
  	if (currentDateDay > getDaysInSelectedMonth()) currentDateDay = getDaysInSelectedMonth();
  	if (document.all) {
    	currentDate = new Date(currentFullYear, document.all.s1.selectedIndex, currentDateDay);
  	} else {
    	currentDate = new Date(currentFullYear, document.CalendarForm.s1.selectedIndex, currentDateDay);
  	}
  	showCalendarUltra();
}

function gotoSelectedYear() {
	var currentDateDay = currentDate.getDate();
  	if (currentDateDay > getDaysInSelectedYearMonth()) currentDateDay = getDaysInSelectedYearMonth();
  	if (document.all) {
    	currentDate = new Date(document.all.s2.selectedIndex+STARTYEAR, currentDate.getMonth(), currentDateDay);
  	} else {
    	currentDate = new Date(document.CalendarForm.s2.selectedIndex+STARTYEAR, currentDate.getMonth(), currentDateDay);
  	}
  	showCalendarUltra();
}

function gotoPreviousMonth() {
	var currentFullYear = getCurrentFullYear();
  	var currentDateDay = currentDate.getDate();
  	
  	if (currentDateDay > getDaysInPreviousMonth()) currentDateDay = getDaysInPreviousMonth();
  	if (currentDate.getMonth() == 0) {
    	currentFullYear = (currentFullYear == STARTYEAR) ? ENDYEAR : currentFullYear - 1;
    	currentDate = new Date(currentFullYear, 11, currentDateDay);
  	} else {
    	currentDate = new Date(currentFullYear, currentDate.getMonth() - 1, currentDateDay);
  	}
  	showCalendarUltra();
}

function gotoNextMonth() {
  	var currentFullYear = getCurrentFullYear();
  	var currentDateDay = currentDate.getDate();
  	if (currentDateDay>getDaysInNextMonth()) currentDateDay = getDaysInNextMonth();
  	if (currentDate.getMonth() == 11) {
    	currentFullYear = (currentFullYear == ENDYEAR) ? STARTYEAR : currentFullYear + 1;
    	currentDate = new Date(currentFullYear, 0, currentDateDay);
  	} else {
    	currentDate = new Date(currentFullYear, currentDate.getMonth() + 1, currentDateDay);
  	}
  	showCalendarUltra();
}

function getDaysInPreviousMonth() {
	var currentFullYear = getCurrentFullYear();
  	if (currentDate.getMonth() == 0) {
    	currentFullYear = (currentFullYear == STARTYEAR) ? ENDYEAR : currentFullYear = currentFullYear - 1;
    	return getDaysInMonth(11, currentFullYear);
  	} else {
    	return getDaysInMonth(currentDate.getMonth() - 1, currentFullYear);
  	}
}

function getDaysInNextMonth() {
	var currentFullYear = getCurrentFullYear();
  	if (currentDate.getMonth() == 11) {
    	currentFullYear = (currentFullYear == ENDYEAR) ? STARTYEAR : currentFullYear = currentFullYear + 1;
    	return getDaysInMonth(0, currentFullYear);
  	} else {
    	return getDaysInMonth(currentDate.getMonth() + 1, currentFullYear);
  	}
}

function getDaysInSelectedMonth() {
	var currentFullYear = getCurrentFullYear();
  	var currentMonth;
  	if (document.all) {
    	currentMonth = document.all.s1.selectedIndex;
  	} else {
   		currentMonth = document.CalendarForm.s1.selectedIndex;
  	}
  	return getDaysInMonth(currentMonth, currentFullYear);
}

function getDaysInSelectedYearMonth() {
  	var currentFullYear;
  	var currentMonth;
  	if (document.all) {
    	currentMonth = document.all.s1.selectedIndex;
    	currentFullYear = document.all.s2.selectedIndex + STARTYEAR;
  	} else {
    	currentMonth = document.CalendarForm.s1.selectedIndex;
    	currentFullYear = document.CalendarForm.s2.selectedIndex + STARTYEAR;
  	}
  	return getDaysInMonth(currentMonth, currentFullYear);
}

function showCalendarUltra() {
	var currentFullYear = getCurrentFullYear();
  	
  	if (document.all) {
    	document.all.s2.selectedIndex = currentFullYear - STARTYEAR;
    	document.all.s1.selectedIndex = currentDate.getMonth();
  	} else {
    	document.CalendarForm.s2.selectedIndex = currentFullYear - STARTYEAR;
    	document.CalendarForm.s1.selectedIndex = currentDate.getMonth();
  	}
  
  	var currentDateDaysInMonth = getDaysInMonth(currentDate.getMonth(), currentFullYear);
  	var daysInPreviousMonth = getDaysInPreviousMonth();
  	var firstDayDate = new Date(currentFullYear, currentDate.getMonth(), 1);
  	var firstDay = firstDayDate.getDay();
  
  	for (var x=1; x<=firstDay; x++) {
    	var id;
    	if (document.all) {
      		id = document.all("b"+x);
      		id.style.backgroundColor = "#C0C0C0";
      		id.style.color = "white";
      		id.value = daysInPreviousMonth - firstDay + x;
    	} else {
      		id = document.CalendarForm.elements["b"+x];
      		id.value = "";
    	}
  	}
  	
  	var currentDateDay = currentDate.getDate();
  	
  	for (var x=1; x<=currentDateDaysInMonth; x++) {
    	var id;
    	if (document.all) {
      		id = document.all("b"+(x+firstDay));
      		if (currentDateDay == x) {
        		id.style.backgroundColor = "#0066CC";
        		id.style.color = "black";
      		} else {
        		id.style.backgroundColor = "#C0C0C0";
        		id.style.color = "black";
      		}
    	} else {
      		id = document.CalendarForm.elements["b"+(x+firstDay)];
    	}
    	id.value = x;
  	}
  	
  	var counter = 1;
  	for (var x=currentDateDaysInMonth+1; x<=42-firstDay; x++) {
    	var id;
    	if (document.all) {
      		id = document.all("b"+(x+firstDay));
      		id.style.backgroundColor = "#C0C0C0";
      		id.style.color = "white";
      		id.value = counter;
      		counter++;
    	} else {
      		id = document.CalendarForm.elements["b"+(x+firstDay)];
      		id.value = "";
    	}
  	}
}

function enter(month, day, year) {
	var obj = top.opener.fieldDate1;
	if (top.opener.fieldAux1) {  // DatePicker
    	var auxYear = year + "";
<%
		if ("MDY".equals(currUser.getE01DTF())) {
%>
   			top.opener.fieldDate1.value = month;
   			top.opener.fieldDate2.value = day;
   			top.opener.fieldDate3.value = auxYear;
<%
		} else if ("DMY".equals(currUser.getE01DTF())) {
%>
   			top.opener.fieldDate2.value = month;
   			top.opener.fieldDate1.value = day;
   			top.opener.fieldDate3.value = auxYear;
<%
		} else {
%>
   			top.opener.fieldDate2.value = month;
   			top.opener.fieldDate3.value = day;
   			top.opener.fieldDate1.value = auxYear;
<%		}
%>
   	} else {	// DOBPicker
   		top.opener.fieldDate1.value = month;
   		top.opener.fieldDate2.value = day;
   		top.opener.fieldDate3.value = year;
   	}
    
    triggerOnchangeOpener(top.opener.fieldDate1.name);
    triggerOnchangeOpener(top.opener.fieldDate2.name);
    triggerOnchangeOpener(top.opener.fieldDate3.name);
    
   	top.close();
}

function isValidDate() {
	var validUserDate = true;
    if (top.opener.fieldAux1 == true) {  // DatePicker
    	// Logic for Date
<%
		if ("MDY".equals(currUser.getE01DTF())) {
%>
    		userMonth = top.opener.fieldDate1.value;
    		userDay = top.opener.fieldDate2.value;
    		userYear = top.opener.fieldDate3.value;
    		userYear = padZeroIfSingleDigit(userYear);
<%
		} else if ("DMY".equals(currUser.getE01DTF())) {
%>
    		userMonth = top.opener.fieldDate2.value;
    		userDay = top.opener.fieldDate1.value;
    		userYear = top.opener.fieldDate3.value;
    		userYear = padZeroIfSingleDigit(userYear);
<%
		} else {
%>
    		userMonth = top.opener.fieldDate2.value;
    		userDay = top.opener.fieldDate3.value;
    		userYear = top.opener.fieldDate1.value;
    		userYear = padZeroIfSingleDigit(userYear);
<%		
		}
%>
	} else { // DOBPicker
    	userMonth = top.opener.fieldDate1.value;
    	userDay = top.opener.fieldDate2.value;
    	userYear = top.opener.fieldDate3.value;
    	userYear = padZeroIfSingleDigit(userYear);
    }
    
    if ((userYear.toString().length == 2)) {
    	//This function must be updated....
    	userYear = (userYear < 51) ? "20" + userYear : "19" + userYear;
    }
    
    if (isNaN(userMonth) || isNaN(userDay) || isNaN(userYear)) {
      	validUserDate = false;
    } else if (userMonth == '' || userYear == '' || userDay == '') {
      	validUserDate = false;
    } else if ((userMonth < 1 || userMonth > 12) || (userYear < STARTYEAR) || (userYear > ENDYEAR)) {
      	validUserDate = false;
    } else {
      	userDate = new Date(userYear, userMonth);
      	dpDay = getDaysInMonth(userMonth - 1, userYear);
      	if (userDay > dpDay || userDay < 0) {
        	validUserDate = false;
      	}
    }
    return validUserDate;
}

function init() {
	if (isValidDate()) { //valid user date, update currentDate
    	currentDate = new Date(userYear, userMonth-1, userDay);
  	}
  	showCalendarUltra();
}

</SCRIPT>

</FORM>
</BODY>
</HTML>