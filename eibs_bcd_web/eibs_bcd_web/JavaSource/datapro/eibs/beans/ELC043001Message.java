package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC043001 physical file definition.
* 
* File level identifier is 1160706152242.
* Record format level identifier is 4142CAC713C08.
*/

public class ELC043001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USERID",
                                     "H01PROGRM",
                                     "H01TIMSYS",
                                     "H01SCRCOD",
                                     "H01OPECOD",
                                     "H01FLGMAS",
                                     "H01FLGWK1",
                                     "H01FLGWK2",
                                     "H01FLGWK3",
                                     "E01DIPACC",
                                     "E01DIPCOR",
                                     "E01DIPTYP",
                                     "E01DIPNDI",
                                     "E01DIPFDM",
                                     "E01DIPFDD",
                                     "E01DIPFDY",
                                     "E01DDIMTO",
                                     "E01DIPMTX",
                                     "E01DIPMTN",
                                     "E01DIPTAS",
                                     "E01DIPTAN",
                                     "E01DIPNPR",
                                     "E01DIPTUP",
                                     "E01DIPCCY",
                                     "E01DIPREX",
                                     "E01DIPIMP",
                                     "E01DDICUN",
                                     "E01DIPRUT",
                                     "E01CUSNME",
                                     "E01INDOPE"
                                   };
  final static String tnames[] = {
                                   "H01USERID",
                                   "H01PROGRM",
                                   "H01TIMSYS",
                                   "H01SCRCOD",
                                   "H01OPECOD",
                                   "H01FLGMAS",
                                   "H01FLGWK1",
                                   "H01FLGWK2",
                                   "H01FLGWK3",
                                   "E01DIPACC",
                                   "E01DIPCOR",
                                   "E01DIPTYP",
                                   "E01DIPNDI",
                                   "E01DIPFDM",
                                   "E01DIPFDD",
                                   "E01DIPFDY",
                                   "E01DDIMTO",
                                   "E01DIPMTX",
                                   "E01DIPMTN",
                                   "E01DIPTAS",
                                   "E01DIPTAN",
                                   "E01DIPNPR",
                                   "E01DIPTUP",
                                   "E01DIPCCY",
                                   "E01DIPREX",
                                   "E01DIPIMP",
                                   "E01DDICUN",
                                   "E01DIPRUT",
                                   "E01CUSNME",
                                   "E01INDOPE"
                                 };
  final static String fid = "1160706152242";
  final static String rid = "4142CAC713C08";
  final static String fmtname = "ELC043001";
  final int FIELDCOUNT = 30;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCRCOD = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private DecimalField fieldE01DIPACC = null;
  private DecimalField fieldE01DIPCOR = null;
  private CharacterField fieldE01DIPTYP = null;
  private CharacterField fieldE01DIPNDI = null;
  private DecimalField fieldE01DIPFDM = null;
  private DecimalField fieldE01DIPFDD = null;
  private DecimalField fieldE01DIPFDY = null;
  private DecimalField fieldE01DDIMTO = null;
  private DecimalField fieldE01DIPMTX = null;
  private DecimalField fieldE01DIPMTN = null;
  private DecimalField fieldE01DIPTAS = null;
  private DecimalField fieldE01DIPTAN = null;
  private DecimalField fieldE01DIPNPR = null;
  private DecimalField fieldE01DIPTUP = null;
  private CharacterField fieldE01DIPCCY = null;
  private DecimalField fieldE01DIPREX = null;
  private DecimalField fieldE01DIPIMP = null;
  private DecimalField fieldE01DDICUN = null;
  private CharacterField fieldE01DIPRUT = null;
  private CharacterField fieldE01CUSNME = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ELC043001Message.
  */
  public ELC043001Message()
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
    recordsize = 271;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USERID");
    fields[1] = fieldH01PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PROGRM");
    fields[2] = fieldH01TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIMSYS");
    fields[3] = fieldH01SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCRCOD");
    fields[4] = fieldH01OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPECOD");
    fields[5] = fieldH01FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01FLGMAS");
    fields[6] = fieldH01FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01FLGWK1");
    fields[7] = fieldH01FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01FLGWK2");
    fields[8] = fieldH01FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01FLGWK3");
    fields[9] = fieldE01DIPACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01DIPACC");
    fields[10] = fieldE01DIPCOR =
    new DecimalField(message, HEADERSIZE + 55, 4, 0, "E01DIPCOR");
    fields[11] = fieldE01DIPTYP =
    new CharacterField(message, HEADERSIZE + 59, 1, "E01DIPTYP");
    fields[12] = fieldE01DIPNDI =
    new CharacterField(message, HEADERSIZE + 60, 20, "E01DIPNDI");
    fields[13] = fieldE01DIPFDM =
    new DecimalField(message, HEADERSIZE + 80, 3, 0, "E01DIPFDM");
    fields[14] = fieldE01DIPFDD =
    new DecimalField(message, HEADERSIZE + 83, 3, 0, "E01DIPFDD");
    fields[15] = fieldE01DIPFDY =
    new DecimalField(message, HEADERSIZE + 86, 5, 0, "E01DIPFDY");
    fields[16] = fieldE01DDIMTO =
    new DecimalField(message, HEADERSIZE + 91, 15, 2, "E01DDIMTO");
    fields[17] = fieldE01DIPMTX =
    new DecimalField(message, HEADERSIZE + 106, 15, 2, "E01DIPMTX");
    fields[18] = fieldE01DIPMTN =
    new DecimalField(message, HEADERSIZE + 121, 17, 2, "E01DIPMTN");
    fields[19] = fieldE01DIPTAS =
    new DecimalField(message, HEADERSIZE + 138, 11, 6, "E01DIPTAS");
    fields[20] = fieldE01DIPTAN =
    new DecimalField(message, HEADERSIZE + 149, 11, 6, "E01DIPTAN");
    fields[21] = fieldE01DIPNPR =
    new DecimalField(message, HEADERSIZE + 160, 3, 0, "E01DIPNPR");
    fields[22] = fieldE01DIPTUP =
    new DecimalField(message, HEADERSIZE + 163, 11, 6, "E01DIPTUP");
    fields[23] = fieldE01DIPCCY =
    new CharacterField(message, HEADERSIZE + 174, 3, "E01DIPCCY");
    fields[24] = fieldE01DIPREX =
    new DecimalField(message, HEADERSIZE + 177, 13, 6, "E01DIPREX");
    fields[25] = fieldE01DIPIMP =
    new DecimalField(message, HEADERSIZE + 190, 15, 2, "E01DIPIMP");
    fields[26] = fieldE01DDICUN =
    new DecimalField(message, HEADERSIZE + 205, 10, 0, "E01DDICUN");
    fields[27] = fieldE01DIPRUT =
    new CharacterField(message, HEADERSIZE + 215, 10, "E01DIPRUT");
    fields[28] = fieldE01CUSNME =
    new CharacterField(message, HEADERSIZE + 225, 45, "E01CUSNME");
    fields[29] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 270, 1, "E01INDOPE");

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
  * Set field H01USERID using a String value.
  */
  public void setH01USERID(String newvalue)
  {
    fieldH01USERID.setString(newvalue);
  }

  /**
  * Get value of field H01USERID as a String.
  */
  public String getH01USERID()
  {
    return fieldH01USERID.getString();
  }

  /**
  * Set field H01PROGRM using a String value.
  */
  public void setH01PROGRM(String newvalue)
  {
    fieldH01PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H01PROGRM as a String.
  */
  public String getH01PROGRM()
  {
    return fieldH01PROGRM.getString();
  }

  /**
  * Set field H01TIMSYS using a String value.
  */
  public void setH01TIMSYS(String newvalue)
  {
    fieldH01TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H01TIMSYS as a String.
  */
  public String getH01TIMSYS()
  {
    return fieldH01TIMSYS.getString();
  }

  /**
  * Set field H01SCRCOD using a String value.
  */
  public void setH01SCRCOD(String newvalue)
  {
    fieldH01SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H01SCRCOD as a String.
  */
  public String getH01SCRCOD()
  {
    return fieldH01SCRCOD.getString();
  }

  /**
  * Set field H01OPECOD using a String value.
  */
  public void setH01OPECOD(String newvalue)
  {
    fieldH01OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H01OPECOD as a String.
  */
  public String getH01OPECOD()
  {
    return fieldH01OPECOD.getString();
  }

  /**
  * Set field H01FLGMAS using a String value.
  */
  public void setH01FLGMAS(String newvalue)
  {
    fieldH01FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H01FLGMAS as a String.
  */
  public String getH01FLGMAS()
  {
    return fieldH01FLGMAS.getString();
  }

  /**
  * Set field H01FLGWK1 using a String value.
  */
  public void setH01FLGWK1(String newvalue)
  {
    fieldH01FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK1 as a String.
  */
  public String getH01FLGWK1()
  {
    return fieldH01FLGWK1.getString();
  }

  /**
  * Set field H01FLGWK2 using a String value.
  */
  public void setH01FLGWK2(String newvalue)
  {
    fieldH01FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK2 as a String.
  */
  public String getH01FLGWK2()
  {
    return fieldH01FLGWK2.getString();
  }

  /**
  * Set field H01FLGWK3 using a String value.
  */
  public void setH01FLGWK3(String newvalue)
  {
    fieldH01FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK3 as a String.
  */
  public String getH01FLGWK3()
  {
    return fieldH01FLGWK3.getString();
  }

  /**
  * Set field E01DIPACC using a String value.
  */
  public void setE01DIPACC(String newvalue)
  {
    fieldE01DIPACC.setString(newvalue);
  }

  /**
  * Get value of field E01DIPACC as a String.
  */
  public String getE01DIPACC()
  {
    return fieldE01DIPACC.getString();
  }

  /**
  * Set numeric field E01DIPACC using a BigDecimal value.
  */
  public void setE01DIPACC(BigDecimal newvalue)
  {
    fieldE01DIPACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPACC()
  {
    return fieldE01DIPACC.getBigDecimal();
  }

  /**
  * Set field E01DIPCOR using a String value.
  */
  public void setE01DIPCOR(String newvalue)
  {
    fieldE01DIPCOR.setString(newvalue);
  }

  /**
  * Get value of field E01DIPCOR as a String.
  */
  public String getE01DIPCOR()
  {
    return fieldE01DIPCOR.getString();
  }

  /**
  * Set numeric field E01DIPCOR using a BigDecimal value.
  */
  public void setE01DIPCOR(BigDecimal newvalue)
  {
    fieldE01DIPCOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPCOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPCOR()
  {
    return fieldE01DIPCOR.getBigDecimal();
  }

  /**
  * Set field E01DIPTYP using a String value.
  */
  public void setE01DIPTYP(String newvalue)
  {
    fieldE01DIPTYP.setString(newvalue);
  }

  /**
  * Get value of field E01DIPTYP as a String.
  */
  public String getE01DIPTYP()
  {
    return fieldE01DIPTYP.getString();
  }

  /**
  * Set field E01DIPNDI using a String value.
  */
  public void setE01DIPNDI(String newvalue)
  {
    fieldE01DIPNDI.setString(newvalue);
  }

  /**
  * Get value of field E01DIPNDI as a String.
  */
  public String getE01DIPNDI()
  {
    return fieldE01DIPNDI.getString();
  }

  /**
  * Set field E01DIPFDM using a String value.
  */
  public void setE01DIPFDM(String newvalue)
  {
    fieldE01DIPFDM.setString(newvalue);
  }

  /**
  * Get value of field E01DIPFDM as a String.
  */
  public String getE01DIPFDM()
  {
    return fieldE01DIPFDM.getString();
  }

  /**
  * Set numeric field E01DIPFDM using a BigDecimal value.
  */
  public void setE01DIPFDM(BigDecimal newvalue)
  {
    fieldE01DIPFDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPFDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPFDM()
  {
    return fieldE01DIPFDM.getBigDecimal();
  }

  /**
  * Set field E01DIPFDD using a String value.
  */
  public void setE01DIPFDD(String newvalue)
  {
    fieldE01DIPFDD.setString(newvalue);
  }

  /**
  * Get value of field E01DIPFDD as a String.
  */
  public String getE01DIPFDD()
  {
    return fieldE01DIPFDD.getString();
  }

  /**
  * Set numeric field E01DIPFDD using a BigDecimal value.
  */
  public void setE01DIPFDD(BigDecimal newvalue)
  {
    fieldE01DIPFDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPFDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPFDD()
  {
    return fieldE01DIPFDD.getBigDecimal();
  }

  /**
  * Set field E01DIPFDY using a String value.
  */
  public void setE01DIPFDY(String newvalue)
  {
    fieldE01DIPFDY.setString(newvalue);
  }

  /**
  * Get value of field E01DIPFDY as a String.
  */
  public String getE01DIPFDY()
  {
    return fieldE01DIPFDY.getString();
  }

  /**
  * Set numeric field E01DIPFDY using a BigDecimal value.
  */
  public void setE01DIPFDY(BigDecimal newvalue)
  {
    fieldE01DIPFDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPFDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPFDY()
  {
    return fieldE01DIPFDY.getBigDecimal();
  }

  /**
  * Set field E01DDIMTO using a String value.
  */
  public void setE01DDIMTO(String newvalue)
  {
    fieldE01DDIMTO.setString(newvalue);
  }

  /**
  * Get value of field E01DDIMTO as a String.
  */
  public String getE01DDIMTO()
  {
    return fieldE01DDIMTO.getString();
  }

  /**
  * Set numeric field E01DDIMTO using a BigDecimal value.
  */
  public void setE01DDIMTO(BigDecimal newvalue)
  {
    fieldE01DDIMTO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDIMTO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDIMTO()
  {
    return fieldE01DDIMTO.getBigDecimal();
  }

  /**
  * Set field E01DIPMTX using a String value.
  */
  public void setE01DIPMTX(String newvalue)
  {
    fieldE01DIPMTX.setString(newvalue);
  }

  /**
  * Get value of field E01DIPMTX as a String.
  */
  public String getE01DIPMTX()
  {
    return fieldE01DIPMTX.getString();
  }

  /**
  * Set numeric field E01DIPMTX using a BigDecimal value.
  */
  public void setE01DIPMTX(BigDecimal newvalue)
  {
    fieldE01DIPMTX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPMTX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPMTX()
  {
    return fieldE01DIPMTX.getBigDecimal();
  }

  /**
  * Set field E01DIPMTN using a String value.
  */
  public void setE01DIPMTN(String newvalue)
  {
    fieldE01DIPMTN.setString(newvalue);
  }

  /**
  * Get value of field E01DIPMTN as a String.
  */
  public String getE01DIPMTN()
  {
    return fieldE01DIPMTN.getString();
  }

  /**
  * Set numeric field E01DIPMTN using a BigDecimal value.
  */
  public void setE01DIPMTN(BigDecimal newvalue)
  {
    fieldE01DIPMTN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPMTN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPMTN()
  {
    return fieldE01DIPMTN.getBigDecimal();
  }

  /**
  * Set field E01DIPTAS using a String value.
  */
  public void setE01DIPTAS(String newvalue)
  {
    fieldE01DIPTAS.setString(newvalue);
  }

  /**
  * Get value of field E01DIPTAS as a String.
  */
  public String getE01DIPTAS()
  {
    return fieldE01DIPTAS.getString();
  }

  /**
  * Set numeric field E01DIPTAS using a BigDecimal value.
  */
  public void setE01DIPTAS(BigDecimal newvalue)
  {
    fieldE01DIPTAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPTAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPTAS()
  {
    return fieldE01DIPTAS.getBigDecimal();
  }

  /**
  * Set field E01DIPTAN using a String value.
  */
  public void setE01DIPTAN(String newvalue)
  {
    fieldE01DIPTAN.setString(newvalue);
  }

  /**
  * Get value of field E01DIPTAN as a String.
  */
  public String getE01DIPTAN()
  {
    return fieldE01DIPTAN.getString();
  }

  /**
  * Set numeric field E01DIPTAN using a BigDecimal value.
  */
  public void setE01DIPTAN(BigDecimal newvalue)
  {
    fieldE01DIPTAN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPTAN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPTAN()
  {
    return fieldE01DIPTAN.getBigDecimal();
  }

  /**
  * Set field E01DIPNPR using a String value.
  */
  public void setE01DIPNPR(String newvalue)
  {
    fieldE01DIPNPR.setString(newvalue);
  }

  /**
  * Get value of field E01DIPNPR as a String.
  */
  public String getE01DIPNPR()
  {
    return fieldE01DIPNPR.getString();
  }

  /**
  * Set numeric field E01DIPNPR using a BigDecimal value.
  */
  public void setE01DIPNPR(BigDecimal newvalue)
  {
    fieldE01DIPNPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPNPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPNPR()
  {
    return fieldE01DIPNPR.getBigDecimal();
  }

  /**
  * Set field E01DIPTUP using a String value.
  */
  public void setE01DIPTUP(String newvalue)
  {
    fieldE01DIPTUP.setString(newvalue);
  }

  /**
  * Get value of field E01DIPTUP as a String.
  */
  public String getE01DIPTUP()
  {
    return fieldE01DIPTUP.getString();
  }

  /**
  * Set numeric field E01DIPTUP using a BigDecimal value.
  */
  public void setE01DIPTUP(BigDecimal newvalue)
  {
    fieldE01DIPTUP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPTUP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPTUP()
  {
    return fieldE01DIPTUP.getBigDecimal();
  }

  /**
  * Set field E01DIPCCY using a String value.
  */
  public void setE01DIPCCY(String newvalue)
  {
    fieldE01DIPCCY.setString(newvalue);
  }

  /**
  * Get value of field E01DIPCCY as a String.
  */
  public String getE01DIPCCY()
  {
    return fieldE01DIPCCY.getString();
  }

  /**
  * Set field E01DIPREX using a String value.
  */
  public void setE01DIPREX(String newvalue)
  {
    fieldE01DIPREX.setString(newvalue);
  }

  /**
  * Get value of field E01DIPREX as a String.
  */
  public String getE01DIPREX()
  {
    return fieldE01DIPREX.getString();
  }

  /**
  * Set numeric field E01DIPREX using a BigDecimal value.
  */
  public void setE01DIPREX(BigDecimal newvalue)
  {
    fieldE01DIPREX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPREX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPREX()
  {
    return fieldE01DIPREX.getBigDecimal();
  }

  /**
  * Set field E01DIPIMP using a String value.
  */
  public void setE01DIPIMP(String newvalue)
  {
    fieldE01DIPIMP.setString(newvalue);
  }

  /**
  * Get value of field E01DIPIMP as a String.
  */
  public String getE01DIPIMP()
  {
    return fieldE01DIPIMP.getString();
  }

  /**
  * Set numeric field E01DIPIMP using a BigDecimal value.
  */
  public void setE01DIPIMP(BigDecimal newvalue)
  {
    fieldE01DIPIMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DIPIMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DIPIMP()
  {
    return fieldE01DIPIMP.getBigDecimal();
  }

  /**
  * Set field E01DDICUN using a String value.
  */
  public void setE01DDICUN(String newvalue)
  {
    fieldE01DDICUN.setString(newvalue);
  }

  /**
  * Get value of field E01DDICUN as a String.
  */
  public String getE01DDICUN()
  {
    return fieldE01DDICUN.getString();
  }

  /**
  * Set numeric field E01DDICUN using a BigDecimal value.
  */
  public void setE01DDICUN(BigDecimal newvalue)
  {
    fieldE01DDICUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDICUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDICUN()
  {
    return fieldE01DDICUN.getBigDecimal();
  }

  /**
  * Set field E01DIPRUT using a String value.
  */
  public void setE01DIPRUT(String newvalue)
  {
    fieldE01DIPRUT.setString(newvalue);
  }

  /**
  * Get value of field E01DIPRUT as a String.
  */
  public String getE01DIPRUT()
  {
    return fieldE01DIPRUT.getString();
  }

  /**
  * Set field E01CUSNME using a String value.
  */
  public void setE01CUSNME(String newvalue)
  {
    fieldE01CUSNME.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNME as a String.
  */
  public String getE01CUSNME()
  {
    return fieldE01CUSNME.getString();
  }

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
