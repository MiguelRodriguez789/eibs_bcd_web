package datapro.eibs.beans;

import java.lang.reflect.Field;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.lang.math.NumberUtils;

import datapro.eibs.sockets.MessageRecord;

public class LoanPayPlanBean {

	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	String h01FLGWK1 = "" ;
	String e01DEARDM = "" ;
	String e01DEARDD = "" ;
	String e01DEARDY = "" ;
	String e01DLCPM1 = "" ;
	String e01DLCPD1 = "" ;
	String e01DLCPY1 = "" ;
	String e01DLCGM1 = "" ;
	String e01DLCGD1 = "" ;
	String e01DLCGY1 = "" ;
	String e01DLCXM1 = "" ;
	String e01DLCXD1 = "" ;
	String e01DLCXY1 = "" ;
	String e01DLCMN1 = "" ;
	String e01DLCMN2 = "" ;
	String e01DLCMN3 = "" ;
	String e01DEAHEM = "" ;
	String e01DEAHED = "" ;
	String e01DEAHEY = "" ;
	String e01FLGFPG = "" ;
	String e01DEAIPD = "" ;
	String e01DEAPPD = "" ;
	String e01DEAROA = "" ;
	String e01DEAIIP = "" ;
	String e01FLGFVE = "" ;
	String e01DLCNC1 = "" ;
	String e01DLCFP1 = "" ;
	String e01DLCVA1 = "" ;
	String e01DLCIGA = "" ;
	String e01DLCIGF = "" ;
	String e01DLCIGN = "" ;
	String e01FLGPEX = "" ;
	String e01IDAM01 = "" ;
	String e01IDAC01 = "" ;
	String e01IDAM02 = "" ;
	String e01IDAC02 = "" ;
	String e01IDAM03 = "" ;
	String e01IDAC03 = "" ;
	String e01IDAM04 = "" ;
	String e01IDAC04 = "" ;
	String e01IDAM05 = "" ;
	String e01IDAC05 = "" ;
	String e01IDAM06 = "" ;
	String e01IDAC06 = "" ;
	String e01IDAM07 = "" ;
	String e01IDAC07 = "" ;
	String e01IDAM08 = "" ;
	String e01IDAC08 = "" ;
	String e01IDAM09 = "" ;
	String e01IDAC09 = "" ;
	String e01IDAM10 = "" ;
	String e01IDAC10 = "" ;
	String e01IDAM11 = "" ;
	String e01IDAC11 = "" ;
	String e01IDAM12 = "" ;
	String e01IDAC12 = "" ;
    String e01PENR01 = "" ;
    String e01PENR02 = "" ;
    String e01PENR03 = "" ;
    String e01PENR04 = "" ;
    String e01PENR05 = "" ;
    String e01PENR06 = "" ;
    String e01PENR07 = "" ;
    String e01PENR08 = "" ;
    String e01PENR09 = "" ;
    String e01PENR10 = "" ;
    String e01PENR11 = "" ;
    String e01PENR12 = "" ;
    String e01PENR13 = "" ;
    String e01PENR14 = "" ;
    String e01PENR15 = "" ;
    String e01PENR16 = "" ;
    String e01PENR17 = "" ;
    String e01PENR18 = "" ;
    String e01PENR19 = "" ;
    String e01PENR20 = "" ;
    String e01PENR21 = "" ;
    String e01PENR22 = "" ;
    String e01PENR23 = "" ;
    String e01PENR24 = "" ;
    String e01PENR25 = "" ;
    String e01PENR26 = "" ;
    String e01PENR27 = "" ;
    String e01PENR28 = "" ;
    String e01PENR29 = "" ;
    String e01PENR30 = "" ;
    String e01PENR31 = "" ;
    String e01PENR32 = "" ;
    String e01PENR33 = "" ;
    String e01PENR34 = "" ;
    String e01PENR35 = "" ;
    String e01PENR36 = "" ;
    String e01PENR37 = "" ;
    String e01PENR38 = "" ;
    String e01PENR39 = "" ;
    String e01PENR40 = "" ;
    String e01PENR41 = "" ;
    String e01PENR42 = "" ;
    String e01PENR43 = "" ;
    String e01PENR44 = "" ;
    String e01PENR45 = "" ;
    String e01PENR46 = "" ;
    String e01PENR47 = "" ;
    String e01PENR48 = "" ;
    String e01PENR49 = "" ;
    String e01PENR50 = "" ;
    String e01PENR51 = "" ;
    String e01PENR52 = "" ;
    String e01PENR53 = "" ;
    String e01PENR54 = "" ;
    String e01PENR55 = "" ;
    String e01PENR56 = "" ;
    String e01PENR57 = "" ;
    String e01PENR58 = "" ;
    String e01PENR59 = "" ;
    String e01PENR60 = "" ;
    String e01PEAM01 = "" ;
    String e01PEAM02 = "" ;
    String e01PEAM03 = "" ;
    String e01PEAM04 = "" ;
    String e01PEAM05 = "" ;
    String e01PEAM06 = "" ;
    String e01PEAM07 = "" ;
    String e01PEAM08 = "" ;
    String e01PEAM09 = "" ;
    String e01PEAM10 = "" ;
    String e01PEAM11 = "" ;
    String e01PEAM12 = "" ;
    String e01PEAM13 = "" ;
    String e01PEAM14 = "" ;
    String e01PEAM15 = "" ;
    String e01PEAM16 = "" ;
    String e01PEAM17 = "" ;
    String e01PEAM18 = "" ;
    String e01PEAM19 = "" ;
    String e01PEAM20 = "" ;
    String e01PEAM21 = "" ;
    String e01PEAM22 = "" ;
    String e01PEAM23 = "" ;
    String e01PEAM24 = "" ;
    String e01PEAM25 = "" ;
    String e01PEAM26 = "" ;
    String e01PEAM27 = "" ;
    String e01PEAM28 = "" ;
    String e01PEAM29 = "" ;
    String e01PEAM30 = "" ;
    String e01PEAM31 = "" ;
    String e01PEAM32 = "" ;
    String e01PEAM33 = "" ;
    String e01PEAM34 = "" ;
    String e01PEAM35 = "" ;
    String e01PEAM36 = "" ;
    String e01PEAM37 = "" ;
    String e01PEAM38 = "" ;
    String e01PEAM39 = "" ;
    String e01PEAM40 = "" ;
    String e01PEAM41 = "" ;
    String e01PEAM42 = "" ;
    String e01PEAM43 = "" ;
    String e01PEAM44 = "" ;
    String e01PEAM45 = "" ;
    String e01PEAM46 = "" ;
    String e01PEAM47 = "" ;
    String e01PEAM48 = "" ;
    String e01PEAM49 = "" ;
    String e01PEAM50 = "" ;
    String e01PEAM51 = "" ;
    String e01PEAM52 = "" ;
    String e01PEAM53 = "" ;
    String e01PEAM54 = "" ;
    String e01PEAM55 = "" ;
    String e01PEAM56 = "" ;
    String e01PEAM57 = "" ;
    String e01PEAM58 = "" ;
    String e01PEAM59 = "" ;
    String e01PEAM60 = "" ;
    String e01DLCOR1 = "" ;
    String e01DLCPP1 = "" ;
    String e01DLCTP1 = "" ;
    String e01DLCOR2 = "" ;
    String e01DLCPP2 = "" ;
    String e01DLCNC2 = "" ;
    String e01DLCFP2 = "" ;
    String e01DLCTP2 = "" ;
    String e01DLCXM2 = "" ;
    String e01DLCXD2 = "" ;
    String e01DLCXY2 = "" ;
    String e01DLCVA2 = "" ;
    String e01DLCFL5 = "" ;
    String tableTitle = "" ;
    String tableSource = "" ;
    String readOnly = "";
    
