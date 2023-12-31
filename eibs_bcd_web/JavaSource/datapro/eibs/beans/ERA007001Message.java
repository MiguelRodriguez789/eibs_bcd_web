package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERA007001 physical file definition.
* 
* File level identifier is 1161005130530.
* Record format level identifier is 5A4E3392D2A65.
*/

public class ERA007001Message extends MessageRecord
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
                                     "E01CNTLAN",
                                     "E01TBLTYP",
                                     "E01TBLCDE",
                                     "D01TBLCDE",
                                     "E01TBLLB1",
                                     "E01TBLCK1",
                                     "E01TBLLB2",
                                     "E01TBLCK2",
                                     "E01TBLLB3",
                                     "E01TBLCK3",
                                     "E01TBLLB4",
                                     "E01TBLCK4",
                                     "E01TBLLB5",
                                     "E01TBLTB1",
                                     "D01TBLTB1",
                                     "E01TBLCK5",
                                     "E01TBLLB6",
                                     "E01TBLTB2",
                                     "D01TBLTB2",
                                     "E01TBLCK6",
                                     "E01TBLLB7",
                                     "E01TBLCK7",
                                     "E01TBLLB8",
                                     "E01TBLCK8",
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
                                   "E01CNTLAN",
                                   "E01TBLTYP",
                                   "E01TBLCDE",
                                   "D01TBLCDE",
                                   "E01TBLLB1",
                                   "E01TBLCK1",
                                   "E01TBLLB2",
                                   "E01TBLCK2",
                                   "E01TBLLB3",
                                   "E01TBLCK3",
                                   "E01TBLLB4",
                                   "E01TBLCK4",
                                   "E01TBLLB5",
                                   "E01TBLTB1",
                                   "D01TBLTB1",
                                   "E01TBLCK5",
                                   "E01TBLLB6",
                                   "E01TBLTB2",
                                   "D01TBLTB2",
                                   "E01TBLCK6",
                                   "E01TBLLB7",
                                   "E01TBLCK7",
                                   "E01TBLLB8",
                                   "E01TBLCK8",
                                   "E01OPECDE"
                                 };
  final static String fid = "1161005130530";
  final static String rid = "5A4E3392D2A65";
  final static String fmtname = "ERA007001";
  final int FIELDCOUNT = 34;
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
  private CharacterField fieldE01CNTLAN = null;
  private CharacterField fieldE01TBLTYP = null;
  private CharacterField fieldE01TBLCDE = null;
  private CharacterField fieldD01TBLCDE = null;
  private CharacterField fieldE01TBLLB1 = null;
  private CharacterField fieldE01TBLCK1 = null;
  private CharacterField fieldE01TBLLB2 = null;
  private CharacterField fieldE01TBLCK2 = null;
  private CharacterField fieldE01TBLLB3 = null;
  private CharacterField fieldE01TBLCK3 = null;
  private CharacterField fieldE01TBLLB4 = null;
  private CharacterField fieldE01TBLCK4 = null;
  private CharacterField fieldE01TBLLB5 = null;
  private CharacterField fieldE01TBLTB1 = null;
  private CharacterField fieldD01TBLTB1 = null;
  private CharacterField fieldE01TBLCK5 = null;
  private CharacterField fieldE01TBLLB6 = null;
  private CharacterField fieldE01TBLTB2 = null;
  private CharacterField fieldD01TBLTB2 = null;
  private CharacterField fieldE01TBLCK6 = null;
  private CharacterField fieldE01TBLLB7 = null;
  private CharacterField fieldE01TBLCK7 = null;
  private CharacterField fieldE01TBLLB8 = null;
  private CharacterField fieldE01TBLCK8 = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for ERA007001Message.
  */
  public ERA007001Message()
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
    recordsize = 579;
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
    fields[9] = fieldE01CNTLAN =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01CNTLAN");
    fields[10] = fieldE01TBLTYP =
    new CharacterField(message, HEADERSIZE + 43, 4, "E01TBLTYP");
    fields[11] = fieldE01TBLCDE =
    new CharacterField(message, HEADERSIZE + 47, 4, "E01TBLCDE");
    fields[12] = fieldD01TBLCDE =
    new CharacterField(message, HEADERSIZE + 51, 45, "D01TBLCDE");
    fields[13] = fieldE01TBLLB1 =
    new CharacterField(message, HEADERSIZE + 96, 50, "E01TBLLB1");
    fields[14] = fieldE01TBLCK1 =
    new CharacterField(message, HEADERSIZE + 146, 1, "E01TBLCK1");
    fields[15] = fieldE01TBLLB2 =
    new CharacterField(message, HEADERSIZE + 147, 50, "E01TBLLB2");
    fields[16] = fieldE01TBLCK2 =
    new CharacterField(message, HEADERSIZE + 197, 1, "E01TBLCK2");
    fields[17] = fieldE01TBLLB3 =
    new CharacterField(message, HEADERSIZE + 198, 50, "E01TBLLB3");
    fields[18] = fieldE01TBLCK3 =
    new CharacterField(message, HEADERSIZE + 248, 1, "E01TBLCK3");
    fields[19] = fieldE01TBLLB4 =
    new CharacterField(message, HEADERSIZE + 249, 50, "E01TBLLB4");
    fields[20] = fieldE01TBLCK4 =
    new CharacterField(message, HEADERSIZE + 299, 1, "E01TBLCK4");
    fields[21] = fieldE01TBLLB5 =
    new CharacterField(message, HEADERSIZE + 300, 50, "E01TBLLB5");
    fields[22] = fieldE01TBLTB1 =
    new CharacterField(message, HEADERSIZE + 350, 2, "E01TBLTB1");
    fields[23] = fieldD01TBLTB1 =
    new CharacterField(message, HEADERSIZE + 352, 35, "D01TBLTB1");
    fields[24] = fieldE01TBLCK5 =
    new CharacterField(message, HEADERSIZE + 387, 1, "E01TBLCK5");
    fields[25] = fieldE01TBLLB6 =
    new CharacterField(message, HEADERSIZE + 388, 50, "E01TBLLB6");
    fields[26] = fieldE01TBLTB2 =
    new CharacterField(message, HEADERSIZE + 438, 2, "E01TBLTB2");
    fields[27] = fieldD01TBLTB2 =
    new CharacterField(message, HEADERSIZE + 440, 35, "D01TBLTB2");
    fields[28] = fieldE01TBLCK6 =
    new CharacterField(message, HEADERSIZE + 475, 1, "E01TBLCK6");
    fields[29] = fieldE01TBLLB7 =
    new CharacterField(message, HEADERSIZE + 476, 50, "E01TBLLB7");
    fields[30] = fieldE01TBLCK7 =
    new CharacterField(message, HEADERSIZE + 526, 1, "E01TBLCK7");
    fields[31] = fieldE01TBLLB8 =
    new CharacterField(message, HEADERSIZE + 527, 50, "E01TBLLB8");
    fields[32] = fieldE01TBLCK8 =
    new CharacterField(message, HEADERSIZE + 577, 1, "E01TBLCK8");
    fields[33] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 578, 1, "E01OPECDE");

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
  * Set field E01CNTLAN using a String value.
  */
  public void setE01CNTLAN(String newvalue)
  {
    fieldE01CNTLAN.setString(newvalue);
  }

  /**
  * Get value of field E01CNTLAN as a String.
  */
  public String getE01CNTLAN()
  {
    return fieldE01CNTLAN.getString();
  }

  /**
  * Set field E01TBLTYP using a String value.
  */
  public void setE01TBLTYP(String newvalue)
  {
    fieldE01TBLTYP.setString(newvalue);
  }

  /**
  * Get value of field E01TBLTYP as a String.
  */
  public String getE01TBLTYP()
  {
    return fieldE01TBLTYP.getString();
  }

  /**
  * Set field E01TBLCDE using a String value.
  */
  public void setE01TBLCDE(String newvalue)
  {
    fieldE01TBLCDE.setString(newvalue);
  }

  /**
  * Get value of field E01TBLCDE as a String.
  */
  public String getE01TBLCDE()
  {
    return fieldE01TBLCDE.getString();
  }

  /**
  * Set field D01TBLCDE using a String value.
  */
  public void setD01TBLCDE(String newvalue)
  {
    fieldD01TBLCDE.setString(newvalue);
  }

  /**
  * Get value of field D01TBLCDE as a String.
  */
  public String getD01TBLCDE()
  {
    return fieldD01TBLCDE.getString();
  }

  /**
  * Set field E01TBLLB1 using a String value.
  */
  public void setE01TBLLB1(String newvalue)
  {
    fieldE01TBLLB1.setString(newvalue);
  }

  /**
  * Get value of field E01TBLLB1 as a String.
  */
  public String getE01TBLLB1()
  {
    return fieldE01TBLLB1.getString();
  }

  /**
  * Set field E01TBLCK1 using a String value.
  */
  public void setE01TBLCK1(String newvalue)
  {
    fieldE01TBLCK1.setString(newvalue);
  }

  /**
  * Get value of field E01TBLCK1 as a String.
  */
  public String getE01TBLCK1()
  {
    return fieldE01TBLCK1.getString();
  }

  /**
  * Set field E01TBLLB2 using a String value.
  */
  public void setE01TBLLB2(String newvalue)
  {
    fieldE01TBLLB2.setString(newvalue);
  }

  /**
  * Get value of field E01TBLLB2 as a String.
  */
  public String getE01TBLLB2()
  {
    return fieldE01TBLLB2.getString();
  }

  /**
  * Set field E01TBLCK2 using a String value.
  */
  public void setE01TBLCK2(String newvalue)
  {
    fieldE01TBLCK2.setString(newvalue);
  }

  /**
  * Get value of field E01TBLCK2 as a String.
  */
  public String getE01TBLCK2()
  {
    return fieldE01TBLCK2.getString();
  }

  /**
  * Set field E01TBLLB3 using a String value.
  */
  public void setE01TBLLB3(String newvalue)
  {
    fieldE01TBLLB3.setString(newvalue);
  }

  /**
  * Get value of field E01TBLLB3 as a String.
  */
  public String getE01TBLLB3()
  {
    return fieldE01TBLLB3.getString();
  }

  /**
  * Set field E01TBLCK3 using a String value.
  */
  public void setE01TBLCK3(String newvalue)
  {
    fieldE01TBLCK3.setString(newvalue);
  }

  /**
  * Get value of field E01TBLCK3 as a String.
  */
  public String getE01TBLCK3()
  {
    return fieldE01TBLCK3.getString();
  }

  /**
  * Set field E01TBLLB4 using a String value.
  */
  public void setE01TBLLB4(String newvalue)
  {
    fieldE01TBLLB4.setString(newvalue);
  }

  /**
  * Get value of field E01TBLLB4 as a String.
  */
  public String getE01TBLLB4()
  {
    return fieldE01TBLLB4.getString();
  }

  /**
  * Set field E01TBLCK4 using a String value.
  */
  public void setE01TBLCK4(String newvalue)
  {
    fieldE01TBLCK4.setString(newvalue);
  }

  /**
  * Get value of field E01TBLCK4 as a String.
  */
  public String getE01TBLCK4()
  {
    return fieldE01TBLCK4.getString();
  }

  /**
  * Set field E01TBLLB5 using a String value.
  */
  public void setE01TBLLB5(String newvalue)
  {
    fieldE01TBLLB5.setString(newvalue);
  }

  /**
  * Get value of field E01TBLLB5 as a String.
  */
  public String getE01TBLLB5()
  {
    return fieldE01TBLLB5.getString();
  }

  /**
  * Set field E01TBLTB1 using a String value.
  */
  public void setE01TBLTB1(String newvalue)
  {
    fieldE01TBLTB1.setString(newvalue);
  }

  /**
  * Get value of field E01TBLTB1 as a String.
  */
  public String getE01TBLTB1()
  {
    return fieldE01TBLTB1.getString();
  }

  /**
  * Set field D01TBLTB1 using a String value.
  */
  public void setD01TBLTB1(String newvalue)
  {
    fieldD01TBLTB1.setString(newvalue);
  }

  /**
  * Get value of field D01TBLTB1 as a String.
  */
  public String getD01TBLTB1()
  {
    return fieldD01TBLTB1.getString();
  }

  /**
  * Set field E01TBLCK5 using a String value.
  */
  public void setE01TBLCK5(String newvalue)
  {
    fieldE01TBLCK5.setString(newvalue);
  }

  /**
  * Get value of field E01TBLCK5 as a String.
  */
  public String getE01TBLCK5()
  {
    return fieldE01TBLCK5.getString();
  }

  /**
  * Set field E01TBLLB6 using a String value.
  */
  public void setE01TBLLB6(String newvalue)
  {
    fieldE01TBLLB6.setString(newvalue);
  }

  /**
  * Get value of field E01TBLLB6 as a String.
  */
  public String getE01TBLLB6()
  {
    return fieldE01TBLLB6.getString();
  }

  /**
  * Set field E01TBLTB2 using a String value.
  */
  public void setE01TBLTB2(String newvalue)
  {
    fieldE01TBLTB2.setString(newvalue);
  }

  /**
  * Get value of field E01TBLTB2 as a String.
  */
  public String getE01TBLTB2()
  {
    return fieldE01TBLTB2.getString();
  }

  /**
  * Set field D01TBLTB2 using a String value.
  */
  public void setD01TBLTB2(String newvalue)
  {
    fieldD01TBLTB2.setString(newvalue);
  }

  /**
  * Get value of field D01TBLTB2 as a String.
  */
  public String getD01TBLTB2()
  {
    return fieldD01TBLTB2.getString();
  }

  /**
  * Set field E01TBLCK6 using a String value.
  */
  public void setE01TBLCK6(String newvalue)
  {
    fieldE01TBLCK6.setString(newvalue);
  }

  /**
  * Get value of field E01TBLCK6 as a String.
  */
  public String getE01TBLCK6()
  {
    return fieldE01TBLCK6.getString();
  }

  /**
  * Set field E01TBLLB7 using a String value.
  */
  public void setE01TBLLB7(String newvalue)
  {
    fieldE01TBLLB7.setString(newvalue);
  }

  /**
  * Get value of field E01TBLLB7 as a String.
  */
  public String getE01TBLLB7()
  {
    return fieldE01TBLLB7.getString();
  }

  /**
  * Set field E01TBLCK7 using a String value.
  */
  public void setE01TBLCK7(String newvalue)
  {
    fieldE01TBLCK7.setString(newvalue);
  }

  /**
  * Get value of field E01TBLCK7 as a String.
  */
  public String getE01TBLCK7()
  {
    return fieldE01TBLCK7.getString();
  }

  /**
  * Set field E01TBLLB8 using a String value.
  */
  public void setE01TBLLB8(String newvalue)
  {
    fieldE01TBLLB8.setString(newvalue);
  }

  /**
  * Get value of field E01TBLLB8 as a String.
  */
  public String getE01TBLLB8()
  {
    return fieldE01TBLLB8.getString();
  }

  /**
  * Set field E01TBLCK8 using a String value.
  */
  public void setE01TBLCK8(String newvalue)
  {
    fieldE01TBLCK8.setString(newvalue);
  }

  /**
  * Get value of field E01TBLCK8 as a String.
  */
  public String getE01TBLCK8()
  {
    return fieldE01TBLCK8.getString();
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
