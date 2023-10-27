package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECE008001 physical file definition.
* 
* File level identifier is 1050810165329.
* Record format level identifier is 488BB18945793.
*/

public class ECE008001Message extends MessageRecord
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
                                     "E01OFCCDE",
                                     "E01OF2CDE",
                                     "E01COLBNK",
                                     "E01COLBRN",
                                     "E01COLCCY",
                                     "E01COLACC"
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
                                   "E01OFCCDE",
                                   "E01OF2CDE",
                                   "E01COLBNK",
                                   "E01COLBRN",
                                   "E01COLCCY",
                                   "E01COLACC"
                                 };
  final static String fid = "1050810165329";
  final static String rid = "488BB18945793";
  final static String fmtname = "ECE008001";
  final int FIELDCOUNT = 15;
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
  private CharacterField fieldE01OFCCDE = null;
  private CharacterField fieldE01OF2CDE = null;
  private CharacterField fieldE01COLBNK = null;
  private DecimalField fieldE01COLBRN = null;
  private CharacterField fieldE01COLCCY = null;
  private DecimalField fieldE01COLACC = null;

  /**
  * Constructor for ECE008001Message.
  */
  public ECE008001Message()
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
    recordsize = 76;
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
    fields[9] = fieldE01OFCCDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01OFCCDE");
    fields[10] = fieldE01OF2CDE =
    new CharacterField(message, HEADERSIZE + 46, 4, "E01OF2CDE");
    fields[11] = fieldE01COLBNK =
    new CharacterField(message, HEADERSIZE + 50, 2, "E01COLBNK");
    fields[12] = fieldE01COLBRN =
    new DecimalField(message, HEADERSIZE + 52, 4, 0, "E01COLBRN");
    fields[13] = fieldE01COLCCY =
    new CharacterField(message, HEADERSIZE + 56, 3, "E01COLCCY");
    fields[14] = fieldE01COLACC =
    new DecimalField(message, HEADERSIZE + 59, 17, 0, "E01COLACC");

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
  * Set field E01OFCCDE using a String value.
  */
  public void setE01OFCCDE(String newvalue)
  {
    fieldE01OFCCDE.setString(newvalue);
  }

  /**
  * Get value of field E01OFCCDE as a String.
  */
  public String getE01OFCCDE()
  {
    return fieldE01OFCCDE.getString();
  }

  /**
  * Set field E01OF2CDE using a String value.
  */
  public void setE01OF2CDE(String newvalue)
  {
    fieldE01OF2CDE.setString(newvalue);
  }

  /**
  * Get value of field E01OF2CDE as a String.
  */
  public String getE01OF2CDE()
  {
    return fieldE01OF2CDE.getString();
  }

  /**
  * Set field E01COLBNK using a String value.
  */
  public void setE01COLBNK(String newvalue)
  {
    fieldE01COLBNK.setString(newvalue);
  }

  /**
  * Get value of field E01COLBNK as a String.
  */
  public String getE01COLBNK()
  {
    return fieldE01COLBNK.getString();
  }

  /**
  * Set field E01COLBRN using a String value.
  */
  public void setE01COLBRN(String newvalue)
  {
    fieldE01COLBRN.setString(newvalue);
  }

  /**
  * Get value of field E01COLBRN as a String.
  */
  public String getE01COLBRN()
  {
    return fieldE01COLBRN.getString();
  }

  /**
  * Set numeric field E01COLBRN using a BigDecimal value.
  */
  public void setE01COLBRN(BigDecimal newvalue)
  {
    fieldE01COLBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01COLBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01COLBRN()
  {
    return fieldE01COLBRN.getBigDecimal();
  }

  /**
  * Set field E01COLCCY using a String value.
  */
  public void setE01COLCCY(String newvalue)
  {
    fieldE01COLCCY.setString(newvalue);
  }

  /**
  * Get value of field E01COLCCY as a String.
  */
  public String getE01COLCCY()
  {
    return fieldE01COLCCY.getString();
  }

  /**
  * Set field E01COLACC using a String value.
  */
  public void setE01COLACC(String newvalue)
  {
    fieldE01COLACC.setString(newvalue);
  }

  /**
  * Get value of field E01COLACC as a String.
  */
  public String getE01COLACC()
  {
    return fieldE01COLACC.getString();
  }

  /**
  * Set numeric field E01COLACC using a BigDecimal value.
  */
  public void setE01COLACC(BigDecimal newvalue)
  {
    fieldE01COLACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01COLACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01COLACC()
  {
    return fieldE01COLACC.getBigDecimal();
  }

}