    Boolean userEnabled = false;
    
	public String getH01FLGWK1() {
		return h01FLGWK1;
	}
	public void setH01FLGWK1(String h01flgwk1) {
		h01FLGWK1 = h01flgwk1;
	}
	public String getE01DEARDM() {
		return e01DEARDM;
	}
	public void setE01DEARDM(String e01deardm) {
		e01DEARDM = e01deardm;
	}
	public String getE01DEARDD() {
		return e01DEARDD;
	}
	public void setE01DEARDD(String e01deardd) {
		e01DEARDD = e01deardd;
	}
	public String getE01DEARDY() {
		return e01DEARDY;
	}
	public void setE01DEARDY(String e01deardy) {
		e01DEARDY = e01deardy;
	}
	public String getE01DLCPM1() {
		return e01DLCPM1;
	}
	public void setE01DLCPM1(String e01dlcpm1) {
		e01DLCPM1 = e01dlcpm1;
	}
	public String getE01DLCPD1() {
		return e01DLCPD1;
	}
	public void setE01DLCPD1(String e01dlcpd1) {
		e01DLCPD1 = e01dlcpd1;
	}
	public String getE01DLCPY1() {
		return e01DLCPY1;
	}
	public void setE01DLCPY1(String e01dlcpy1) {
		e01DLCPY1 = e01dlcpy1;
	}
	public String getE01DLCGM1() {
		return e01DLCGM1;
	}
	public void setE01DLCGM1(String e01dlcgm1) {
		e01DLCGM1 = e01dlcgm1;
	}
	public String getE01DLCGD1() {
		return e01DLCGD1;
	}
	public void setE01DLCGD1(String e01dlcgd1) {
		e01DLCGD1 = e01dlcgd1;
	}
	public String getE01DLCGY1() {
		return e01DLCGY1;
	}
	public void setE01DLCGY1(String e01dlcgy1) {
		e01DLCGY1 = e01dlcgy1;
	}
	public String getE01DLCXM1() {
		return e01DLCXM1;
	}
	public void setE01DLCXM1(String e01dlcxm1) {
		e01DLCXM1 = e01dlcxm1;
	}
	public String getE01DLCXD1() {
		return e01DLCXD1;
	}
	public void setE01DLCXD1(String e01dlcxd1) {
		e01DLCXD1 = e01dlcxd1;
	}
	public String getE01DLCXY1() {
		return e01DLCXY1;
	}
	public void setE01DLCXY1(String e01dlcxy1) {
		e01DLCXY1 = e01dlcxy1;
	}
	public String getE01DLCMN1() {
		return e01DLCMN1;
	}
	public void setE01DLCMN1(String e01dlcmn1) {
		e01DLCMN1 = e01dlcmn1;
	}
	public String getE01DLCMN2() {
		return e01DLCMN2;
	}
	public void setE01DLCMN2(String e01dlcmn2) {
		e01DLCMN2 = e01dlcmn2;
	}
	public String getE01DLCMN3() {
		return e01DLCMN3;
	}
	public void setE01DLCMN3(String e01dlcmn3) {
		e01DLCMN3 = e01dlcmn3;
	}
	public String getE01DEAHEM() {
		return e01DEAHEM;
	}
	public void setE01DEAHEM(String e01deahem) {
		e01DEAHEM = e01deahem;
	}
	public String getE01DEAHED() {
		return e01DEAHED;
	}
	public void setE01DEAHED(String e01deahed) {
		e01DEAHED = e01deahed;
	}
	public String getE01DEAHEY() {
		return e01DEAHEY;
	}
	public void setE01DEAHEY(String e01deahey) {
		e01DEAHEY = e01deahey;
	}
	public String getE01FLGFPG() {
		return e01FLGFPG;
	}
	public void setE01FLGFPG(String e01flgfpg) {
		e01FLGFPG = e01flgfpg;
	}
	public String getE01DEAIPD() {
		return e01DEAIPD;
	}
	public void setE01DEAIPD(String e01deaipd) {
		e01DEAIPD = e01deaipd;
	} 
	public String getE01DEAPPD() {
		return e01DEAPPD;
	}
	public void setE01DEAPPD(String e01deappd) {
		e01DEAPPD = e01deappd;
	}
	public String getE01DEAROA() {
		return e01DEAROA;
	}
	public void setE01DEAROA(String e01dearoa) {
		e01DEAROA = e01dearoa;
	}
	public String getE01DEAIIP() {
		return e01DEAIIP;
	}
	public void setE01DEAIIP(String e01deaiip) {
		e01DEAIIP = e01deaiip;
	}
	public String getE01FLGFVE() {
		return e01FLGFVE;
	}
	public void setE01FLGFVE(String e01flgfve) {
		e01FLGFVE = e01flgfve;
	}
	public String getE01DLCNC1() {
		return e01DLCNC1;
	}
	public void setE01DLCNC1(String e01dlcnc1) {
		e01DLCNC1 = e01dlcnc1;
	}
	public String getE01DLCFP1() {
		return e01DLCFP1;
	}
	public void setE01DLCFP1(String e01dlcfp1) {
		e01DLCFP1 = e01dlcfp1;
	}
	public String getE01DLCVA1() {
		return e01DLCVA1;
	}
	public void setE01DLCVA1(String e01dlcva1) {
		e01DLCVA1 = e01dlcva1;
	}
	public String getE01DLCIGA() {
		return e01DLCIGA;
	}
	public void setE01DLCIGA(String e01dlciga) {
		e01DLCIGA = e01dlciga;
	}
	public String getE01DLCIGF() {
		return e01DLCIGF;
	}
	public void setE01DLCIGF(String e01dlcigf) {
		e01DLCIGF = e01dlcigf;
	}
	public String getE01DLCIGN() {
		return e01DLCIGN;
	}
	public void setE01DLCIGN(String e01dlcign) {
		e01DLCIGN = e01dlcign;
	}
	public String getE01FLGPEX() {
		return e01FLGPEX;
	}
	public void setE01FLGPEX(String e01flgpex) {
		e01FLGPEX = e01flgpex;
	}
	public String getE01IDAM01() {
		return e01IDAM01;
	}
	public void setE01IDAM01(String e01idam01) {
		e01IDAM01 = e01idam01;
	}
	public String getE01IDAC01() {
		return e01IDAC01;
	}
	public void setE01IDAC01(String e01idac01) {
		e01IDAC01 = e01idac01;
	}
	public String getE01IDAM02() {
		return e01IDAM02;
	}
	public void setE01IDAM02(String e01idam02) {
		e01IDAM02 = e01idam02;
	}
	public String getE01IDAC02() {
		return e01IDAC02;
	}
	public void setE01IDAC02(String e01idac02) {
		e01IDAC02 = e01idac02;
	}
	public String getE01IDAM03() {
		return e01IDAM03;
	}
	public void setE01IDAM03(String e01idam03) {
		e01IDAM03 = e01idam03;
	}
	public String getE01IDAC03() {
		return e01IDAC03;
	}
	public void setE01IDAC03(String e01idac03) {
		e01IDAC03 = e01idac03;
	}
	public String getE01IDAM04() {
		return e01IDAM04;
	}
	public void setE01IDAM04(String e01idam04) {
		e01IDAM04 = e01idam04;
	}
	public String getE01IDAC04() {
		return e01IDAC04;
	}
	public void setE01IDAC04(String e01idac04) {
		e01IDAC04 = e01idac04;
	}
	public String getE01IDAM05() {
		return e01IDAM05;
	}
	public void setE01IDAM05(String e01idam05) {
		e01IDAM05 = e01idam05;
	}
	public String getE01IDAC05() {
		return e01IDAC05;
	}
	public void setE01IDAC05(String e01idac05) {
		e01IDAC05 = e01idac05;
	}
	public String getE01IDAM06() {
		return e01IDAM06;
	}
	public void setE01IDAM06(String e01idam06) {
		e01IDAM06 = e01idam06;
	}
	public String getE01IDAC06() {
		return e01IDAC06;
	}
	public void setE01IDAC06(String e01idac06) {
		e01IDAC06 = e01idac06;
	}
	public String getE01IDAM07() {
		return e01IDAM07;
	}
	public void setE01IDAM07(String e01idam07) {
		e01IDAM07 = e01idam07;
	}
	public String getE01IDAC07() {
		return e01IDAC07;
	}
	public void setE01IDAC07(String e01idac07) {
		e01IDAC07 = e01idac07;
	}
	public String getE01IDAM08() {
		return e01IDAM08;
	}
	public void setE01IDAM08(String e01idam08) {
		e01IDAM08 = e01idam08;
	}
	public String getE01IDAC08() {
		return e01IDAC08;
	}
	public void setE01IDAC08(String e01idac08) {
		e01IDAC08 = e01idac08;
	}
	public String getE01IDAM09() {
		return e01IDAM09;
	}
	public void setE01IDAM09(String e01idam09) {
		e01IDAM09 = e01idam09;
	}
	public String getE01IDAC09() {
		return e01IDAC09;
	}
	public void setE01IDAC09(String e01idac09) {
		e01IDAC09 = e01idac09;
	}
	public String getE01IDAM10() {
		return e01IDAM10;
	}
	public void setE01IDAM10(String e01idam10) {
		e01IDAM10 = e01idam10;
	}
	public String getE01IDAC10() {
		return e01IDAC10;
	}
	public void setE01IDAC10(String e01idac10) {
		e01IDAC10 = e01idac10;
	}
	public String getE01IDAM11() {
		return e01IDAM11;
	}
	public void setE01IDAM11(String e01idam11) {
		e01IDAM11 = e01idam11;
	}
	public String getE01IDAC11() {
		return e01IDAC11;
	}
	public void setE01IDAC11(String e01idac11) {
		e01IDAC11 = e01idac11;
	}
	public String getE01IDAM12() {
		return e01IDAM12;
	}
	public void setE01IDAM12(String e01idam12) {
		e01IDAM12 = e01idam12;
	}
	public String getE01IDAC12() {
		return e01IDAC12;
	}
	public void setE01IDAC12(String e01idac12) {
		e01IDAC12 = e01idac12;
	}
	public String getE01PENR01() {
		return e01PENR01;
	}
	public void setE01PENR01(String e01penr01) {
		e01PENR01 = e01penr01;
	}
	public String getE01PENR02() {
		return e01PENR02;
	}
	public void setE01PENR02(String e01penr02) {
		e01PENR02 = e01penr02;
	}
	public String getE01PENR03() {
		return e01PENR03;
	}
	public void setE01PENR03(String e01penr03) {
		e01PENR03 = e01penr03;
	}
	public String getE01PENR04() {
		return e01PENR04;
	}
	public void setE01PENR04(String e01penr04) {
		e01PENR04 = e01penr04;
	}
	public String getE01PENR05() {
		return e01PENR05;
	}
	public void setE01PENR05(String e01penr05) {
		e01PENR05 = e01penr05;
	}
	public String getE01PENR06() {
		return e01PENR06;
	}
	public void setE01PENR06(String e01penr06) {
		e01PENR06 = e01penr06;
	}
	public String getE01PENR07() {
		return e01PENR07;
	}
	public void setE01PENR07(String e01penr07) {
		e01PENR07 = e01penr07;
	}
	public String getE01PENR08() {
		return e01PENR08;
	}
	public void setE01PENR08(String e01penr08) {
		e01PENR08 = e01penr08;
	}
	public String getE01PENR09() {
		return e01PENR09;
	}
	public void setE01PENR09(String e01penr09) {
		e01PENR09 = e01penr09;
	}
	public String getE01PENR10() {
		return e01PENR10;
	}
	public void setE01PENR10(String e01penr10) {
		e01PENR10 = e01penr10;
	}
	public String getE01PENR11() {
		return e01PENR11;
	}
	public void setE01PENR11(String e01penr11) {
		e01PENR11 = e01penr11;
	}
	public String getE01PENR12() {
		return e01PENR12;
	}
	public void setE01PENR12(String e01penr12) {
		e01PENR12 = e01penr12;
	}
	public String getE01PENR13() {
		return e01PENR13;
	}
	public void setE01PENR13(String e01penr13) {
		e01PENR13 = e01penr13;
	}
	public String getE01PENR14() {
		return e01PENR14;
	}
	public void setE01PENR14(String e01penr14) {
		e01PENR14 = e01penr14;
	}
	public String getE01PENR15() {
		return e01PENR15;
	}
	public void setE01PENR15(String e01penr15) {
		e01PENR15 = e01penr15;
	}
	public String getE01PENR16() {
		return e01PENR16;
	}
	public void setE01PENR16(String e01penr16) {
		e01PENR16 = e01penr16;
	}
	public String getE01PENR17() {
		return e01PENR17;
	}
	public void setE01PENR17(String e01penr17) {
		e01PENR17 = e01penr17;
	}
	public String getE01PENR18() {
		return e01PENR18;
	}
	public void setE01PENR18(String e01penr18) {
		e01PENR18 = e01penr18;
	}
	public String getE01PENR19() {
		return e01PENR19;
	}
	public void setE01PENR19(String e01penr19) {
		e01PENR19 = e01penr19;
	}
	public String getE01PENR20() {
		return e01PENR20;
	}
	public void setE01PENR20(String e01penr20) {
		e01PENR20 = e01penr20;
	}
	public String getE01PENR21() {
		return e01PENR21;
	}
	public void setE01PENR21(String e01penr21) {
		e01PENR21 = e01penr21;
	}
	public String getE01PENR22() {
		return e01PENR22;
	}
	public void setE01PENR22(String e01penr22) {
		e01PENR22 = e01penr22;
	}
	public String getE01PENR23() {
		return e01PENR23;
	}
	public void setE01PENR23(String e01penr23) {
		e01PENR23 = e01penr23;
	}
	public String getE01PENR24() {
		return e01PENR24;
	}
	public void setE01PENR24(String e01penr24) {
		e01PENR24 = e01penr24;
	}
	public String getE01PENR25() {
		return e01PENR25;
	}
	public void setE01PENR25(String e01penr25) {
		e01PENR25 = e01penr25;
	}
	public String getE01PENR26() {
		return e01PENR26;
	}
	public void setE01PENR26(String e01penr26) {
		e01PENR26 = e01penr26;
	}
	public String getE01PENR27() {
		return e01PENR27;
	}
	public void setE01PENR27(String e01penr27) {
		e01PENR27 = e01penr27;
	}
	public String getE01PENR28() {
		return e01PENR28;
	}
	public void setE01PENR28(String e01penr28) {
		e01PENR28 = e01penr28;
	}
	public String getE01PENR29() {
		return e01PENR29;
	}
	public void setE01PENR29(String e01penr29) {
		e01PENR29 = e01penr29;
	}
	public String getE01PENR30() {
		return e01PENR30;
	}
	public void setE01PENR30(String e01penr30) {
		e01PENR30 = e01penr30;
	}
	public String getE01PENR31() {
		return e01PENR31;
	}
	public void setE01PENR31(String e01penr31) {
		e01PENR31 = e01penr31;
	}
	public String getE01PENR32() {
		return e01PENR32;
	}
	public void setE01PENR32(String e01penr32) {
		e01PENR32 = e01penr32;
	}
	public String getE01PENR33() {
		return e01PENR33;
	}
	public void setE01PENR33(String e01penr33) {
		e01PENR33 = e01penr33;
	}
	public String getE01PENR34() {
		return e01PENR34;
	}
	public void setE01PENR34(String e01penr34) {
		e01PENR34 = e01penr34;
	}
	public String getE01PENR35() {
		return e01PENR35;
	}
	public void setE01PENR35(String e01penr35) {
		e01PENR35 = e01penr35;
	}
	public String getE01PENR36() {
		return e01PENR36;
	}
	public void setE01PENR36(String e01penr36) {
		e01PENR36 = e01penr36;
	}
	public String getE01PENR37() {
		return e01PENR37;
	}
	public void setE01PENR37(String e01penr37) {
		e01PENR37 = e01penr37;
	}
	public String getE01PENR38() {
		return e01PENR38;
	}
	public void setE01PENR38(String e01penr38) {
		e01PENR38 = e01penr38;
	}
	public String getE01PENR39() {
		return e01PENR39;
	}
	public void setE01PENR39(String e01penr39) {
		e01PENR39 = e01penr39;
	}
	public String getE01PENR40() {
		return e01PENR40;
	}
	public void setE01PENR40(String e01penr40) {
		e01PENR40 = e01penr40;
	}
	public String getE01PENR41() {
		return e01PENR41;
	}
	public void setE01PENR41(String e01penr41) {
		e01PENR41 = e01penr41;
	}
	public String getE01PENR42() {
		return e01PENR42;
	}
	public void setE01PENR42(String e01penr42) {
		e01PENR42 = e01penr42;
	}
	public String getE01PENR43() {
		return e01PENR43;
	}
	public void setE01PENR43(String e01penr43) {
		e01PENR43 = e01penr43;
	}
	public String getE01PENR44() {
		return e01PENR44;
	}
	public void setE01PENR44(String e01penr44) {
		e01PENR44 = e01penr44;
	}
	public String getE01PENR45() {
		return e01PENR45;
	}
	public void setE01PENR45(String e01penr45) {
		e01PENR45 = e01penr45;
	}
	public String getE01PENR46() {
		return e01PENR46;
	}
	public void setE01PENR46(String e01penr46) {
		e01PENR46 = e01penr46;
	}
	public String getE01PENR47() {
		return e01PENR47;
	}
	public void setE01PENR47(String e01penr47) {
		e01PENR47 = e01penr47;
	}
	public String getE01PENR48() {
		return e01PENR48;
	}
	public void setE01PENR48(String e01penr48) {
		e01PENR48 = e01penr48;
	}
	public String getE01PENR49() {
		return e01PENR49;
	}
	public void setE01PENR49(String e01penr49) {
		e01PENR49 = e01penr49;
	}
	public String getE01PENR50() {
		return e01PENR50;
	}
	public void setE01PENR50(String e01penr50) {
		e01PENR50 = e01penr50;
	}
	public String getE01PENR51() {
		return e01PENR51;
	}
	public void setE01PENR51(String e01penr51) {
		e01PENR51 = e01penr51;
	}
	public String getE01PENR52() {
		return e01PENR52;
	}
	public void setE01PENR52(String e01penr52) {
		e01PENR52 = e01penr52;
	}
	public String getE01PENR53() {
		return e01PENR53;
	}
	public void setE01PENR53(String e01penr53) {
		e01PENR53 = e01penr53;
	}
	public String getE01PENR54() {
		return e01PENR54;
	}
	public void setE01PENR54(String e01penr54) {
		e01PENR54 = e01penr54;
	}
	public String getE01PENR55() {
		return e01PENR55;
	}
	public void setE01PENR55(String e01penr55) {
		e01PENR55 = e01penr55;
	}
	public String getE01PENR56() {
		return e01PENR56;
	}
	public void setE01PENR56(String e01penr56) {
		e01PENR56 = e01penr56;
	}
	public String getE01PENR57() {
		return e01PENR57;
	}
	public void setE01PENR57(String e01penr57) {
		e01PENR57 = e01penr57;
	}
	public String getE01PENR58() {
		return e01PENR58;
	}
	public void setE01PENR58(String e01penr58) {
		e01PENR58 = e01penr58;
	}
	public String getE01PENR59() {
		return e01PENR59;
	}
	public void setE01PENR59(String e01penr59) {
		e01PENR59 = e01penr59;
	}
	public String getE01PENR60() {
		return e01PENR60;
	}
	public void setE01PENR60(String e01penr60) {
		e01PENR60 = e01penr60;
	}
	public String getE01PEAM01() {
		return e01PEAM01;
	}
	public void setE01PEAM01(String e01peam01) {
		e01PEAM01 = e01peam01;
	}
	public String getE01PEAM02() {
		return e01PEAM02;
	}
	public void setE01PEAM02(String e01peam02) {
		e01PEAM02 = e01peam02;
	}
	public String getE01PEAM03() {
		return e01PEAM03;
	}
	public void setE01PEAM03(String e01peam03) {
		e01PEAM03 = e01peam03;
	}
	public String getE01PEAM04() {
		return e01PEAM04;
	}
	public void setE01PEAM04(String e01peam04) {
		e01PEAM04 = e01peam04;
	}
	public String getE01PEAM05() {
		return e01PEAM05;
	}
	public void setE01PEAM05(String e01peam05) {
		e01PEAM05 = e01peam05;
	}
	public String getE01PEAM06() {
		return e01PEAM06;
	}
	public void setE01PEAM06(String e01peam06) {
		e01PEAM06 = e01peam06;
	}
	public String getE01PEAM07() {
		return e01PEAM07;
	}
	public void setE01PEAM07(String e01peam07) {
		e01PEAM07 = e01peam07;
	}
	public String getE01PEAM08() {
		return e01PEAM08;
	}
	public void setE01PEAM08(String e01peam08) {
		e01PEAM08 = e01peam08;
	}
	public String getE01PEAM09() {
		return e01PEAM09;
	}
	public void setE01PEAM09(String e01peam09) {
		e01PEAM09 = e01peam09;
	}
	public String getE01PEAM10() {
		return e01PEAM10;
	}
	public void setE01PEAM10(String e01peam10) {
		e01PEAM10 = e01peam10;
	}
	public String getE01PEAM11() {
		return e01PEAM11;
	}
	public void setE01PEAM11(String e01peam11) {
		e01PEAM11 = e01peam11;
	}
	public String getE01PEAM12() {
		return e01PEAM12;
	}
	public void setE01PEAM12(String e01peam12) {
		e01PEAM12 = e01peam12;
	}
	public String getE01PEAM13() {
		return e01PEAM13;
	}
	public void setE01PEAM13(String e01peam13) {
		e01PEAM13 = e01peam13;
	}
	public String getE01PEAM14() {
		return e01PEAM14;
	}
	public void setE01PEAM14(String e01peam14) {
		e01PEAM14 = e01peam14;
	}
	public String getE01PEAM15() {
		return e01PEAM15;
	}
	public void setE01PEAM15(String e01peam15) {
		e01PEAM15 = e01peam15;
	}
	public String getE01PEAM16() {
		return e01PEAM16;
	}
	public void setE01PEAM16(String e01peam16) {
		e01PEAM16 = e01peam16;
	}
	public String getE01PEAM17() {
		return e01PEAM17;
	}
	public void setE01PEAM17(String e01peam17) {
		e01PEAM17 = e01peam17;
	}
	public String getE01PEAM18() {
		return e01PEAM18;
	}
	public void setE01PEAM18(String e01peam18) {
		e01PEAM18 = e01peam18;
	}
	public String getE01PEAM19() {
		return e01PEAM19;
	}
	public void setE01PEAM19(String e01peam19) {
		e01PEAM19 = e01peam19;
	}
	public String getE01PEAM20() {
		return e01PEAM20;
	}
	public void setE01PEAM20(String e01peam20) {
		e01PEAM20 = e01peam20;
	}
	public String getE01PEAM21() {
		return e01PEAM21;
	}
	public void setE01PEAM21(String e01peam21) {
		e01PEAM21 = e01peam21;
	}
	public String getE01PEAM22() {
		return e01PEAM22;
	}
	public void setE01PEAM22(String e01peam22) {
		e01PEAM22 = e01peam22;
	}
	public String getE01PEAM23() {
		return e01PEAM23;
	}
	public void setE01PEAM23(String e01peam23) {
		e01PEAM23 = e01peam23;
	}
	public String getE01PEAM24() {
		return e01PEAM24;
	}
	public void setE01PEAM24(String e01peam24) {
		e01PEAM24 = e01peam24;
	}
	public String getE01PEAM25() {
		return e01PEAM25;
	}
	public void setE01PEAM25(String e01peam25) {
		e01PEAM25 = e01peam25;
	}
	public String getE01PEAM26() {
		return e01PEAM26;
	}
	public void setE01PEAM26(String e01peam26) {
		e01PEAM26 = e01peam26;
	}
	public String getE01PEAM27() {
		return e01PEAM27;
	}
	public void setE01PEAM27(String e01peam27) {
		e01PEAM27 = e01peam27;
	}
	public String getE01PEAM28() {
		return e01PEAM28;
	}
	public void setE01PEAM28(String e01peam28) {
		e01PEAM28 = e01peam28;
	}
	public String getE01PEAM29() {
		return e01PEAM29;
	}
	public void setE01PEAM29(String e01peam29) {
		e01PEAM29 = e01peam29;
	}
	public String getE01PEAM30() {
		return e01PEAM30;
	}
	public void setE01PEAM30(String e01peam30) {
		e01PEAM30 = e01peam30;
	}
	public String getE01PEAM31() {
		return e01PEAM31;
	}
	public void setE01PEAM31(String e01peam31) {
		e01PEAM31 = e01peam31;
	}
	public String getE01PEAM32() {
		return e01PEAM32;
	}
	public void setE01PEAM32(String e01peam32) {
		e01PEAM32 = e01peam32;
	}
	public String getE01PEAM33() {
		return e01PEAM33;
	}
	public void setE01PEAM33(String e01peam33) {
		e01PEAM33 = e01peam33;
	}
	public String getE01PEAM34() {
		return e01PEAM34;
	}
	public void setE01PEAM34(String e01peam34) {
		e01PEAM34 = e01peam34;
	}
	public String getE01PEAM35() {
		return e01PEAM35;
	}
	public void setE01PEAM35(String e01peam35) {
		e01PEAM35 = e01peam35;
	}
	public String getE01PEAM36() {
		return e01PEAM36;
	}
	public void setE01PEAM36(String e01peam36) {
		e01PEAM36 = e01peam36;
	}
	public String getE01PEAM37() {
		return e01PEAM37;
	}
	public void setE01PEAM37(String e01peam37) {
		e01PEAM37 = e01peam37;
	}
	public String getE01PEAM38() {
		return e01PEAM38;
	}
	public void setE01PEAM38(String e01peam38) {
		e01PEAM38 = e01peam38;
	}
	public String getE01PEAM39() {
		return e01PEAM39;
	}
	public void setE01PEAM39(String e01peam39) {
		e01PEAM39 = e01peam39;
	}
	public String getE01PEAM40() {
		return e01PEAM40;
	}
	public void setE01PEAM40(String e01peam40) {
		e01PEAM40 = e01peam40;
	}
	public String getE01PEAM41() {
		return e01PEAM41;
	}
	public void setE01PEAM41(String e01peam41) {
		e01PEAM41 = e01peam41;
	}
	public String getE01PEAM42() {
		return e01PEAM42;
	}
	public void setE01PEAM42(String e01peam42) {
		e01PEAM42 = e01peam42;
	}
	public String getE01PEAM43() {
		return e01PEAM43;
	}
	public void setE01PEAM43(String e01peam43) {
		e01PEAM43 = e01peam43;
	}
	public String getE01PEAM44() {
		return e01PEAM44;
	}
	public void setE01PEAM44(String e01peam44) {
		e01PEAM44 = e01peam44;
	}
	public String getE01PEAM45() {
		return e01PEAM45;
	}
	public void setE01PEAM45(String e01peam45) {
		e01PEAM45 = e01peam45;
	}
	public String getE01PEAM46() {
		return e01PEAM46;
	}
	public void setE01PEAM46(String e01peam46) {
		e01PEAM46 = e01peam46;
	}
	public String getE01PEAM47() {
		return e01PEAM47;
	}
	public void setE01PEAM47(String e01peam47) {
		e01PEAM47 = e01peam47;
	}
	public String getE01PEAM48() {
		return e01PEAM48;
	}
	public void setE01PEAM48(String e01peam48) {
		e01PEAM48 = e01peam48;
	}
	public String getE01PEAM49() {
		return e01PEAM49;
	}
	public void setE01PEAM49(String e01peam49) {
		e01PEAM49 = e01peam49;
	}
	public String getE01PEAM50() {
		return e01PEAM50;
	}
	public void setE01PEAM50(String e01peam50) {
		e01PEAM50 = e01peam50;
	}
	public String getE01PEAM51() {
		return e01PEAM51;
	}
	public void setE01PEAM51(String e01peam51) {
		e01PEAM51 = e01peam51;
	}
	public String getE01PEAM52() {
		return e01PEAM52;
	}
	public void setE01PEAM52(String e01peam52) {
		e01PEAM52 = e01peam52;
	}
	public String getE01PEAM53() {
		return e01PEAM53;
	}
	public void setE01PEAM53(String e01peam53) {
		e01PEAM53 = e01peam53;
	}
	public String getE01PEAM54() {
		return e01PEAM54;
	}
	public void setE01PEAM54(String e01peam54) {
		e01PEAM54 = e01peam54;
	}
	public String getE01PEAM55() {
		return e01PEAM55;
	}
	public void setE01PEAM55(String e01peam55) {
		e01PEAM55 = e01peam55;
	}
	public String getE01PEAM56() {
		return e01PEAM56;
	}
	public void setE01PEAM56(String e01peam56) {
		e01PEAM56 = e01peam56;
	}
	public String getE01PEAM57() {
		return e01PEAM57;
	}
	public void setE01PEAM57(String e01peam57) {
		e01PEAM57 = e01peam57;
	}
	public String getE01PEAM58() {
		return e01PEAM58;
	}
	public void setE01PEAM58(String e01peam58) {
		e01PEAM58 = e01peam58;
	}
	public String getE01PEAM59() {
		return e01PEAM59;
	}
	public void setE01PEAM59(String e01peam59) {
		e01PEAM59 = e01peam59;
	}
	public String getE01PEAM60() {
		return e01PEAM60;
	}
	public void setE01PEAM60(String e01peam60) {
		e01PEAM60 = e01peam60;
	}
	public String getE01DLCOR1() {
		return e01DLCOR1;
	}
	public void setE01DLCOR1(String e01dlcor1) {
		e01DLCOR1 = e01dlcor1;
	}
	public String getE01DLCPP1() {
		return e01DLCPP1;
	}
	public void setE01DLCPP1(String e01dlcpp1) {
		e01DLCPP1 = e01dlcpp1;
	}
	public String getE01DLCTP1() {
		return e01DLCTP1;
	}
	public void setE01DLCTP1(String e01dlctp1) {
		e01DLCTP1 = e01dlctp1;
	}
	public String getE01DLCOR2() {
		return e01DLCOR2;
	}
	public void setE01DLCOR2(String e01dlcor2) {
		e01DLCOR2 = e01dlcor2;
	}
	public String getE01DLCPP2() {
		return e01DLCPP2;
	}
	public void setE01DLCPP2(String e01dlcpp2) {
		e01DLCPP2 = e01dlcpp2;
	}
	public String getE01DLCNC2() {
		return e01DLCNC2;
	}
	public void setE01DLCNC2(String e01dlcnc2) {
		e01DLCNC2 = e01dlcnc2;
	}
	public String getE01DLCFP2() {
		return e01DLCFP2;
	}
	public void setE01DLCFP2(String e01dlcfp2) {
		e01DLCFP2 = e01dlcfp2;
	}
	public String getE01DLCTP2() {
		return e01DLCTP2;
	}
	public void setE01DLCTP2(String e01dlctp2) {
		e01DLCTP2 = e01dlctp2;
	}
	public String getE01DLCXM2() {
		return e01DLCXM2;
	}
	public void setE01DLCXM2(String e01dlcxm2) {
		e01DLCXM2 = e01dlcxm2;
	}
	public String getE01DLCXD2() {
		return e01DLCXD2;
	}
	public void setE01DLCXD2(String e01dlcxd2) {
		e01DLCXD2 = e01dlcxd2;
	}
	public String getE01DLCXY2() {
		return e01DLCXY2;
	}
	public void setE01DLCXY2(String e01DLCXY2) {
		this.e01DLCXY2 = e01DLCXY2;
	}
	public String getE01DLCVA2() {
		return e01DLCVA2;
	}
	public void setE01DLCVA2(String e01dlcva2) {
		e01DLCVA2 = e01dlcva2;
	}
    public String getE01DLCFL5() {
		return e01DLCFL5;
	}
	public void setE01DLCFL5(String e01dlcfl5) {
		e01DLCFL5 = e01dlcfl5;
	}
	
