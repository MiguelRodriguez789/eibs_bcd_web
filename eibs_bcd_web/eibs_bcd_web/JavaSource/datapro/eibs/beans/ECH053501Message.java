package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECH053501 physical file definition.
* 
* File level identifier is 1161222115327.
* Record format level identifier is 3D82E9FECFC99.
*/

public class ECH053501Message extends MessageRecord
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
                                     "E01CHABNK",
                                     "E01CHABRN",
                                     "E01CHACCY",
                                     "E01CHAACC",
                                     "E01CHAACD",
                                     "E01CHAPRO",
                                     "E01CHACUN",
                                     "E01CHANA1",
                                     "E01CHAOFC",
                                     "E01DSCOFC",
                                     "E01CHADTM",
                                     "E01CHADTD",
                                     "E01CHADTY",
                                     "E01CHANCK",
                                     "E01CHATIM",
                                     "E01CHABTH",
                                     "E01CHATYP",
                                     "E01CHATCH",
                                     "E01CHADSC",
                                     "E01CHADBR",
                                     "E01CHAOCT",
                                     "E01OPECDE"
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
                                   "E01CHABNK",
                                   "E01CHABRN",
                                   "E01CHACCY",
                                   "E01CHAACC",
                                   "E01CHAACD",
                                   "E01CHAPRO",
                                   "E01CHACUN",
                                   "E01CHANA1",
                                   "E01CHAOFC",
                                   "E01DSCOFC",
                                   "E01CHADTM",
                                   "E01CHADTD",
                                   "E01CHADTY",
                                   "E01CHANCK",
                                   "E01CHATIM",
                                   "E01CHABTH",
                                   "E01CHATYP",
                                   "E01CHATCH",
                                   "E01CHADSC",
                                   "E01CHADBR",
                                   "E01CHAOCT",
                                   "E01OPECDE"
                                 };
  final static String fid = "1161222115327";
  final static String rid = "3D82E9FECFC99";
  final static String fmtname = "ECH053501";
  final int FIELDCOUNT = 31;
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
  private CharacterField fieldE01CHABNK = null;
  private DecimalField fieldE01CHABRN = null;
  private CharacterField fieldE01CHACCY = null;
  private DecimalField fieldE01CHAACC = null;
  private CharacterField fieldE01CHAACD = null;
  private CharacterField fieldE01CHAPRO = null;
  private DecimalField fieldE01CHACUN = null;
  private CharacterField fieldE01CHANA1 = null;
  private CharacterField fieldE01CHAOFC = null;
  private CharacterField fieldE01DSCOFC = null;
  private DecimalField fieldE01CHADTM = null;
  private DecimalField fieldE01CHADTD = null;
  private DecimalField fieldE01CHADTY = null;
  private DecimalField fieldE01CHANCK = null;
  private CharacterField fieldE01CHATIM = null;
  private DecimalField fieldE01CHABTH = null;
  private CharacterField fieldE01CHATYP = null;
  private CharacterField fieldE01CHATCH = null;
  private CharacterField fieldE01CHADSC = null;
  private DecimalField fieldE01CHADBR = null;
  private CharacterField fieldE01CHAOCT = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for ECH053501Message.
  */
  public ECH053501Message()
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
    recordsize = 308;
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
    fields[9] = fieldE01CHABNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01CHABNK");
    fields[10] = fieldE01CHABRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E01CHABRN");
    fields[11] = fieldE01CHACCY =
    new CharacterField(message, HEADERSIZE + 49, 3, "E01CHACCY");
    fields[12] = fieldE01CHAACC =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E01CHAACC");
    fields[13] = fieldE01CHAACD =
    new CharacterField(message, HEADERSIZE + 65, 2, "E01CHAACD");
    fields[14] = fieldE01CHAPRO =
    new CharacterField(message, HEADERSIZE + 67, 4, "E01CHAPRO");
    fields[15] = fieldE01CHACUN =
    new DecimalField(message, HEADERSIZE + 71, 10, 0, "E01CHACUN");
    fields[16] = fieldE01CHANA1 =
    new CharacterField(message, HEADERSIZE + 81, 60, "E01CHANA1");
    fields[17] = fieldE01CHAOFC =
    new CharacterField(message, HEADERSIZE + 141, 4, "E01CHAOFC");
    fields[18] = fieldE01DSCOFC =
    new CharacterField(message, HEADERSIZE + 145, 60, "E01DSCOFC");
    fields[19] = fieldE01CHADTM =
    new DecimalField(message, HEADERSIZE + 205, 3, 0, "E01CHADTM");
    fields[20] = fieldE01CHADTD =
    new DecimalField(message, HEADERSIZE + 208, 3, 0, "E01CHADTD");
    fields[21] = fieldE01CHADTY =
    new DecimalField(message, HEADERSIZE + 211, 5, 0, "E01CHADTY");
    fields[22] = fieldE01CHANCK =
    new DecimalField(message, HEADERSIZE + 216, 5, 0, "E01CHANCK");
    fields[23] = fieldE01CHATIM =
    new CharacterField(message, HEADERSIZE + 221, 26, "E01CHATIM");
    fields[24] = fieldE01CHABTH =
    new DecimalField(message, HEADERSIZE + 247, 6, 0, "E01CHABTH");
    fields[25] = fieldE01CHATYP =
    new CharacterField(message, HEADERSIZE + 253, 1, "E01CHATYP");
    fields[26] = fieldE01CHATCH =
    new CharacterField(message, HEADERSIZE + 254, 2, "E01CHATCH");
    fields[27] = fieldE01CHADSC =
    new CharacterField(message, HEADERSIZE + 256, 45, "E01CHADSC");
    fields[28] = fieldE01CHADBR =
    new DecimalField(message, HEADERSIZE + 301, 5, 0, "E01CHADBR");
    fields[29] = fieldE01CHAOCT =
    new CharacterField(message, HEADERSIZE + 306, 1, "E01CHAOCT");
    fields[30] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 307, 1, "E01OPECDE");

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
  * Set field E01CHABNK using a String value.
  */
  public void setE01CHABNK(String newvalue)
  {
    fieldE01CHABNK.setString(newvalue);
  }

  /**
  * Get value of field E01CHABNK as a String.
  */
  public String getE01CHABNK()
  {
    return fieldE01CHABNK.getString();
  }

  /**
  * Set field E01CHABRN using a String value.
  */
  public void setE01CHABRN(String newvalue)
  {
    fieldE01CHABRN.setString(newvalue);
  }

  /**
  * Get value of field E01CHABRN as a String.
  */
  public String getE01CHABRN()
  {
    return fieldE01CHABRN.getString();
  }

  /**
  * Set numeric field E01CHABRN using a BigDecimal value.
  */
  public void setE01CHABRN(BigDecimal newvalue)
  {
    fieldE01CHABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHABRN()
  {
    return fieldE01CHABRN.getBigDecimal();
  }

  /**
  * Set field E01CHACCY using a String value.
  */
  public void setE01CHACCY(String newvalue)
  {
    fieldE01CHACCY.setString(newvalue);
  }

  /**
  * Get value of field E01CHACCY as a String.
  */
  public String getE01CHACCY()
  {
    return fieldE01CHACCY.getString();
  }

  /**
  * Set field E01CHAACC using a String value.
  */
  public void setE01CHAACC(String newvalue)
  {
    fieldE01CHAACC.setString(newvalue);
  }

  /**
  * Get value of field E01CHAACC as a String.
  */
  public String getE01CHAACC()
  {
    return fieldE01CHAACC.getString();
  }

  /**
  * Set numeric field E01CHAACC using a BigDecimal value.
  */
  public void setE01CHAACC(BigDecimal newvalue)
  {
    fieldE01CHAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHAACC()
  {
    return fieldE01CHAACC.getBigDecimal();
  }

  /**
  * Set field E01CHAACD using a String value.
  */
  public void setE01CHAACD(String newvalue)
  {
    fieldE01CHAACD.setString(newvalue);
  }

  /**
  * Get value of field E01CHAACD as a String.
  */
  public String getE01CHAACD()
  {
    return fieldE01CHAACD.getString();
  }

  /**
  * Set field E01CHAPRO using a String value.
  */
  public void setE01CHAPRO(String newvalue)
  {
    fieldE01CHAPRO.setString(newvalue);
  }

  /**
  * Get value of field E01CHAPRO as a String.
  */
  public String getE01CHAPRO()
  {
    return fieldE01CHAPRO.getString();
  }

  /**
  * Set field E01CHACUN using a String value.
  */
  public void setE01CHACUN(String newvalue)
  {
    fieldE01CHACUN.setString(newvalue);
  }

  /**
  * Get value of field E01CHACUN as a String.
  */
  public String getE01CHACUN()
  {
    return fieldE01CHACUN.getString();
  }

  /**
  * Set numeric field E01CHACUN using a BigDecimal value.
  */
  public void setE01CHACUN(BigDecimal newvalue)
  {
    fieldE01CHACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHACUN()
  {
    return fieldE01CHACUN.getBigDecimal();
  }

  /**
  * Set field E01CHANA1 using a String value.
  */
  public void setE01CHANA1(String newvalue)
  {
    fieldE01CHANA1.setString(newvalue);
  }

  /**
  * Get value of field E01CHANA1 as a String.
  */
  public String getE01CHANA1()
  {
    return fieldE01CHANA1.getString();
  }

  /**
  * Set field E01CHAOFC using a String value.
  */
  public void setE01CHAOFC(String newvalue)
  {
    fieldE01CHAOFC.setString(newvalue);
  }

  /**
  * Get value of field E01CHAOFC as a String.
  */
  public String getE01CHAOFC()
  {
    return fieldE01CHAOFC.getString();
  }

  /**
  * Set field E01DSCOFC using a String value.
  */
  public void setE01DSCOFC(String newvalue)
  {
    fieldE01DSCOFC.setString(newvalue);
  }

  /**
  * Get value of field E01DSCOFC as a String.
  */
  public String getE01DSCOFC()
  {
    return fieldE01DSCOFC.getString();
  }

  /**
  * Set field E01CHADTM using a String value.
  */
  public void setE01CHADTM(String newvalue)
  {
    fieldE01CHADTM.setString(newvalue);
  }

  /**
  * Get value of field E01CHADTM as a String.
  */
  public String getE01CHADTM()
  {
    return fieldE01CHADTM.getString();
  }

  /**
  * Set numeric field E01CHADTM using a BigDecimal value.
  */
  public void setE01CHADTM(BigDecimal newvalue)
  {
    fieldE01CHADTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHADTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHADTM()
  {
    return fieldE01CHADTM.getBigDecimal();
  }

  /**
  * Set field E01CHADTD using a String value.
  */
  public void setE01CHADTD(String newvalue)
  {
    fieldE01CHADTD.setString(newvalue);
  }

  /**
  * Get value of field E01CHADTD as a String.
  */
  public String getE01CHADTD()
  {
    return fieldE01CHADTD.getString();
  }

  /**
  * Set numeric field E01CHADTD using a BigDecimal value.
  */
  public void setE01CHADTD(BigDecimal newvalue)
  {
    fieldE01CHADTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHADTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHADTD()
  {
    return fieldE01CHADTD.getBigDecimal();
  }

  /**
  * Set field E01CHADTY using a String value.
  */
  public void setE01CHADTY(String newvalue)
  {
    fieldE01CHADTY.setString(newvalue);
  }

  /**
  * Get value of field E01CHADTY as a String.
  */
  public String getE01CHADTY()
  {
    return fieldE01CHADTY.getString();
  }

  /**
  * Set numeric field E01CHADTY using a BigDecimal value.
  */
  public void setE01CHADTY(BigDecimal newvalue)
  {
    fieldE01CHADTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHADTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHADTY()
  {
    return fieldE01CHADTY.getBigDecimal();
  }

  /**
  * Set field E01CHANCK using a String value.
  */
  public void setE01CHANCK(String newvalue)
  {
    fieldE01CHANCK.setString(newvalue);
  }

  /**
  * Get value of field E01CHANCK as a String.
  */
  public String getE01CHANCK()
  {
    return fieldE01CHANCK.getString();
  }

  /**
  * Set numeric field E01CHANCK using a BigDecimal value.
  */
  public void setE01CHANCK(BigDecimal newvalue)
  {
    fieldE01CHANCK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHANCK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHANCK()
  {
    return fieldE01CHANCK.getBigDecimal();
  }

  /**
  * Set field E01CHATIM using a String value.
  */
  public void setE01CHATIM(String newvalue)
  {
    fieldE01CHATIM.setString(newvalue);
  }

  /**
  * Get value of field E01CHATIM as a String.
  */
  public String getE01CHATIM()
  {
    return fieldE01CHATIM.getString();
  }

  /**
  * Set field E01CHABTH using a String value.
  */
  public void setE01CHABTH(String newvalue)
  {
    fieldE01CHABTH.setString(newvalue);
  }

  /**
  * Get value of field E01CHABTH as a String.
  */
  public String getE01CHABTH()
  {
    return fieldE01CHABTH.getString();
  }

  /**
  * Set numeric field E01CHABTH using a BigDecimal value.
  */
  public void setE01CHABTH(BigDecimal newvalue)
  {
    fieldE01CHABTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHABTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHABTH()
  {
    return fieldE01CHABTH.getBigDecimal();
  }

  /**
  * Set field E01CHATYP using a String value.
  */
  public void setE01CHATYP(String newvalue)
  {
    fieldE01CHATYP.setString(newvalue);
  }

  /**
  * Get value of field E01CHATYP as a String.
  */
  public String getE01CHATYP()
  {
    return fieldE01CHATYP.getString();
  }

  /**
  * Set field E01CHATCH using a String value.
  */
  public void setE01CHATCH(String newvalue)
  {
    fieldE01CHATCH.setString(newvalue);
  }

  /**
  * Get value of field E01CHATCH as a String.
  */
  public String getE01CHATCH()
  {
    return fieldE01CHATCH.getString();
  }

  /**
  * Set field E01CHADSC using a String value.
  */
  public void setE01CHADSC(String newvalue)
  {
    fieldE01CHADSC.setString(newvalue);
  }

  /**
  * Get value of field E01CHADSC as a String.
  */
  public String getE01CHADSC()
  {
    return fieldE01CHADSC.getString();
  }

  /**
  * Set field E01CHADBR using a String value.
  */
  public void setE01CHADBR(String newvalue)
  {
    fieldE01CHADBR.setString(newvalue);
  }

  /**
  * Get value of field E01CHADBR as a String.
  */
  public String getE01CHADBR()
  {
    return fieldE01CHADBR.getString();
  }

  /**
  * Set numeric field E01CHADBR using a BigDecimal value.
  */
  public void setE01CHADBR(BigDecimal newvalue)
  {
    fieldE01CHADBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHADBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHADBR()
  {
    return fieldE01CHADBR.getBigDecimal();
  }

  /**
  * Set field E01CHAOCT using a String value.
  */
  public void setE01CHAOCT(String newvalue)
  {
    fieldE01CHAOCT.setString(newvalue);
  }

  /**
  * Get value of field E01CHAOCT as a String.
  */
  public String getE01CHAOCT()
  {
    return fieldE01CHAOCT.getString();
  }

  /**
  * Set field E01OPECDE using a String value.
  */
  public void setE01OPECDE(String newvalue)
  {
    fieldE01OPECDE.setString(newvalue);
  }

  /**
  * Get value of field E01OPECDE as a String.
  */
  public String getE01OPECDE()
  {
    return fieldE01OPECDE.getString();
  }

}