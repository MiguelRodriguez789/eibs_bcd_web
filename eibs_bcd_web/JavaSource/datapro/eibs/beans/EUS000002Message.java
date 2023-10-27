package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EUS000002 physical file definition.
* 
* File level identifier is 1130611113443.
* Record format level identifier is 3E8C664122F0C.
*/

public class EUS000002Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "E02US1RTY",
                                     "E02USTDES",
                                     "E02US1CDE",
                                     "E02US1DSC",
                                     "E02US1CD1",
                                     "E02US1CD2",
                                     "E02US1CD3",
                                     "E02US1CD4",
                                     "E02US1CD5",
                                     "E02US1CD6",
                                     "E02US1CD7",
                                     "E02US1CD8",
                                     "E02US1CD9",
                                     "E02US1OPE"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "E02US1RTY",
                                   "E02USTDES",
                                   "E02US1CDE",
                                   "E02US1DSC",
                                   "E02US1CD1",
                                   "E02US1CD2",
                                   "E02US1CD3",
                                   "E02US1CD4",
                                   "E02US1CD5",
                                   "E02US1CD6",
                                   "E02US1CD7",
                                   "E02US1CD8",
                                   "E02US1CD9",
                                   "E02US1OPE"
                                 };
  final static String fid = "1130611113443";
  final static String rid = "3E8C664122F0C";
  final static String fmtname = "EUS000002";
  final int FIELDCOUNT = 23;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private CharacterField fieldE02US1RTY = null;
  private CharacterField fieldE02USTDES = null;
  private CharacterField fieldE02US1CDE = null;
  private CharacterField fieldE02US1DSC = null;
  private CharacterField fieldE02US1CD1 = null;
  private CharacterField fieldE02US1CD2 = null;
  private CharacterField fieldE02US1CD3 = null;
  private CharacterField fieldE02US1CD4 = null;
  private CharacterField fieldE02US1CD5 = null;
  private CharacterField fieldE02US1CD6 = null;
  private CharacterField fieldE02US1CD7 = null;
  private CharacterField fieldE02US1CD8 = null;
  private CharacterField fieldE02US1CD9 = null;
  private CharacterField fieldE02US1OPE = null;

  /**
  * Constructor for EUS000002Message.
  */
  public EUS000002Message()
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
    recordsize = 225;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldE02US1RTY =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02US1RTY");
    fields[10] = fieldE02USTDES =
    new CharacterField(message, HEADERSIZE + 44, 60, "E02USTDES");
    fields[11] = fieldE02US1CDE =
    new CharacterField(message, HEADERSIZE + 104, 6, "E02US1CDE");
    fields[12] = fieldE02US1DSC =
    new CharacterField(message, HEADERSIZE + 110, 60, "E02US1DSC");
    fields[13] = fieldE02US1CD1 =
    new CharacterField(message, HEADERSIZE + 170, 6, "E02US1CD1");
    fields[14] = fieldE02US1CD2 =
    new CharacterField(message, HEADERSIZE + 176, 6, "E02US1CD2");
    fields[15] = fieldE02US1CD3 =
    new CharacterField(message, HEADERSIZE + 182, 6, "E02US1CD3");
    fields[16] = fieldE02US1CD4 =
    new CharacterField(message, HEADERSIZE + 188, 6, "E02US1CD4");
    fields[17] = fieldE02US1CD5 =
    new CharacterField(message, HEADERSIZE + 194, 6, "E02US1CD5");
    fields[18] = fieldE02US1CD6 =
    new CharacterField(message, HEADERSIZE + 200, 6, "E02US1CD6");
    fields[19] = fieldE02US1CD7 =
    new CharacterField(message, HEADERSIZE + 206, 6, "E02US1CD7");
    fields[20] = fieldE02US1CD8 =
    new CharacterField(message, HEADERSIZE + 212, 6, "E02US1CD8");
    fields[21] = fieldE02US1CD9 =
    new CharacterField(message, HEADERSIZE + 218, 6, "E02US1CD9");
    fields[22] = fieldE02US1OPE =
    new CharacterField(message, HEADERSIZE + 224, 1, "E02US1OPE");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field E02US1RTY using a String value.
  */
  public void setE02US1RTY(String newvalue)
  {
    fieldE02US1RTY.setString(newvalue);
  }

  /**
  * Get value of field E02US1RTY as a String.
  */
  public String getE02US1RTY()
  {
    return fieldE02US1RTY.getString();
  }

  /**
  * Set field E02USTDES using a String value.
  */
  public void setE02USTDES(String newvalue)
  {
    fieldE02USTDES.setString(newvalue);
  }

  /**
  * Get value of field E02USTDES as a String.
  */
  public String getE02USTDES()
  {
    return fieldE02USTDES.getString();
  }

  /**
  * Set field E02US1CDE using a String value.
  */
  public void setE02US1CDE(String newvalue)
  {
    fieldE02US1CDE.setString(newvalue);
  }

  /**
  * Get value of field E02US1CDE as a String.
  */
  public String getE02US1CDE()
  {
    return fieldE02US1CDE.getString();
  }

  /**
  * Set field E02US1DSC using a String value.
  */
  public void setE02US1DSC(String newvalue)
  {
    fieldE02US1DSC.setString(newvalue);
  }

  /**
  * Get value of field E02US1DSC as a String.
  */
  public String getE02US1DSC()
  {
    return fieldE02US1DSC.getString();
  }

  /**
  * Set field E02US1CD1 using a String value.
  */
  public void setE02US1CD1(String newvalue)
  {
    fieldE02US1CD1.setString(newvalue);
  }

  /**
  * Get value of field E02US1CD1 as a String.
  */
  public String getE02US1CD1()
  {
    return fieldE02US1CD1.getString();
  }

  /**
  * Set field E02US1CD2 using a String value.
  */
  public void setE02US1CD2(String newvalue)
  {
    fieldE02US1CD2.setString(newvalue);
  }

  /**
  * Get value of field E02US1CD2 as a String.
  */
  public String getE02US1CD2()
  {
    return fieldE02US1CD2.getString();
  }

  /**
  * Set field E02US1CD3 using a String value.
  */
  public void setE02US1CD3(String newvalue)
  {
    fieldE02US1CD3.setString(newvalue);
  }

  /**
  * Get value of field E02US1CD3 as a String.
  */
  public String getE02US1CD3()
  {
    return fieldE02US1CD3.getString();
  }

  /**
  * Set field E02US1CD4 using a String value.
  */
  public void setE02US1CD4(String newvalue)
  {
    fieldE02US1CD4.setString(newvalue);
  }

  /**
  * Get value of field E02US1CD4 as a String.
  */
  public String getE02US1CD4()
  {
    return fieldE02US1CD4.getString();
  }

  /**
  * Set field E02US1CD5 using a String value.
  */
  public void setE02US1CD5(String newvalue)
  {
    fieldE02US1CD5.setString(newvalue);
  }

  /**
  * Get value of field E02US1CD5 as a String.
  */
  public String getE02US1CD5()
  {
    return fieldE02US1CD5.getString();
  }

  /**
  * Set field E02US1CD6 using a String value.
  */
  public void setE02US1CD6(String newvalue)
  {
    fieldE02US1CD6.setString(newvalue);
  }

  /**
  * Get value of field E02US1CD6 as a String.
  */
  public String getE02US1CD6()
  {
    return fieldE02US1CD6.getString();
  }

  /**
  * Set field E02US1CD7 using a String value.
  */
  public void setE02US1CD7(String newvalue)
  {
    fieldE02US1CD7.setString(newvalue);
  }

  /**
  * Get value of field E02US1CD7 as a String.
  */
  public String getE02US1CD7()
  {
    return fieldE02US1CD7.getString();
  }

  /**
  * Set field E02US1CD8 using a String value.
  */
  public void setE02US1CD8(String newvalue)
  {
    fieldE02US1CD8.setString(newvalue);
  }

  /**
  * Get value of field E02US1CD8 as a String.
  */
  public String getE02US1CD8()
  {
    return fieldE02US1CD8.getString();
  }

  /**
  * Set field E02US1CD9 using a String value.
  */
  public void setE02US1CD9(String newvalue)
  {
    fieldE02US1CD9.setString(newvalue);
  }

  /**
  * Get value of field E02US1CD9 as a String.
  */
  public String getE02US1CD9()
  {
    return fieldE02US1CD9.getString();
  }

  /**
  * Set field E02US1OPE using a String value.
  */
  public void setE02US1OPE(String newvalue)
  {
    fieldE02US1OPE.setString(newvalue);
  }

  /**
  * Get value of field E02US1OPE as a String.
  */
  public String getE02US1OPE()
  {
    return fieldE02US1OPE.getString();
  }

}