	public void setuserEnabled(Boolean userEnabled) {
		this.userEnabled = userEnabled;
	}	

	public Boolean userEnabled() {
		return this.userEnabled ;
	}	
	
	public void populate(MessageRecord mr) {
		Field fields[] = this.getClass().getDeclaredFields();
		String value = null;

		for(Field field : fields) {
			//E01 Type Messages from AS400
			if(!mr.getFormatName().endsWith("02")){
				try {
					value = mr.getFieldString(field.getName().toUpperCase());
					if (value != null) {
						field.set(this, value);; 
					}
				} catch (Exception e) {
	
				}
			//E02 Type Messages from AS400
			} else {
				try {
					value = mr.getFieldString("E02"+field.getName().substring(3).toUpperCase());
					if (value != null) {
						field.set(this, value);; 
					}
				} catch (Exception e) {
	
				}				
			}
		}
		
		//Loan Simulation Module
		if(mr instanceof EPV090001Message){
			setSource("SIMULAT");
		//NEW.MAINT LOANS
		} else if(mr instanceof EPV015001Message){
			setSource("NEWMAIN");
		//RENEWAL LOANS
		} else if(mr instanceof EDL091001Message){
			setSource("RENEWAL");
		//LOAN INQUIRY LOANS
		} else if(mr instanceof EDL016002Message){
			setSource("INQUIRY");
		}

		setTitle();
	}

