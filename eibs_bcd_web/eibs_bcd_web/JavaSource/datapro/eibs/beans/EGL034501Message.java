package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGL034501 physical file definition.
* 
* File level identifier is 1130611113202.
* Record format level identifier is 361D3BC810E41.
*/

public class EGL034501Message extends MessageRecord
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
                                     "E01BUMBNK",
                                     "E01BUMBRN",
                                     "E01BUMCCY",
                                     "E01BUMNUM",
                                     "E01BUMCCN",
                                     "E01BUMNME",
                                     "E01BUMJAU",
                                     "E01BUMFEU",
                                     "E01BUMMAU",
                                     "E01BUMAPU",
                                     "E01BUMMYU",
                                     "E01BUMJUU",
                                     "E01BUMJLU",
                                     "E01BUMAUU",
                                     "E01BUMSEU",
                                     "E01BUMOCU",
                                     "E01BUMNOU",
                                     "E01BUMDEU"
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
                                   "E01BUMBNK",
                                   "E01BUMBRN",
                                   "E01BUMCCY",
                                   "E01BUMNUM",
                                   "E01BUMCCN",
                                   "E01BUMNME",
                                   "E01BUMJAU",
                                   "E01BUMFEU",
                                   "E01BUMMAU",
                                   "E01BUMAPU",
                                   "E01BUMMYU",
                                   "E01BUMJUU",
                                   "E01BUMJLU",
                                   "E01BUMAUU",
                                   "E01BUMSEU",
                                   "E01BUMOCU",
                                   "E01BUMNOU",
                                   "E01BUMDEU"
                                 };
  final static String fid = "1130611113202";
  final static String rid = "361D3BC810E41";
  final static String fmtname = "EGL034501";
  final int FIELDCOUNT = 27;
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
  private CharacterField fieldE01BUMBNK = null;
  private DecimalField fieldE01BUMBRN = null;
  private CharacterField fieldE01BUMCCY = null;
  private DecimalField fieldE01BUMNUM = null;
  private DecimalField fieldE01BUMCCN = null;
  private CharacterField fieldE01BUMNME = null;
  private DecimalField fieldE01BUMJAU = null;
  private DecimalField fieldE01BUMFEU = null;
  private DecimalField fieldE01BUMMAU = null;
  private DecimalField fieldE01BUMAPU = null;
  private DecimalField fieldE01BUMMYU = null;
  private DecimalField fieldE01BUMJUU = null;
  private DecimalField fieldE01BUMJLU = null;
  private DecimalField fieldE01BUMAUU = null;
  private DecimalField fieldE01BUMSEU = null;
  private DecimalField fieldE01BUMOCU = null;
  private DecimalField fieldE01BUMNOU = null;
  private DecimalField fieldE01BUMDEU = null;

  /**
  * Constructor for EGL034501Message.
  */
  public EGL034501Message()
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
    recordsize = 291;
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
    fields[9] = fieldE01BUMBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01BUMBNK");
    fields[10] = fieldE01BUMBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E01BUMBRN");
    fields[11] = fieldE01BUMCCY =
    new CharacterField(message, HEADERSIZE + 49, 3, "E01BUMCCY");
    fields[12] = fieldE01BUMNUM =
    new DecimalField(message, HEADERSIZE + 52, 17, 0, "E01BUMNUM");
    fields[13] = fieldE01BUMCCN =
    new DecimalField(message, HEADERSIZE + 69, 9, 0, "E01BUMCCN");
    fields[14] = fieldE01BUMNME =
    new CharacterField(message, HEADERSIZE + 78, 45, "E01BUMNME");
    fields[15] = fieldE01BUMJAU =
    new DecimalField(message, HEADERSIZE + 123, 14, 0, "E01BUMJAU");
    fields[16] = fieldE01BUMFEU =
    new DecimalField(message, HEADERSIZE + 137, 14, 0, "E01BUMFEU");
    fields[17] = fieldE01BUMMAU =
    new DecimalField(message, HEADERSIZE + 151, 14, 0, "E01BUMMAU");
    fields[18] = fieldE01BUMAPU =
    new DecimalField(message, HEADERSIZE + 165, 14, 0, "E01BUMAPU");
    fields[19] = fieldE01BUMMYU =
    new DecimalField(message, HEADERSIZE + 179, 14, 0, "E01BUMMYU");
    fields[20] = fieldE01BUMJUU =
    new DecimalField(message, HEADERSIZE + 193, 14, 0, "E01BUMJUU");
    fields[21] = fieldE01BUMJLU =
    new DecimalField(message, HEADERSIZE + 207, 14, 0, "E01BUMJLU");
    fields[22] = fieldE01BUMAUU =
    new DecimalField(message, HEADERSIZE + 221, 14, 0, "E01BUMAUU");
    fields[23] = fieldE01BUMSEU =
    new DecimalField(message, HEADERSIZE + 235, 14, 0, "E01BUMSEU");
    fields[24] = fieldE01BUMOCU =
    new DecimalField(message, HEADERSIZE + 249, 14, 0, "E01BUMOCU");
    fields[25] = fieldE01BUMNOU =
    new DecimalField(message, HEADERSIZE + 263, 14, 0, "E01BUMNOU");
    fields[26] = fieldE01BUMDEU =
    new DecimalField(message, HEADERSIZE + 277, 14, 0, "E01BUMDEU");

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
  * Set field E01BUMBNK using a String value.
  */
  public void setE01BUMBNK(String newvalue)
  {
    fieldE01BUMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01BUMBNK as a String.
  */
  public String getE01BUMBNK()
  {
    return fieldE01BUMBNK.getString();
  }

  /**
  * Set field E01BUMBRN using a String value.
  */
  public void setE01BUMBRN(String newvalue)
  {
    fieldE01BUMBRN.setString(newvalue);
  }

  /**
  * Get value of field E01BUMBRN as a String.
  */
  public String getE01BUMBRN()
  {
    return fieldE01BUMBRN.getString();
  }

  /**
  * Set numeric field E01BUMBRN using a BigDecimal value.
  */
  public void setE01BUMBRN(BigDecimal newvalue)
  {
    fieldE01BUMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMBRN()
  {
    return fieldE01BUMBRN.getBigDecimal();
  }

  /**
  * Set field E01BUMCCY using a String value.
  */
  public void setE01BUMCCY(String newvalue)
  {
    fieldE01BUMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01BUMCCY as a String.
  */
  public String getE01BUMCCY()
  {
    return fieldE01BUMCCY.getString();
  }

  /**
  * Set field E01BUMNUM using a String value.
  */
  public void setE01BUMNUM(String newvalue)
  {
    fieldE01BUMNUM.setString(newvalue);
  }

  /**
  * Get value of field E01BUMNUM as a String.
  */
  public String getE01BUMNUM()
  {
    return fieldE01BUMNUM.getString();
  }

  /**
  * Set numeric field E01BUMNUM using a BigDecimal value.
  */
  public void setE01BUMNUM(BigDecimal newvalue)
  {
    fieldE01BUMNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMNUM()
  {
    return fieldE01BUMNUM.getBigDecimal();
  }

  /**
  * Set field E01BUMCCN using a String value.
  */
  public void setE01BUMCCN(String newvalue)
  {
    fieldE01BUMCCN.setString(newvalue);
  }

  /**
  * Get value of field E01BUMCCN as a String.
  */
  public String getE01BUMCCN()
  {
    return fieldE01BUMCCN.getString();
  }

  /**
  * Set numeric field E01BUMCCN using a BigDecimal value.
  */
  public void setE01BUMCCN(BigDecimal newvalue)
  {
    fieldE01BUMCCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMCCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMCCN()
  {
    return fieldE01BUMCCN.getBigDecimal();
  }

  /**
  * Set field E01BUMNME using a String value.
  */
  public void setE01BUMNME(String newvalue)
  {
    fieldE01BUMNME.setString(newvalue);
  }

  /**
  * Get value of field E01BUMNME as a String.
  */
  public String getE01BUMNME()
  {
    return fieldE01BUMNME.getString();
  }

  /**
  * Set field E01BUMJAU using a String value.
  */
  public void setE01BUMJAU(String newvalue)
  {
    fieldE01BUMJAU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMJAU as a String.
  */
  public String getE01BUMJAU()
  {
    return fieldE01BUMJAU.getString();
  }

  /**
  * Set numeric field E01BUMJAU using a BigDecimal value.
  */
  public void setE01BUMJAU(BigDecimal newvalue)
  {
    fieldE01BUMJAU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMJAU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMJAU()
  {
    return fieldE01BUMJAU.getBigDecimal();
  }

  /**
  * Set field E01BUMFEU using a String value.
  */
  public void setE01BUMFEU(String newvalue)
  {
    fieldE01BUMFEU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMFEU as a String.
  */
  public String getE01BUMFEU()
  {
    return fieldE01BUMFEU.getString();
  }

  /**
  * Set numeric field E01BUMFEU using a BigDecimal value.
  */
  public void setE01BUMFEU(BigDecimal newvalue)
  {
    fieldE01BUMFEU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMFEU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMFEU()
  {
    return fieldE01BUMFEU.getBigDecimal();
  }

  /**
  * Set field E01BUMMAU using a String value.
  */
  public void setE01BUMMAU(String newvalue)
  {
    fieldE01BUMMAU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMMAU as a String.
  */
  public String getE01BUMMAU()
  {
    return fieldE01BUMMAU.getString();
  }

  /**
  * Set numeric field E01BUMMAU using a BigDecimal value.
  */
  public void setE01BUMMAU(BigDecimal newvalue)
  {
    fieldE01BUMMAU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMMAU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMMAU()
  {
    return fieldE01BUMMAU.getBigDecimal();
  }

  /**
  * Set field E01BUMAPU using a String value.
  */
  public void setE01BUMAPU(String newvalue)
  {
    fieldE01BUMAPU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMAPU as a String.
  */
  public String getE01BUMAPU()
  {
    return fieldE01BUMAPU.getString();
  }

  /**
  * Set numeric field E01BUMAPU using a BigDecimal value.
  */
  public void setE01BUMAPU(BigDecimal newvalue)
  {
    fieldE01BUMAPU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMAPU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMAPU()
  {
    return fieldE01BUMAPU.getBigDecimal();
  }

  /**
  * Set field E01BUMMYU using a String value.
  */
  public void setE01BUMMYU(String newvalue)
  {
    fieldE01BUMMYU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMMYU as a String.
  */
  public String getE01BUMMYU()
  {
    return fieldE01BUMMYU.getString();
  }

  /**
  * Set numeric field E01BUMMYU using a BigDecimal value.
  */
  public void setE01BUMMYU(BigDecimal newvalue)
  {
    fieldE01BUMMYU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMMYU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMMYU()
  {
    return fieldE01BUMMYU.getBigDecimal();
  }

  /**
  * Set field E01BUMJUU using a String value.
  */
  public void setE01BUMJUU(String newvalue)
  {
    fieldE01BUMJUU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMJUU as a String.
  */
  public String getE01BUMJUU()
  {
    return fieldE01BUMJUU.getString();
  }

  /**
  * Set numeric field E01BUMJUU using a BigDecimal value.
  */
  public void setE01BUMJUU(BigDecimal newvalue)
  {
    fieldE01BUMJUU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMJUU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMJUU()
  {
    return fieldE01BUMJUU.getBigDecimal();
  }

  /**
  * Set field E01BUMJLU using a String value.
  */
  public void setE01BUMJLU(String newvalue)
  {
    fieldE01BUMJLU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMJLU as a String.
  */
  public String getE01BUMJLU()
  {
    return fieldE01BUMJLU.getString();
  }

  /**
  * Set numeric field E01BUMJLU using a BigDecimal value.
  */
  public void setE01BUMJLU(BigDecimal newvalue)
  {
    fieldE01BUMJLU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMJLU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMJLU()
  {
    return fieldE01BUMJLU.getBigDecimal();
  }

  /**
  * Set field E01BUMAUU using a String value.
  */
  public void setE01BUMAUU(String newvalue)
  {
    fieldE01BUMAUU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMAUU as a String.
  */
  public String getE01BUMAUU()
  {
    return fieldE01BUMAUU.getString();
  }

  /**
  * Set numeric field E01BUMAUU using a BigDecimal value.
  */
  public void setE01BUMAUU(BigDecimal newvalue)
  {
    fieldE01BUMAUU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMAUU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMAUU()
  {
    return fieldE01BUMAUU.getBigDecimal();
  }

  /**
  * Set field E01BUMSEU using a String value.
  */
  public void setE01BUMSEU(String newvalue)
  {
    fieldE01BUMSEU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMSEU as a String.
  */
  public String getE01BUMSEU()
  {
    return fieldE01BUMSEU.getString();
  }

  /**
  * Set numeric field E01BUMSEU using a BigDecimal value.
  */
  public void setE01BUMSEU(BigDecimal newvalue)
  {
    fieldE01BUMSEU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMSEU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMSEU()
  {
    return fieldE01BUMSEU.getBigDecimal();
  }

  /**
  * Set field E01BUMOCU using a String value.
  */
  public void setE01BUMOCU(String newvalue)
  {
    fieldE01BUMOCU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMOCU as a String.
  */
  public String getE01BUMOCU()
  {
    return fieldE01BUMOCU.getString();
  }

  /**
  * Set numeric field E01BUMOCU using a BigDecimal value.
  */
  public void setE01BUMOCU(BigDecimal newvalue)
  {
    fieldE01BUMOCU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMOCU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMOCU()
  {
    return fieldE01BUMOCU.getBigDecimal();
  }

  /**
  * Set field E01BUMNOU using a String value.
  */
  public void setE01BUMNOU(String newvalue)
  {
    fieldE01BUMNOU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMNOU as a String.
  */
  public String getE01BUMNOU()
  {
    return fieldE01BUMNOU.getString();
  }

  /**
  * Set numeric field E01BUMNOU using a BigDecimal value.
  */
  public void setE01BUMNOU(BigDecimal newvalue)
  {
    fieldE01BUMNOU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMNOU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMNOU()
  {
    return fieldE01BUMNOU.getBigDecimal();
  }

  /**
  * Set field E01BUMDEU using a String value.
  */
  public void setE01BUMDEU(String newvalue)
  {
    fieldE01BUMDEU.setString(newvalue);
  }

  /**
  * Get value of field E01BUMDEU as a String.
  */
  public String getE01BUMDEU()
  {
    return fieldE01BUMDEU.getString();
  }

  /**
  * Set numeric field E01BUMDEU using a BigDecimal value.
  */
  public void setE01BUMDEU(BigDecimal newvalue)
  {
    fieldE01BUMDEU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BUMDEU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BUMDEU()
  {
    return fieldE01BUMDEU.getBigDecimal();
  }

}
