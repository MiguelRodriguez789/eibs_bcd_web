package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD600001 physical file definition.
* 
* File level identifier is 1161115185951.
* Record format level identifier is 41F48686B13A8.
*/

public class EDD600001Message extends MessageRecord
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
                                     "E01INSNAM",
                                     "E01INSAD1",
                                     "E01INSAD2",
                                     "E01INSAD3",
                                     "E01INSAD4",
                                     "E01INSAD5",
                                     "E01INSAD6",
                                     "E01INSCTY",
                                     "E01INSTAT",
                                     "E01INSCNT",
                                     "E01INSABA",
                                     "E01INSPHN",
                                     "E01INSMBR",
                                     "E01INSAB9",
                                     "E01INSSWF",
                                     "E01INSCSI",
                                     "E01INSBRN",
                                     "E01MTACCY",
                                     "E01MTAGLN",
                                     "E01MTAACC",
                                     "E01MTANAC",
                                     "E01MTAIBN",
                                     "D01MTANME",
                                     "D01MTAGLD"
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
                                   "E01INSNAM",
                                   "E01INSAD1",
                                   "E01INSAD2",
                                   "E01INSAD3",
                                   "E01INSAD4",
                                   "E01INSAD5",
                                   "E01INSAD6",
                                   "E01INSCTY",
                                   "E01INSTAT",
                                   "E01INSCNT",
                                   "E01INSABA",
                                   "E01INSPHN",
                                   "E01INSMBR",
                                   "E01INSAB9",
                                   "E01INSSWF",
                                   "E01INSCSI",
                                   "E01INSBRN",
                                   "E01MTACCY",
                                   "E01MTAGLN",
                                   "E01MTAACC",
                                   "E01MTANAC",
                                   "E01MTAIBN",
                                   "D01MTANME",
                                   "D01MTAGLD"
                                 };
  final static String fid = "1161115185951";
  final static String rid = "41F48686B13A8";
  final static String fmtname = "EDD600001";
  final int FIELDCOUNT = 33;
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
  private CharacterField fieldE01INSNAM = null;
  private CharacterField fieldE01INSAD1 = null;
  private CharacterField fieldE01INSAD2 = null;
  private CharacterField fieldE01INSAD3 = null;
  private CharacterField fieldE01INSAD4 = null;
  private CharacterField fieldE01INSAD5 = null;
  private CharacterField fieldE01INSAD6 = null;
  private CharacterField fieldE01INSCTY = null;
  private CharacterField fieldE01INSTAT = null;
  private CharacterField fieldE01INSCNT = null;
  private CharacterField fieldE01INSABA = null;
  private CharacterField fieldE01INSPHN = null;
  private CharacterField fieldE01INSMBR = null;
  private DecimalField fieldE01INSAB9 = null;
  private CharacterField fieldE01INSSWF = null;
  private CharacterField fieldE01INSCSI = null;
  private CharacterField fieldE01INSBRN = null;
  private CharacterField fieldE01MTACCY = null;
  private DecimalField fieldE01MTAGLN = null;
  private DecimalField fieldE01MTAACC = null;
  private CharacterField fieldE01MTANAC = null;
  private CharacterField fieldE01MTAIBN = null;
  private CharacterField fieldD01MTANME = null;
  private CharacterField fieldD01MTAGLD = null;

  /**
  * Constructor for EDD600001Message.
  */
  public EDD600001Message()
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
    recordsize = 775;
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
    fields[9] = fieldE01INSNAM =
    new CharacterField(message, HEADERSIZE + 42, 45, "E01INSNAM");
    fields[10] = fieldE01INSAD1 =
    new CharacterField(message, HEADERSIZE + 87, 45, "E01INSAD1");
    fields[11] = fieldE01INSAD2 =
    new CharacterField(message, HEADERSIZE + 132, 45, "E01INSAD2");
    fields[12] = fieldE01INSAD3 =
    new CharacterField(message, HEADERSIZE + 177, 45, "E01INSAD3");
    fields[13] = fieldE01INSAD4 =
    new CharacterField(message, HEADERSIZE + 222, 45, "E01INSAD4");
    fields[14] = fieldE01INSAD5 =
    new CharacterField(message, HEADERSIZE + 267, 45, "E01INSAD5");
    fields[15] = fieldE01INSAD6 =
    new CharacterField(message, HEADERSIZE + 312, 45, "E01INSAD6");
    fields[16] = fieldE01INSCTY =
    new CharacterField(message, HEADERSIZE + 357, 45, "E01INSCTY");
    fields[17] = fieldE01INSTAT =
    new CharacterField(message, HEADERSIZE + 402, 2, "E01INSTAT");
    fields[18] = fieldE01INSCNT =
    new CharacterField(message, HEADERSIZE + 404, 45, "E01INSCNT");
    fields[19] = fieldE01INSABA =
    new CharacterField(message, HEADERSIZE + 449, 25, "E01INSABA");
    fields[20] = fieldE01INSPHN =
    new CharacterField(message, HEADERSIZE + 474, 15, "E01INSPHN");
    fields[21] = fieldE01INSMBR =
    new CharacterField(message, HEADERSIZE + 489, 1, "E01INSMBR");
    fields[22] = fieldE01INSAB9 =
    new DecimalField(message, HEADERSIZE + 490, 10, 0, "E01INSAB9");
    fields[23] = fieldE01INSSWF =
    new CharacterField(message, HEADERSIZE + 500, 25, "E01INSSWF");
    fields[24] = fieldE01INSCSI =
    new CharacterField(message, HEADERSIZE + 525, 25, "E01INSCSI");
    fields[25] = fieldE01INSBRN =
    new CharacterField(message, HEADERSIZE + 550, 4, "E01INSBRN");
    fields[26] = fieldE01MTACCY =
    new CharacterField(message, HEADERSIZE + 554, 3, "E01MTACCY");
    fields[27] = fieldE01MTAGLN =
    new DecimalField(message, HEADERSIZE + 557, 17, 0, "E01MTAGLN");
    fields[28] = fieldE01MTAACC =
    new DecimalField(message, HEADERSIZE + 574, 13, 0, "E01MTAACC");
    fields[29] = fieldE01MTANAC =
    new CharacterField(message, HEADERSIZE + 587, 34, "E01MTANAC");
    fields[30] = fieldE01MTAIBN =
    new CharacterField(message, HEADERSIZE + 621, 34, "E01MTAIBN");
    fields[31] = fieldD01MTANME =
    new CharacterField(message, HEADERSIZE + 655, 60, "D01MTANME");
    fields[32] = fieldD01MTAGLD =
    new CharacterField(message, HEADERSIZE + 715, 60, "D01MTAGLD");

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
  * Set field E01INSNAM using a String value.
  */
  public void setE01INSNAM(String newvalue)
  {
    fieldE01INSNAM.setString(newvalue);
  }

  /**
  * Get value of field E01INSNAM as a String.
  */
  public String getE01INSNAM()
  {
    return fieldE01INSNAM.getString();
  }

  /**
  * Set field E01INSAD1 using a String value.
  */
  public void setE01INSAD1(String newvalue)
  {
    fieldE01INSAD1.setString(newvalue);
  }

  /**
  * Get value of field E01INSAD1 as a String.
  */
  public String getE01INSAD1()
  {
    return fieldE01INSAD1.getString();
  }

  /**
  * Set field E01INSAD2 using a String value.
  */
  public void setE01INSAD2(String newvalue)
  {
    fieldE01INSAD2.setString(newvalue);
  }

  /**
  * Get value of field E01INSAD2 as a String.
  */
  public String getE01INSAD2()
  {
    return fieldE01INSAD2.getString();
  }

  /**
  * Set field E01INSAD3 using a String value.
  */
  public void setE01INSAD3(String newvalue)
  {
    fieldE01INSAD3.setString(newvalue);
  }

  /**
  * Get value of field E01INSAD3 as a String.
  */
  public String getE01INSAD3()
  {
    return fieldE01INSAD3.getString();
  }

  /**
  * Set field E01INSAD4 using a String value.
  */
  public void setE01INSAD4(String newvalue)
  {
    fieldE01INSAD4.setString(newvalue);
  }

  /**
  * Get value of field E01INSAD4 as a String.
  */
  public String getE01INSAD4()
  {
    return fieldE01INSAD4.getString();
  }

  /**
  * Set field E01INSAD5 using a String value.
  */
  public void setE01INSAD5(String newvalue)
  {
    fieldE01INSAD5.setString(newvalue);
  }

  /**
  * Get value of field E01INSAD5 as a String.
  */
  public String getE01INSAD5()
  {
    return fieldE01INSAD5.getString();
  }

  /**
  * Set field E01INSAD6 using a String value.
  */
  public void setE01INSAD6(String newvalue)
  {
    fieldE01INSAD6.setString(newvalue);
  }

  /**
  * Get value of field E01INSAD6 as a String.
  */
  public String getE01INSAD6()
  {
    return fieldE01INSAD6.getString();
  }

  /**
  * Set field E01INSCTY using a String value.
  */
  public void setE01INSCTY(String newvalue)
  {
    fieldE01INSCTY.setString(newvalue);
  }

  /**
  * Get value of field E01INSCTY as a String.
  */
  public String getE01INSCTY()
  {
    return fieldE01INSCTY.getString();
  }

  /**
  * Set field E01INSTAT using a String value.
  */
  public void setE01INSTAT(String newvalue)
  {
    fieldE01INSTAT.setString(newvalue);
  }

  /**
  * Get value of field E01INSTAT as a String.
  */
  public String getE01INSTAT()
  {
    return fieldE01INSTAT.getString();
  }

  /**
  * Set field E01INSCNT using a String value.
  */
  public void setE01INSCNT(String newvalue)
  {
    fieldE01INSCNT.setString(newvalue);
  }

  /**
  * Get value of field E01INSCNT as a String.
  */
  public String getE01INSCNT()
  {
    return fieldE01INSCNT.getString();
  }

  /**
  * Set field E01INSABA using a String value.
  */
  public void setE01INSABA(String newvalue)
  {
    fieldE01INSABA.setString(newvalue);
  }

  /**
  * Get value of field E01INSABA as a String.
  */
  public String getE01INSABA()
  {
    return fieldE01INSABA.getString();
  }

  /**
  * Set field E01INSPHN using a String value.
  */
  public void setE01INSPHN(String newvalue)
  {
    fieldE01INSPHN.setString(newvalue);
  }

  /**
  * Get value of field E01INSPHN as a String.
  */
  public String getE01INSPHN()
  {
    return fieldE01INSPHN.getString();
  }

  /**
  * Set field E01INSMBR using a String value.
  */
  public void setE01INSMBR(String newvalue)
  {
    fieldE01INSMBR.setString(newvalue);
  }

  /**
  * Get value of field E01INSMBR as a String.
  */
  public String getE01INSMBR()
  {
    return fieldE01INSMBR.getString();
  }

  /**
  * Set field E01INSAB9 using a String value.
  */
  public void setE01INSAB9(String newvalue)
  {
    fieldE01INSAB9.setString(newvalue);
  }

  /**
  * Get value of field E01INSAB9 as a String.
  */
  public String getE01INSAB9()
  {
    return fieldE01INSAB9.getString();
  }

  /**
  * Set numeric field E01INSAB9 using a BigDecimal value.
  */
  public void setE01INSAB9(BigDecimal newvalue)
  {
    fieldE01INSAB9.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01INSAB9 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01INSAB9()
  {
    return fieldE01INSAB9.getBigDecimal();
  }

  /**
  * Set field E01INSSWF using a String value.
  */
  public void setE01INSSWF(String newvalue)
  {
    fieldE01INSSWF.setString(newvalue);
  }

  /**
  * Get value of field E01INSSWF as a String.
  */
  public String getE01INSSWF()
  {
    return fieldE01INSSWF.getString();
  }

  /**
  * Set field E01INSCSI using a String value.
  */
  public void setE01INSCSI(String newvalue)
  {
    fieldE01INSCSI.setString(newvalue);
  }

  /**
  * Get value of field E01INSCSI as a String.
  */
  public String getE01INSCSI()
  {
    return fieldE01INSCSI.getString();
  }

  /**
  * Set field E01INSBRN using a String value.
  */
  public void setE01INSBRN(String newvalue)
  {
    fieldE01INSBRN.setString(newvalue);
  }

  /**
  * Get value of field E01INSBRN as a String.
  */
  public String getE01INSBRN()
  {
    return fieldE01INSBRN.getString();
  }

  /**
  * Set field E01MTACCY using a String value.
  */
  public void setE01MTACCY(String newvalue)
  {
    fieldE01MTACCY.setString(newvalue);
  }

  /**
  * Get value of field E01MTACCY as a String.
  */
  public String getE01MTACCY()
  {
    return fieldE01MTACCY.getString();
  }

  /**
  * Set field E01MTAGLN using a String value.
  */
  public void setE01MTAGLN(String newvalue)
  {
    fieldE01MTAGLN.setString(newvalue);
  }

  /**
  * Get value of field E01MTAGLN as a String.
  */
  public String getE01MTAGLN()
  {
    return fieldE01MTAGLN.getString();
  }

  /**
  * Set numeric field E01MTAGLN using a BigDecimal value.
  */
  public void setE01MTAGLN(BigDecimal newvalue)
  {
    fieldE01MTAGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MTAGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MTAGLN()
  {
    return fieldE01MTAGLN.getBigDecimal();
  }

  /**
  * Set field E01MTAACC using a String value.
  */
  public void setE01MTAACC(String newvalue)
  {
    fieldE01MTAACC.setString(newvalue);
  }

  /**
  * Get value of field E01MTAACC as a String.
  */
  public String getE01MTAACC()
  {
    return fieldE01MTAACC.getString();
  }

  /**
  * Set numeric field E01MTAACC using a BigDecimal value.
  */
  public void setE01MTAACC(BigDecimal newvalue)
  {
    fieldE01MTAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MTAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MTAACC()
  {
    return fieldE01MTAACC.getBigDecimal();
  }

  /**
  * Set field E01MTANAC using a String value.
  */
  public void setE01MTANAC(String newvalue)
  {
    fieldE01MTANAC.setString(newvalue);
  }

  /**
  * Get value of field E01MTANAC as a String.
  */
  public String getE01MTANAC()
  {
    return fieldE01MTANAC.getString();
  }

  /**
  * Set field E01MTAIBN using a String value.
  */
  public void setE01MTAIBN(String newvalue)
  {
    fieldE01MTAIBN.setString(newvalue);
  }

  /**
  * Get value of field E01MTAIBN as a String.
  */
  public String getE01MTAIBN()
  {
    return fieldE01MTAIBN.getString();
  }

  /**
  * Set field D01MTANME using a String value.
  */
  public void setD01MTANME(String newvalue)
  {
    fieldD01MTANME.setString(newvalue);
  }

  /**
  * Get value of field D01MTANME as a String.
  */
  public String getD01MTANME()
  {
    return fieldD01MTANME.getString();
  }

  /**
  * Set field D01MTAGLD using a String value.
  */
  public void setD01MTAGLD(String newvalue)
  {
    fieldD01MTAGLD.setString(newvalue);
  }

  /**
  * Get value of field D01MTAGLD as a String.
  */
  public String getD01MTAGLD()
  {
    return fieldD01MTAGLD.getString();
  }

}
