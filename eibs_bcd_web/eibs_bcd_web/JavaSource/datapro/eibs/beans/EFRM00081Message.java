package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFRM00081 physical file definition.
* 
* File level identifier is 1180419082338.
* Record format level identifier is 50E16ACA2857B.
*/

public class EFRM00081Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H81USERID",
                                     "H81PROGRM",
                                     "H81TIMSYS",
                                     "H81SCRCOD",
                                     "H81OPECOD",
                                     "H81FLGMAS",
                                     "H81FLGWK1",
                                     "H81FLGWK2",
                                     "H81FLGWK3",
                                     "E81PDTCOD",
                                     "E81PDTSEQ",
                                     "E81PDTREC",
                                     "E81PDTBNK",
                                     "E81PDTBRN",
                                     "E81PDTCCY",
                                     "E81PDTGLN",
                                     "E81PDTACC",
                                     "E81PDTPRI",
                                     "E81PDTPRD",
                                     "E81DEACUN",
                                     "E81DEAIVC",
                                     "E81DEAODM",
                                     "E81DEAODD",
                                     "E81DEAODY",
                                     "E81DEASPR",
                                     "E81CUSNME",
                                     "E81CUSIDN"
                                   };
  final static String tnames[] = {
                                   "*user",
                                   "*program",
                                   "*time",
                                   "*sourceCode",
                                   "*opeCode",
                                   "*flagMas",
                                   "*flagWk1",
                                   "*flagWk2",
                                   "*flagWk3",
                                   "codigoFomento",
                                   "secuencia",
                                   "clienteRedescuento",
                                   "bankNumber",
                                   "branchNumber",
                                   "currency",
                                   "glAccount",
                                   "accountNumber",
                                   "originalAmount",
                                   "productCode",
                                   "customerNumber",
                                   "nroPagare",
                                   "openingMonth",
                                   "openingDay",
                                   "openingYear",
                                   "efectiveRate",
                                   "customerName",
                                   "custIdentification"
                                 };
  final static String fid = "1180419082338";
  final static String rid = "50E16ACA2857B";
  final static String fmtname = "EFRM00081";
  final int FIELDCOUNT = 27;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH81USERID = null;
  private CharacterField fieldH81PROGRM = null;
  private CharacterField fieldH81TIMSYS = null;
  private CharacterField fieldH81SCRCOD = null;
  private CharacterField fieldH81OPECOD = null;
  private CharacterField fieldH81FLGMAS = null;
  private CharacterField fieldH81FLGWK1 = null;
  private CharacterField fieldH81FLGWK2 = null;
  private CharacterField fieldH81FLGWK3 = null;
  private CharacterField fieldE81PDTCOD = null;
  private DecimalField fieldE81PDTSEQ = null;
  private CharacterField fieldE81PDTREC = null;
  private CharacterField fieldE81PDTBNK = null;
  private DecimalField fieldE81PDTBRN = null;
  private CharacterField fieldE81PDTCCY = null;
  private DecimalField fieldE81PDTGLN = null;
  private DecimalField fieldE81PDTACC = null;
  private DecimalField fieldE81PDTPRI = null;
  private CharacterField fieldE81PDTPRD = null;
  private DecimalField fieldE81DEACUN = null;
  private CharacterField fieldE81DEAIVC = null;
  private DecimalField fieldE81DEAODM = null;
  private DecimalField fieldE81DEAODD = null;
  private DecimalField fieldE81DEAODY = null;
  private DecimalField fieldE81DEASPR = null;
  private CharacterField fieldE81CUSNME = null;
  private CharacterField fieldE81CUSIDN = null;

  /**
  * Constructor for EFRM00081Message.
  */
  public EFRM00081Message()
  {
    createFields();
    initialize();
  }

  /**
  * Create fields for this message.
  * This method implements the abstract method in the MessageRecord superclass.
  */
  protected void createFields()
  {
    recordsize = 256;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH81USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "*user");
    fields[1] = fieldH81PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "*program");
    fields[2] = fieldH81TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "*time");
    fields[3] = fieldH81SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "*sourceCode");
    fields[4] = fieldH81OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "*opeCode");
    fields[5] = fieldH81FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "*flagMas");
    fields[6] = fieldH81FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "*flagWk1");
    fields[7] = fieldH81FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "*flagWk2");
    fields[8] = fieldH81FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "*flagWk3");
    fields[9] = fieldE81PDTCOD =
    new CharacterField(message, HEADERSIZE + 42, 4, "codigoFomento");
    fields[10] = fieldE81PDTSEQ =
    new DecimalField(message, HEADERSIZE + 46, 8, 0, "secuencia");
    fields[11] = fieldE81PDTREC =
    new CharacterField(message, HEADERSIZE + 54, 4, "clienteRedescuento");
    fields[12] = fieldE81PDTBNK =
    new CharacterField(message, HEADERSIZE + 58, 2, "bankNumber");
    fields[13] = fieldE81PDTBRN =
    new DecimalField(message, HEADERSIZE + 60, 5, 0, "branchNumber");
    fields[14] = fieldE81PDTCCY =
    new CharacterField(message, HEADERSIZE + 65, 3, "currency");
    fields[15] = fieldE81PDTGLN =
    new DecimalField(message, HEADERSIZE + 68, 17, 0, "glAccount");
    fields[16] = fieldE81PDTACC =
    new DecimalField(message, HEADERSIZE + 85, 13, 0, "accountNumber");
    fields[17] = fieldE81PDTPRI =
    new DecimalField(message, HEADERSIZE + 98, 17, 2, "originalAmount");
    fields[18] = fieldE81PDTPRD =
    new CharacterField(message, HEADERSIZE + 115, 4, "productCode");
    fields[19] = fieldE81DEACUN =
    new DecimalField(message, HEADERSIZE + 119, 10, 0, "customerNumber");
    fields[20] = fieldE81DEAIVC =
    new CharacterField(message, HEADERSIZE + 129, 20, "nroPagare");
    fields[21] = fieldE81DEAODM =
    new DecimalField(message, HEADERSIZE + 149, 3, 0, "openingMonth");
    fields[22] = fieldE81DEAODD =
    new DecimalField(message, HEADERSIZE + 152, 3, 0, "openingDay");
    fields[23] = fieldE81DEAODY =
    new DecimalField(message, HEADERSIZE + 155, 5, 0, "openingYear");
    fields[24] = fieldE81DEASPR =
    new DecimalField(message, HEADERSIZE + 160, 11, 6, "efectiveRate");
    fields[25] = fieldE81CUSNME =
    new CharacterField(message, HEADERSIZE + 171, 60, "customerName");
    fields[26] = fieldE81CUSIDN =
    new CharacterField(message, HEADERSIZE + 231, 25, "custIdentification");

    synchronized (tlookup)
    {
      if (tlookup.isEmpty())
      {
        for (int i = 0; i < tnames.length; i++)
          tlookup.put(tnames[i], new Integer(i));
      }
    }

    taglookup = tlookup;
  }

  /**
  * Set field H81USERID using a String value.
  */
  public void setH81USERID(String newvalue)
  {
    fieldH81USERID.setString(newvalue);
  }

  /**
  * Get value of field H81USERID as a String.
  */
  public String getH81USERID()
  {
    return fieldH81USERID.getString();
  }

  /**
  * Set field H81PROGRM using a String value.
  */
  public void setH81PROGRM(String newvalue)
  {
    fieldH81PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H81PROGRM as a String.
  */
  public String getH81PROGRM()
  {
    return fieldH81PROGRM.getString();
  }

  /**
  * Set field H81TIMSYS using a String value.
  */
  public void setH81TIMSYS(String newvalue)
  {
    fieldH81TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H81TIMSYS as a String.
  */
  public String getH81TIMSYS()
  {
    return fieldH81TIMSYS.getString();
  }

  /**
  * Set field H81SCRCOD using a String value.
  */
  public void setH81SCRCOD(String newvalue)
  {
    fieldH81SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H81SCRCOD as a String.
  */
  public String getH81SCRCOD()
  {
    return fieldH81SCRCOD.getString();
  }

  /**
  * Set field H81OPECOD using a String value.
  */
  public void setH81OPECOD(String newvalue)
  {
    fieldH81OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H81OPECOD as a String.
  */
  public String getH81OPECOD()
  {
    return fieldH81OPECOD.getString();
  }

  /**
  * Set field H81FLGMAS using a String value.
  */
  public void setH81FLGMAS(String newvalue)
  {
    fieldH81FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H81FLGMAS as a String.
  */
  public String getH81FLGMAS()
  {
    return fieldH81FLGMAS.getString();
  }

  /**
  * Set field H81FLGWK1 using a String value.
  */
  public void setH81FLGWK1(String newvalue)
  {
    fieldH81FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H81FLGWK1 as a String.
  */
  public String getH81FLGWK1()
  {
    return fieldH81FLGWK1.getString();
  }

  /**
  * Set field H81FLGWK2 using a String value.
  */
  public void setH81FLGWK2(String newvalue)
  {
    fieldH81FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H81FLGWK2 as a String.
  */
  public String getH81FLGWK2()
  {
    return fieldH81FLGWK2.getString();
  }

  /**
  * Set field H81FLGWK3 using a String value.
  */
  public void setH81FLGWK3(String newvalue)
  {
    fieldH81FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H81FLGWK3 as a String.
  */
  public String getH81FLGWK3()
  {
    return fieldH81FLGWK3.getString();
  }

  /**
  * Set field E81PDTCOD using a String value.
  */
  public void setE81PDTCOD(String newvalue)
  {
    fieldE81PDTCOD.setString(newvalue);
  }

  /**
  * Get value of field E81PDTCOD as a String.
  */
  public String getE81PDTCOD()
  {
    return fieldE81PDTCOD.getString();
  }

  /**
  * Set field E81PDTSEQ using a String value.
  */
  public void setE81PDTSEQ(String newvalue)
  {
    fieldE81PDTSEQ.setString(newvalue);
  }

  /**
  * Get value of field E81PDTSEQ as a String.
  */
  public String getE81PDTSEQ()
  {
    return fieldE81PDTSEQ.getString();
  }

  /**
  * Set numeric field E81PDTSEQ using a BigDecimal value.
  */
  public void setE81PDTSEQ(BigDecimal newvalue)
  {
    fieldE81PDTSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81PDTSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81PDTSEQ()
  {
    return fieldE81PDTSEQ.getBigDecimal();
  }

  /**
  * Set field E81PDTREC using a String value.
  */
  public void setE81PDTREC(String newvalue)
  {
    fieldE81PDTREC.setString(newvalue);
  }

  /**
  * Get value of field E81PDTREC as a String.
  */
  public String getE81PDTREC()
  {
    return fieldE81PDTREC.getString();
  }

  /**
  * Set field E81PDTBNK using a String value.
  */
  public void setE81PDTBNK(String newvalue)
  {
    fieldE81PDTBNK.setString(newvalue);
  }

  /**
  * Get value of field E81PDTBNK as a String.
  */
  public String getE81PDTBNK()
  {
    return fieldE81PDTBNK.getString();
  }

  /**
  * Set field E81PDTBRN using a String value.
  */
  public void setE81PDTBRN(String newvalue)
  {
    fieldE81PDTBRN.setString(newvalue);
  }

  /**
  * Get value of field E81PDTBRN as a String.
  */
  public String getE81PDTBRN()
  {
    return fieldE81PDTBRN.getString();
  }

  /**
  * Set numeric field E81PDTBRN using a BigDecimal value.
  */
  public void setE81PDTBRN(BigDecimal newvalue)
  {
    fieldE81PDTBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81PDTBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81PDTBRN()
  {
    return fieldE81PDTBRN.getBigDecimal();
  }

  /**
  * Set field E81PDTCCY using a String value.
  */
  public void setE81PDTCCY(String newvalue)
  {
    fieldE81PDTCCY.setString(newvalue);
  }

  /**
  * Get value of field E81PDTCCY as a String.
  */
  public String getE81PDTCCY()
  {
    return fieldE81PDTCCY.getString();
  }

  /**
  * Set field E81PDTGLN using a String value.
  */
  public void setE81PDTGLN(String newvalue)
  {
    fieldE81PDTGLN.setString(newvalue);
  }

  /**
  * Get value of field E81PDTGLN as a String.
  */
  public String getE81PDTGLN()
  {
    return fieldE81PDTGLN.getString();
  }

  /**
  * Set numeric field E81PDTGLN using a BigDecimal value.
  */
  public void setE81PDTGLN(BigDecimal newvalue)
  {
    fieldE81PDTGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81PDTGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81PDTGLN()
  {
    return fieldE81PDTGLN.getBigDecimal();
  }

  /**
  * Set field E81PDTACC using a String value.
  */
  public void setE81PDTACC(String newvalue)
  {
    fieldE81PDTACC.setString(newvalue);
  }

  /**
  * Get value of field E81PDTACC as a String.
  */
  public String getE81PDTACC()
  {
    return fieldE81PDTACC.getString();
  }

  /**
  * Set numeric field E81PDTACC using a BigDecimal value.
  */
  public void setE81PDTACC(BigDecimal newvalue)
  {
    fieldE81PDTACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81PDTACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81PDTACC()
  {
    return fieldE81PDTACC.getBigDecimal();
  }

  /**
  * Set field E81PDTPRI using a String value.
  */
  public void setE81PDTPRI(String newvalue)
  {
    fieldE81PDTPRI.setString(newvalue);
  }

  /**
  * Get value of field E81PDTPRI as a String.
  */
  public String getE81PDTPRI()
  {
    return fieldE81PDTPRI.getString();
  }

  /**
  * Set numeric field E81PDTPRI using a BigDecimal value.
  */
  public void setE81PDTPRI(BigDecimal newvalue)
  {
    fieldE81PDTPRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81PDTPRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81PDTPRI()
  {
    return fieldE81PDTPRI.getBigDecimal();
  }

  /**
  * Set field E81PDTPRD using a String value.
  */
  public void setE81PDTPRD(String newvalue)
  {
    fieldE81PDTPRD.setString(newvalue);
  }

  /**
  * Get value of field E81PDTPRD as a String.
  */
  public String getE81PDTPRD()
  {
    return fieldE81PDTPRD.getString();
  }

  /**
  * Set field E81DEACUN using a String value.
  */
  public void setE81DEACUN(String newvalue)
  {
    fieldE81DEACUN.setString(newvalue);
  }

  /**
  * Get value of field E81DEACUN as a String.
  */
  public String getE81DEACUN()
  {
    return fieldE81DEACUN.getString();
  }

  /**
  * Set numeric field E81DEACUN using a BigDecimal value.
  */
  public void setE81DEACUN(BigDecimal newvalue)
  {
    fieldE81DEACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81DEACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81DEACUN()
  {
    return fieldE81DEACUN.getBigDecimal();
  }

  /**
  * Set field E81DEAIVC using a String value.
  */
  public void setE81DEAIVC(String newvalue)
  {
    fieldE81DEAIVC.setString(newvalue);
  }

  /**
  * Get value of field E81DEAIVC as a String.
  */
  public String getE81DEAIVC()
  {
    return fieldE81DEAIVC.getString();
  }

  /**
  * Set field E81DEAODM using a String value.
  */
  public void setE81DEAODM(String newvalue)
  {
    fieldE81DEAODM.setString(newvalue);
  }

  /**
  * Get value of field E81DEAODM as a String.
  */
  public String getE81DEAODM()
  {
    return fieldE81DEAODM.getString();
  }

  /**
  * Set numeric field E81DEAODM using a BigDecimal value.
  */
  public void setE81DEAODM(BigDecimal newvalue)
  {
    fieldE81DEAODM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81DEAODM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81DEAODM()
  {
    return fieldE81DEAODM.getBigDecimal();
  }

  /**
  * Set field E81DEAODD using a String value.
  */
  public void setE81DEAODD(String newvalue)
  {
    fieldE81DEAODD.setString(newvalue);
  }

  /**
  * Get value of field E81DEAODD as a String.
  */
  public String getE81DEAODD()
  {
    return fieldE81DEAODD.getString();
  }

  /**
  * Set numeric field E81DEAODD using a BigDecimal value.
  */
  public void setE81DEAODD(BigDecimal newvalue)
  {
    fieldE81DEAODD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81DEAODD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81DEAODD()
  {
    return fieldE81DEAODD.getBigDecimal();
  }

  /**
  * Set field E81DEAODY using a String value.
  */
  public void setE81DEAODY(String newvalue)
  {
    fieldE81DEAODY.setString(newvalue);
  }

  /**
  * Get value of field E81DEAODY as a String.
  */
  public String getE81DEAODY()
  {
    return fieldE81DEAODY.getString();
  }

  /**
  * Set numeric field E81DEAODY using a BigDecimal value.
  */
  public void setE81DEAODY(BigDecimal newvalue)
  {
    fieldE81DEAODY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81DEAODY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81DEAODY()
  {
    return fieldE81DEAODY.getBigDecimal();
  }

  /**
  * Set field E81DEASPR using a String value.
  */
  public void setE81DEASPR(String newvalue)
  {
    fieldE81DEASPR.setString(newvalue);
  }

  /**
  * Get value of field E81DEASPR as a String.
  */
  public String getE81DEASPR()
  {
    return fieldE81DEASPR.getString();
  }

  /**
  * Set numeric field E81DEASPR using a BigDecimal value.
  */
  public void setE81DEASPR(BigDecimal newvalue)
  {
    fieldE81DEASPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81DEASPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81DEASPR()
  {
    return fieldE81DEASPR.getBigDecimal();
  }

  /**
  * Set field E81CUSNME using a String value.
  */
  public void setE81CUSNME(String newvalue)
  {
    fieldE81CUSNME.setString(newvalue);
  }

  /**
  * Get value of field E81CUSNME as a String.
  */
  public String getE81CUSNME()
  {
    return fieldE81CUSNME.getString();
  }

  /**
  * Set field E81CUSIDN using a String value.
  */
  public void setE81CUSIDN(String newvalue)
  {
    fieldE81CUSIDN.setString(newvalue);
  }

  /**
  * Get value of field E81CUSIDN as a String.
  */
  public String getE81CUSIDN()
  {
    return fieldE81CUSIDN.getString();
  }

}
