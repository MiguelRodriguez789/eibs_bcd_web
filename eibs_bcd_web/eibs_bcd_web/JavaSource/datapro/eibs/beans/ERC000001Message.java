package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERC000001 physical file definition.
* 
* File level identifier is 1161013153550.
* Record format level identifier is 49F3FA9DB54BF.
*/

public class ERC000001Message extends MessageRecord
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
                                     "E01RCSRBK",
                                     "E01RCSCTA",
                                     "E01CUSNA1",
                                     "E01DSCRBK",
                                     "E01RCSACC"
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
                                   "E01RCSRBK",
                                   "E01RCSCTA",
                                   "E01CUSNA1",
                                   "E01DSCRBK",
                                   "E01RCSACC"
                                 };
  final static String fid = "1161013153550";
  final static String rid = "49F3FA9DB54BF";
  final static String fmtname = "ERC000001";
  final int FIELDCOUNT = 14;
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
  private CharacterField fieldE01RCSRBK = null;
  private CharacterField fieldE01RCSCTA = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01DSCRBK = null;
  private DecimalField fieldE01RCSACC = null;

  /**
  * Constructor for ERC000001Message.
  */
  public ERC000001Message()
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
    recordsize = 184;
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
    fields[9] = fieldE01RCSRBK =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01RCSRBK");
    fields[10] = fieldE01RCSCTA =
    new CharacterField(message, HEADERSIZE + 46, 20, "E01RCSCTA");
    fields[11] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 66, 60, "E01CUSNA1");
    fields[12] = fieldE01DSCRBK =
    new CharacterField(message, HEADERSIZE + 126, 45, "E01DSCRBK");
    fields[13] = fieldE01RCSACC =
    new DecimalField(message, HEADERSIZE + 171, 13, 0, "E01RCSACC");

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
  * Set field E01RCSRBK using a String value.
  */
  public void setE01RCSRBK(String newvalue)
  {
    fieldE01RCSRBK.setString(newvalue);
  }

  /**
  * Get value of field E01RCSRBK as a String.
  */
  public String getE01RCSRBK()
  {
    return fieldE01RCSRBK.getString();
  }

  /**
  * Set field E01RCSCTA using a String value.
  */
  public void setE01RCSCTA(String newvalue)
  {
    fieldE01RCSCTA.setString(newvalue);
  }

  /**
  * Get value of field E01RCSCTA as a String.
  */
  public String getE01RCSCTA()
  {
    return fieldE01RCSCTA.getString();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

  /**
  * Set field E01DSCRBK using a String value.
  */
  public void setE01DSCRBK(String newvalue)
  {
    fieldE01DSCRBK.setString(newvalue);
  }

  /**
  * Get value of field E01DSCRBK as a String.
  */
  public String getE01DSCRBK()
  {
    return fieldE01DSCRBK.getString();
  }

  /**
  * Set field E01RCSACC using a String value.
  */
  public void setE01RCSACC(String newvalue)
  {
    fieldE01RCSACC.setString(newvalue);
  }

  /**
  * Get value of field E01RCSACC as a String.
  */
  public String getE01RCSACC()
  {
    return fieldE01RCSACC.getString();
  }

  /**
  * Set numeric field E01RCSACC using a BigDecimal value.
  */
  public void setE01RCSACC(BigDecimal newvalue)
  {
    fieldE01RCSACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RCSACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RCSACC()
  {
    return fieldE01RCSACC.getBigDecimal();
  }

}