   public String getFieldString(String key){
    	String ret = "";
    	
    	try {
			Field fieldKey = this.getClass().getDeclaredField(key);
			ret = fieldKey.get(this).toString();

    	} catch (Exception e) {
			logger.log( Level.SEVERE, "Could not determine LoanPaymnetPlaneBean value : " + key);
		}
	        
	    return ret;
   }
   
   public void setTitle(){
	   String headerTitle = "";	
	
	   if(!this.e01FLGFPG.trim().equals("")){
		   if (this.getE01FLGFPG().equals("M")) {
			    headerTitle = "Pagar el Inter&eacute;s y el Capital al Vencimiento (MAT)";
				if(!this.e01DEAPPD.equals("MAT")){
				    setE01DEAIPD("MAT"); //Sets Interest and Capital Cycles to Maturity
				    setE01DEAPPD("MAT");
				}
			    
			} else if(this.getE01FLGFPG().equals("2")) { 
			    headerTitle = "Doble Esquema de Pago (SC2)";
				if(!this.e01DEAPPD.equals("SC2")){
					setE01DEAIPD("SC2"); //Sets Interest and Capital Cycles to SC2
					setE01DEAPPD("SC2");
				}
			    
			} else if(this.getE01FLGFPG().equals("3")) {  
				 headerTitle = "Cuota Fija (SC3): Principal + Inter&eacute;s + Deducciones";
				if(!this.e01DEAPPD.equals("SC3")){
					setE01DEAIPD("SC3"); //Sets Interest and Capital Cycles to SC3
					setE01DEAPPD("SC3");
				}
				
			} else if(this.getE01FLGFPG().equals("4")) {  
			    headerTitle = "Pago Tipo Revolvente (SC4)";
				if(!this.e01DEAPPD.equals("SC4")){
					setE01DEAIPD("SC4"); //Sets Interest and Capital Cycles to SC1
					setE01DEAPPD("SC4");			    
				}
				 
			} else if(this.getE01FLGFPG().equals("1")) {  
			    headerTitle = "Cuota Fija (SC1): Principal + Inter&eacute;s";
				if(!this.e01DEAPPD.equals("SC1")){
					setE01DEAIPD("SC1"); //Sets Interest and Capital Cycles to SC1
					setE01DEAPPD("SC1");			    
				}
			    
			} else if(this.getE01FLGFPG().equals("N")) {  
			    headerTitle = "Pagar el Inter&eacute;s y el Capital seg&uacute;n sus ciclos";
				if(!NumberUtils.isNumber(this.e01DEAPPD)){
					setE01DEAIPD("030"); //Resets Interest and Capital Cycle to 30 by default 
					setE01DEAPPD("030");			    
				}
			}   
	   } else {
	   
		   //SC1 OR SC3
		   if( (this.e01DEAIPD.equals("SC1") && this.e01DEAPPD.equals("SC1")) || (this.e01DEAIPD.equals("SC3") && this.e01DEAPPD.equals("SC3")) ){ 
			  if( this.e01DEAIPD.equals("SC1") && this.e01DEAPPD.equals("SC1") ){
				  headerTitle = "Cuota Fija (SC1): Principal + Inter&eacute;s";
				  setE01FLGFPG("1");
			  }else{
				  headerTitle = "Cuota Fija (SC3): Principal + Inter&eacute;s + Deducciones";
				  setE01FLGFPG("3");
			  }
			  
			  if(this.e01DLCFL5.equals("Y")){
				  headerTitle += " Decreciente, Incremento Anual";
			  }
	      //SC2
		  } else if( this.e01DEAIPD.equals("SC2") && this.e01DEAPPD.equals("SC2")){
			  headerTitle = "Doble Esquema de Pago (SC2)";
			  setE01FLGFPG("2");
          //SC4
		  } else if( this.e01DEAIPD.equals("SC4") && this.e01DEAPPD.equals("SC4")){
			  headerTitle = "Pago Tipo Revolvente (SC4)";
			  setE01FLGFPG("4");
		  //SCH	  
		  } else if( NumberUtils.isNumber(this.e01DEAIPD) && this.e01DEAPPD.equals("SCH")){
			  headerTitle = "Pagar el Inter&eacute;s seg&uacute;n Ciclo Preestablecido";
	
		  //MAT	  
		  } else if( this.e01DEAIPD.equals("MAT") && this.e01DEAPPD.equals("MAT")){
			  headerTitle = "Pagar el Inter&eacute;s y el Capital al Vencimiento (MAT)";
			  setE01FLGFPG("M");
		  
		  //Numeric Interest + Capital Maturity  
		  } else if( NumberUtils.isNumber(this.e01DEAIPD) && this.e01DEAPPD.equals("MAT")){
			  headerTitle = "Pagar el Capital al Vencimiento y el Inter&eacute;s seg&uacute;n su Ciclo";
			  setE01FLGFPG("M");
			  
	      //Numeric Interest + Capital 
		  } else if( NumberUtils.isNumber(this.e01DEAIPD) && NumberUtils.isNumber(this.e01DEAPPD)){
			  headerTitle = "Pagar el Inter&eacute;s y el Capital seg&uacute;n sus ciclos";
			  setE01FLGFPG("N");
			  
		  } else {
			  if(!this.e01DEAPPD.equals("SCH")){
				  headerTitle = "Pagar el Inter&eacute;s y el Capital seg&uacute;n sus ciclos";
				  setE01FLGFPG("N");
			  }
		  }
	   }
	   setTitle(headerTitle);
   }
   
   public void setTitle(String header){
	   this.tableTitle = header;
   }
   
   public String getTitle(){
	   return this.tableTitle;
   }
   	
   public void setSource(String source){
	   this.tableSource = source;
   }
   
   public String getSource(){
	   return this.tableSource;
   }

   public void setreadOnly(){
	   this.readOnly = "true";
   }

   public String getreadOnly(){
	   return this.readOnly;
   }
}
