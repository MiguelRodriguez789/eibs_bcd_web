package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD008301 physical file definition.
* 
* File level identifier is 1150505123328.
* Record format level identifier is 405BE68DF4113.
*/

public class ESD008301Message extends MessageRecord
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
                                     "E01CFACTY",
                                     "D01CFACTY",
                                     "E01CFANUN",
                                     "D01CFANUN", 
                                     "E01CFAST1",
                                     "E01CFAURN",
                                     "D01CFAURN",
                                     "E01CFAST2",
                                     "E01CFAEVN",
                                     "D01CFAEVN",
                                     "E01CFAST3",
                                     "E01CFATEP",
                                     "D01CFATEP",
                                     "E01CFAEN1",
                                     "E01CFATE1",
                                     "D01CFATE1",
                                     "E01CFATE2",
                                     "D01CFATE2",
                                     "E01CFATE3",
                                     "D01CFATE3",
                                     "E01CFACE0",
                                     "D01CFACE0",
                                     "E01CFACF1",
                                     "E01CFABO1",
                                     "E01CFAIN1",
                                     "E01CFACE1",
                                     "D01CFACE1",
                                     "E01CFACF2",
                                     "E01CFABO2",
                                     "E01CFAIN2",
                                     "E01CFACE2",
                                     "D01CFACE2",
                                     "E01CFACF3",
                                     "E01CFABO3",
                                     "E01CFAIN3",
                                     "E01CFACE3",
                                     "D01CFACE3",
                                     "E01CFACE4",
                                     "D01CFACE4",
                                     "E01CFACE5",
                                     "D01CFACE5",
                                     "E01CFACP0",
                                     "D01CFACP0",
                                     "E01CFAST4",
                                     "E01CFACE6",
                                     "D01CFACE6",
                                     "E01CFACP1",
                                     "D01CFACP1",
                                     "E01CFAST5",
                                     "E01CFACP2",
                                     "D01CFACP2",
                                     "E01CFAST6",
                                     "E01NUMREC",
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
                                   "E01CFACTY",
                                   "D01CFACTY",
                                   "E01CFANUN",
                                   "D01CFANUN",
                                   "E01CFAST1",
                                   "E01CFAURN",
                                   "D01CFAURN",
                                   "E01CFAST2",
                                   "E01CFAEVN",
                                   "D01CFAEVN",
                                   "E01CFAST3",
                                   "E01CFATEP",
                                   "D01CFATEP",
                                   "E01CFAEN1",
                                   "E01CFATE1",
                                   "D01CFATE1",
                                   "E01CFATE2",
                                   "D01CFATE2",
                                   "E01CFATE3",
                                   "D01CFATE3",
                                   "E01CFACE0",
                                   "D01CFACE0",
                                   "E01CFACF1",
                                   "E01CFABO1",
                                   "E01CFAIN1",
                                   "E01CFACE1",
                                   "D01CFACE1",
                                   "E01CFACF2",
                                   "E01CFABO2",
                                   "E01CFAIN2",
                                   "E01CFACE2",
                                   "D01CFACE2",
                                   "E01CFACF3",
                                   "E01CFABO3",
                                   "E01CFAIN3",
                                   "E01CFACE3",
                                   "D01CFACE3",
                                   "E01CFACE4",
                                   "D01CFACE4",
                                   "E01CFACE5",
                                   "D01CFACE5",
                                   "E01CFACP0",
                                   "D01CFACP0",
                                   "E01CFAST4",
                                   "E01CFACE6",
                                   "D01CFACE6",
                                   "E01CFACP1",
                                   "D01CFACP1",
                                   "E01CFAST5",
                                   "E01CFACP2",
                                   "D01CFACP2",
                                   "E01CFAST6",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1150505123328";
  final static String rid = "405BE68DF4113";
  final static String fmtname = "ESD008301";
  final int FIELDCOUNT = 63;
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
  private CharacterField fieldE01CFACTY = null;
  private CharacterField fieldD01CFACTY = null;
  private CharacterField fieldE01CFANUN = null;
  private CharacterField fieldD01CFANUN = null;
  private CharacterField fieldE01CFAST1 = null;
  private CharacterField fieldE01CFAURN = null;
  private CharacterField fieldD01CFAURN = null;
  private CharacterField fieldE01CFAST2 = null;
  private CharacterField fieldE01CFAEVN = null;
  private CharacterField fieldD01CFAEVN = null;
  private CharacterField fieldE01CFAST3 = null;
  private CharacterField fieldE01CFATEP = null;
  private CharacterField fieldD01CFATEP = null;
  private CharacterField fieldE01CFAEN1 = null;
  private CharacterField fieldE01CFATE1 = null;
  private CharacterField fieldD01CFATE1 = null;
  private CharacterField fieldE01CFATE2 = null;
  private CharacterField fieldD01CFATE2 = null;
  private CharacterField fieldE01CFATE3 = null;
  private CharacterField fieldD01CFATE3 = null;
  private CharacterField fieldE01CFACE0 = null;
  private CharacterField fieldD01CFACE0 = null;
  private CharacterField fieldE01CFACF1 = null;
  private CharacterField fieldE01CFABO1 = null;
  private CharacterField fieldE01CFAIN1 = null;
  private CharacterField fieldE01CFACE1 = null;
  private CharacterField fieldD01CFACE1 = null;
  private CharacterField fieldE01CFACF2 = null;
  private CharacterField fieldE01CFABO2 = null;
  private CharacterField fieldE01CFAIN2 = null;
  private CharacterField fieldE01CFACE2 = null;
  private CharacterField fieldD01CFACE2 = null;
  private CharacterField fieldE01CFACF3 = null;
  private CharacterField fieldE01CFABO3 = null;
  private CharacterField fieldE01CFAIN3 = null;
  private CharacterField fieldE01CFACE3 = null;
  private CharacterField fieldD01CFACE3 = null;
  private CharacterField fieldE01CFACE4 = null;
  private CharacterField fieldD01CFACE4 = null;
  private CharacterField fieldE01CFACE5 = null;
  private CharacterField fieldD01CFACE5 = null;
  private CharacterField fieldE01CFACP0 = null;
  private CharacterField fieldD01CFACP0 = null;
  private CharacterField fieldE01CFAST4 = null;
  private CharacterField fieldE01CFACE6 = null;
  private CharacterField fieldD01CFACE6 = null;
  private CharacterField fieldE01CFACP1 = null;
  private CharacterField fieldD01CFACP1 = null;
  private CharacterField fieldE01CFAST5 = null;
  private CharacterField fieldE01CFACP2 = null;
  private CharacterField fieldD01CFACP2 = null;
  private CharacterField fieldE01CFAST6 = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ESD008301Message.
  */
  public ESD008301Message()
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
    recordsize = 949;
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
    fields[9] = fieldE01CFACTY =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01CFACTY");
    fields[10] = fieldD01CFACTY =
    new CharacterField(message, HEADERSIZE + 46, 45, "D01CFACTY");
    fields[11] = fieldE01CFANUN =
    new CharacterField(message, HEADERSIZE + 91, 4, "E01CFANUN");
    fields[12] = fieldD01CFANUN =
    new CharacterField(message, HEADERSIZE + 95, 45, "D01CFANUN");
    fields[13] = fieldE01CFAST1 =
    new CharacterField(message, HEADERSIZE + 140, 1, "E01CFAST1");
    fields[14] = fieldE01CFAURN =
    new CharacterField(message, HEADERSIZE + 141, 4, "E01CFAURN");
    fields[15] = fieldD01CFAURN =
    new CharacterField(message, HEADERSIZE + 145, 45, "D01CFAURN");
    fields[16] = fieldE01CFAST2 =
    new CharacterField(message, HEADERSIZE + 190, 1, "E01CFAST2");
    fields[17] = fieldE01CFAEVN =
    new CharacterField(message, HEADERSIZE + 191, 4, "E01CFAEVN");
    fields[18] = fieldD01CFAEVN =
    new CharacterField(message, HEADERSIZE + 195, 45, "D01CFAEVN");
    fields[19] = fieldE01CFAST3 =
    new CharacterField(message, HEADERSIZE + 240, 1, "E01CFAST3");
    fields[20] = fieldE01CFATEP =
    new CharacterField(message, HEADERSIZE + 241, 4, "E01CFATEP");
    fields[21] = fieldD01CFATEP =
    new CharacterField(message, HEADERSIZE + 245, 45, "D01CFATEP");
    fields[22] = fieldE01CFAEN1 =
    new CharacterField(message, HEADERSIZE + 290, 1, "E01CFAEN1");
    fields[23] = fieldE01CFATE1 =
    new CharacterField(message, HEADERSIZE + 291, 4, "E01CFATE1");
    fields[24] = fieldD01CFATE1 =
    new CharacterField(message, HEADERSIZE + 295, 45, "D01CFATE1");
    fields[25] = fieldE01CFATE2 =
    new CharacterField(message, HEADERSIZE + 340, 4, "E01CFATE2");
    fields[26] = fieldD01CFATE2 =
    new CharacterField(message, HEADERSIZE + 344, 45, "D01CFATE2");
    fields[27] = fieldE01CFATE3 =
    new CharacterField(message, HEADERSIZE + 389, 4, "E01CFATE3");
    fields[28] = fieldD01CFATE3 =
    new CharacterField(message, HEADERSIZE + 393, 45, "D01CFATE3");
    fields[29] = fieldE01CFACE0 =
    new CharacterField(message, HEADERSIZE + 438, 4, "E01CFACE0");
    fields[30] = fieldD01CFACE0 =
    new CharacterField(message, HEADERSIZE + 442, 45, "D01CFACE0");
    fields[31] = fieldE01CFACF1 =
    new CharacterField(message, HEADERSIZE + 487, 1, "E01CFACF1");
    fields[32] = fieldE01CFABO1 =
    new CharacterField(message, HEADERSIZE + 488, 1, "E01CFABO1");
    fields[33] = fieldE01CFAIN1 =
    new CharacterField(message, HEADERSIZE + 489, 1, "E01CFAIN1");
    fields[34] = fieldE01CFACE1 =
    new CharacterField(message, HEADERSIZE + 490, 4, "E01CFACE1");
    fields[35] = fieldD01CFACE1 =
    new CharacterField(message, HEADERSIZE + 494, 45, "D01CFACE1");
    fields[36] = fieldE01CFACF2 =
    new CharacterField(message, HEADERSIZE + 539, 1, "E01CFACF2");
    fields[37] = fieldE01CFABO2 =
    new CharacterField(message, HEADERSIZE + 540, 1, "E01CFABO2");
    fields[38] = fieldE01CFAIN2 =
    new CharacterField(message, HEADERSIZE + 541, 1, "E01CFAIN2");
    fields[39] = fieldE01CFACE2 =
    new CharacterField(message, HEADERSIZE + 542, 4, "E01CFACE2");
    fields[40] = fieldD01CFACE2 =
    new CharacterField(message, HEADERSIZE + 546, 45, "D01CFACE2");
    fields[41] = fieldE01CFACF3 =
    new CharacterField(message, HEADERSIZE + 591, 1, "E01CFACF3");
    fields[42] = fieldE01CFABO3 =
    new CharacterField(message, HEADERSIZE + 592, 1, "E01CFABO3");
    fields[43] = fieldE01CFAIN3 =
    new CharacterField(message, HEADERSIZE + 593, 1, "E01CFAIN3");
    fields[44] = fieldE01CFACE3 =
    new CharacterField(message, HEADERSIZE + 594, 4, "E01CFACE3");
    fields[45] = fieldD01CFACE3 =
    new CharacterField(message, HEADERSIZE + 598, 45, "D01CFACE3");
    fields[46] = fieldE01CFACE4 =
    new CharacterField(message, HEADERSIZE + 643, 4, "E01CFACE4");
    fields[47] = fieldD01CFACE4 =
    new CharacterField(message, HEADERSIZE + 647, 45, "D01CFACE4");
    fields[48] = fieldE01CFACE5 =
    new CharacterField(message, HEADERSIZE + 692, 4, "E01CFACE5");
    fields[49] = fieldD01CFACE5 =
    new CharacterField(message, HEADERSIZE + 696, 45, "D01CFACE5");
    fields[50] = fieldE01CFACP0 =
    new CharacterField(message, HEADERSIZE + 741, 4, "E01CFACP0");
    fields[51] = fieldD01CFACP0 =
    new CharacterField(message, HEADERSIZE + 745, 45, "D01CFACP0");
    fields[52] = fieldE01CFAST4 =
    new CharacterField(message, HEADERSIZE + 790, 1, "E01CFAST4");
    fields[53] = fieldE01CFACE6 =
    new CharacterField(message, HEADERSIZE + 791, 4, "E01CFACE6");
    fields[54] = fieldD01CFACE6 =
    new CharacterField(message, HEADERSIZE + 795, 45, "D01CFACE6");
    fields[55] = fieldE01CFACP1 =
    new CharacterField(message, HEADERSIZE + 840, 4, "E01CFACP1");
    fields[56] = fieldD01CFACP1 =
    new CharacterField(message, HEADERSIZE + 844, 45, "D01CFACP1");
    fields[57] = fieldE01CFAST5 =
    new CharacterField(message, HEADERSIZE + 889, 1, "E01CFAST5");
    fields[58] = fieldE01CFACP2 =
    new CharacterField(message, HEADERSIZE + 890, 4, "E01CFACP2");
    fields[59] = fieldD01CFACP2 =
    new CharacterField(message, HEADERSIZE + 894, 45, "D01CFACP2");
    fields[60] = fieldE01CFAST6 =
    new CharacterField(message, HEADERSIZE + 939, 1, "E01CFAST6");
    fields[61] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 940, 8, 0, "E01NUMREC");
    fields[62] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 948, 1, "E01INDOPE");

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
  * Set field E01CFACTY using a String value.
  */
  public void setE01CFACTY(String newvalue)
  {
    fieldE01CFACTY.setString(newvalue);
  }

  /**
  * Get value of field E01CFACTY as a String.
  */
  public String getE01CFACTY()
  {
    return fieldE01CFACTY.getString();
  }

  /**
  * Set field D01CFACTY using a String value.
  */
  public void setD01CFACTY(String newvalue)
  {
    fieldD01CFACTY.setString(newvalue);
  }

  /**
  * Get value of field D01CFACTY as a String.
  */
  public String getD01CFACTY()
  {
    return fieldD01CFACTY.getString();
  }

  /**
  * Set field E01CFANUN using a String value.
  */
  public void setE01CFANUN(String newvalue)
  {
    fieldE01CFANUN.setString(newvalue);
  }

  /**
  * Get value of field E01CFANUN as a String.
  */
  public String getE01CFANUN()
  {
    return fieldE01CFANUN.getString();
  }

  /**
  * Set field D01CFANUN using a String value.
  */
  public void setD01CFANUN(String newvalue)
  {
    fieldD01CFANUN.setString(newvalue);
  }

  /**
  * Get value of field D01CFANUN as a String.
  */
  public String getD01CFANUN()
  {
    return fieldD01CFANUN.getString();
  }

  /**
  * Set field E01CFAST1 using a String value.
  */
  public void setE01CFAST1(String newvalue)
  {
    fieldE01CFAST1.setString(newvalue);
  }

  /**
  * Get value of field E01CFAST1 as a String.
  */
  public String getE01CFAST1()
  {
    return fieldE01CFAST1.getString();
  }

  /**
  * Set field E01CFAURN using a String value.
  */
  public void setE01CFAURN(String newvalue)
  {
    fieldE01CFAURN.setString(newvalue);
  }

  /**
  * Get value of field E01CFAURN as a String.
  */
  public String getE01CFAURN()
  {
    return fieldE01CFAURN.getString();
  }

  /**
  * Set field D01CFAURN using a String value.
  */
  public void setD01CFAURN(String newvalue)
  {
    fieldD01CFAURN.setString(newvalue);
  }

  /**
  * Get value of field D01CFAURN as a String.
  */
  public String getD01CFAURN()
  {
    return fieldD01CFAURN.getString();
  }

  /**
  * Set field E01CFAST2 using a String value.
  */
  public void setE01CFAST2(String newvalue)
  {
    fieldE01CFAST2.setString(newvalue);
  }

  /**
  * Get value of field E01CFAST2 as a String.
  */
  public String getE01CFAST2()
  {
    return fieldE01CFAST2.getString();
  }

  /**
  * Set field E01CFAEVN using a String value.
  */
  public void setE01CFAEVN(String newvalue)
  {
    fieldE01CFAEVN.setString(newvalue);
  }

  /**
  * Get value of field E01CFAEVN as a String.
  */
  public String getE01CFAEVN()
  {
    return fieldE01CFAEVN.getString();
  }

  /**
  * Set field D01CFAEVN using a String value.
  */
  public void setD01CFAEVN(String newvalue)
  {
    fieldD01CFAEVN.setString(newvalue);
  }

  /**
  * Get value of field D01CFAEVN as a String.
  */
  public String getD01CFAEVN()
  {
    return fieldD01CFAEVN.getString();
  }

  /**
  * Set field E01CFAST3 using a String value.
  */
  public void setE01CFAST3(String newvalue)
  {
    fieldE01CFAST3.setString(newvalue);
  }

  /**
  * Get value of field E01CFAST3 as a String.
  */
  public String getE01CFAST3()
  {
    return fieldE01CFAST3.getString();
  }

  /**
  * Set field E01CFATEP using a String value.
  */
  public void setE01CFATEP(String newvalue)
  {
    fieldE01CFATEP.setString(newvalue);
  }

  /**
  * Get value of field E01CFATEP as a String.
  */
  public String getE01CFATEP()
  {
    return fieldE01CFATEP.getString();
  }

  /**
  * Set field D01CFATEP using a String value.
  */
  public void setD01CFATEP(String newvalue)
  {
    fieldD01CFATEP.setString(newvalue);
  }

  /**
  * Get value of field D01CFATEP as a String.
  */
  public String getD01CFATEP()
  {
    return fieldD01CFATEP.getString();
  }

  /**
  * Set field E01CFAEN1 using a String value.
  */
  public void setE01CFAEN1(String newvalue)
  {
    fieldE01CFAEN1.setString(newvalue);
  }

  /**
  * Get value of field E01CFAEN1 as a String.
  */
  public String getE01CFAEN1()
  {
    return fieldE01CFAEN1.getString();
  }

  /**
  * Set field E01CFATE1 using a String value.
  */
  public void setE01CFATE1(String newvalue)
  {
    fieldE01CFATE1.setString(newvalue);
  }

  /**
  * Get value of field E01CFATE1 as a String.
  */
  public String getE01CFATE1()
  {
    return fieldE01CFATE1.getString();
  }

  /**
  * Set field D01CFATE1 using a String value.
  */
  public void setD01CFATE1(String newvalue)
  {
    fieldD01CFATE1.setString(newvalue);
  }

  /**
  * Get value of field D01CFATE1 as a String.
  */
  public String getD01CFATE1()
  {
    return fieldD01CFATE1.getString();
  }

  /**
  * Set field E01CFATE2 using a String value.
  */
  public void setE01CFATE2(String newvalue)
  {
    fieldE01CFATE2.setString(newvalue);
  }

  /**
  * Get value of field E01CFATE2 as a String.
  */
  public String getE01CFATE2()
  {
    return fieldE01CFATE2.getString();
  }

  /**
  * Set field D01CFATE2 using a String value.
  */
  public void setD01CFATE2(String newvalue)
  {
    fieldD01CFATE2.setString(newvalue);
  }

  /**
  * Get value of field D01CFATE2 as a String.
  */
  public String getD01CFATE2()
  {
    return fieldD01CFATE2.getString();
  }

  /**
  * Set field E01CFATE3 using a String value.
  */
  public void setE01CFATE3(String newvalue)
  {
    fieldE01CFATE3.setString(newvalue);
  }

  /**
  * Get value of field E01CFATE3 as a String.
  */
  public String getE01CFATE3()
  {
    return fieldE01CFATE3.getString();
  }

  /**
  * Set field D01CFATE3 using a String value.
  */
  public void setD01CFATE3(String newvalue)
  {
    fieldD01CFATE3.setString(newvalue);
  }

  /**
  * Get value of field D01CFATE3 as a String.
  */
  public String getD01CFATE3()
  {
    return fieldD01CFATE3.getString();
  }

  /**
  * Set field E01CFACE0 using a String value.
  */
  public void setE01CFACE0(String newvalue)
  {
    fieldE01CFACE0.setString(newvalue);
  }

  /**
  * Get value of field E01CFACE0 as a String.
  */
  public String getE01CFACE0()
  {
    return fieldE01CFACE0.getString();
  }

  /**
  * Set field D01CFACE0 using a String value.
  */
  public void setD01CFACE0(String newvalue)
  {
    fieldD01CFACE0.setString(newvalue);
  }

  /**
  * Get value of field D01CFACE0 as a String.
  */
  public String getD01CFACE0()
  {
    return fieldD01CFACE0.getString();
  }

  /**
  * Set field E01CFACF1 using a String value.
  */
  public void setE01CFACF1(String newvalue)
  {
    fieldE01CFACF1.setString(newvalue);
  }

  /**
  * Get value of field E01CFACF1 as a String.
  */
  public String getE01CFACF1()
  {
    return fieldE01CFACF1.getString();
  }

  /**
  * Set field E01CFABO1 using a String value.
  */
  public void setE01CFABO1(String newvalue)
  {
    fieldE01CFABO1.setString(newvalue);
  }

  /**
  * Get value of field E01CFABO1 as a String.
  */
  public String getE01CFABO1()
  {
    return fieldE01CFABO1.getString();
  }

  /**
  * Set field E01CFAIN1 using a String value.
  */
  public void setE01CFAIN1(String newvalue)
  {
    fieldE01CFAIN1.setString(newvalue);
  }

  /**
  * Get value of field E01CFAIN1 as a String.
  */
  public String getE01CFAIN1()
  {
    return fieldE01CFAIN1.getString();
  }

  /**
  * Set field E01CFACE1 using a String value.
  */
  public void setE01CFACE1(String newvalue)
  {
    fieldE01CFACE1.setString(newvalue);
  }

  /**
  * Get value of field E01CFACE1 as a String.
  */
  public String getE01CFACE1()
  {
    return fieldE01CFACE1.getString();
  }

  /**
  * Set field D01CFACE1 using a String value.
  */
  public void setD01CFACE1(String newvalue)
  {
    fieldD01CFACE1.setString(newvalue);
  }

  /**
  * Get value of field D01CFACE1 as a String.
  */
  public String getD01CFACE1()
  {
    return fieldD01CFACE1.getString();
  }

  /**
  * Set field E01CFACF2 using a String value.
  */
  public void setE01CFACF2(String newvalue)
  {
    fieldE01CFACF2.setString(newvalue);
  }

  /**
  * Get value of field E01CFACF2 as a String.
  */
  public String getE01CFACF2()
  {
    return fieldE01CFACF2.getString();
  }

  /**
  * Set field E01CFABO2 using a String value.
  */
  public void setE01CFABO2(String newvalue)
  {
    fieldE01CFABO2.setString(newvalue);
  }

  /**
  * Get value of field E01CFABO2 as a String.
  */
  public String getE01CFABO2()
  {
    return fieldE01CFABO2.getString();
  }

  /**
  * Set field E01CFAIN2 using a String value.
  */
  public void setE01CFAIN2(String newvalue)
  {
    fieldE01CFAIN2.setString(newvalue);
  }

  /**
  * Get value of field E01CFAIN2 as a String.
  */
  public String getE01CFAIN2()
  {
    return fieldE01CFAIN2.getString();
  }

  /**
  * Set field E01CFACE2 using a String value.
  */
  public void setE01CFACE2(String newvalue)
  {
    fieldE01CFACE2.setString(newvalue);
  }

  /**
  * Get value of field E01CFACE2 as a String.
  */
  public String getE01CFACE2()
  {
    return fieldE01CFACE2.getString();
  }

  /**
  * Set field D01CFACE2 using a String value.
  */
  public void setD01CFACE2(String newvalue)
  {
    fieldD01CFACE2.setString(newvalue);
  }

  /**
  * Get value of field D01CFACE2 as a String.
  */
  public String getD01CFACE2()
  {
    return fieldD01CFACE2.getString();
  }

  /**
  * Set field E01CFACF3 using a String value.
  */
  public void setE01CFACF3(String newvalue)
  {
    fieldE01CFACF3.setString(newvalue);
  }

  /**
  * Get value of field E01CFACF3 as a String.
  */
  public String getE01CFACF3()
  {
    return fieldE01CFACF3.getString();
  }

  /**
  * Set field E01CFABO3 using a String value.
  */
  public void setE01CFABO3(String newvalue)
  {
    fieldE01CFABO3.setString(newvalue);
  }

  /**
  * Get value of field E01CFABO3 as a String.
  */
  public String getE01CFABO3()
  {
    return fieldE01CFABO3.getString();
  }

  /**
  * Set field E01CFAIN3 using a String value.
  */
  public void setE01CFAIN3(String newvalue)
  {
    fieldE01CFAIN3.setString(newvalue);
  }

  /**
  * Get value of field E01CFAIN3 as a String.
  */
  public String getE01CFAIN3()
  {
    return fieldE01CFAIN3.getString();
  }

  /**
  * Set field E01CFACE3 using a String value.
  */
  public void setE01CFACE3(String newvalue)
  {
    fieldE01CFACE3.setString(newvalue);
  }

  /**
  * Get value of field E01CFACE3 as a String.
  */
  public String getE01CFACE3()
  {
    return fieldE01CFACE3.getString();
  }

  /**
  * Set field D01CFACE3 using a String value.
  */
  public void setD01CFACE3(String newvalue)
  {
    fieldD01CFACE3.setString(newvalue);
  }

  /**
  * Get value of field D01CFACE3 as a String.
  */
  public String getD01CFACE3()
  {
    return fieldD01CFACE3.getString();
  }

  /**
  * Set field E01CFACE4 using a String value.
  */
  public void setE01CFACE4(String newvalue)
  {
    fieldE01CFACE4.setString(newvalue);
  }

  /**
  * Get value of field E01CFACE4 as a String.
  */
  public String getE01CFACE4()
  {
    return fieldE01CFACE4.getString();
  }

  /**
  * Set field D01CFACE4 using a String value.
  */
  public void setD01CFACE4(String newvalue)
  {
    fieldD01CFACE4.setString(newvalue);
  }

  /**
  * Get value of field D01CFACE4 as a String.
  */
  public String getD01CFACE4()
  {
    return fieldD01CFACE4.getString();
  }

  /**
  * Set field E01CFACE5 using a String value.
  */
  public void setE01CFACE5(String newvalue)
  {
    fieldE01CFACE5.setString(newvalue);
  }

  /**
  * Get value of field E01CFACE5 as a String.
  */
  public String getE01CFACE5()
  {
    return fieldE01CFACE5.getString();
  }

  /**
  * Set field D01CFACE5 using a String value.
  */
  public void setD01CFACE5(String newvalue)
  {
    fieldD01CFACE5.setString(newvalue);
  }

  /**
  * Get value of field D01CFACE5 as a String.
  */
  public String getD01CFACE5()
  {
    return fieldD01CFACE5.getString();
  }

  /**
  * Set field E01CFACP0 using a String value.
  */
  public void setE01CFACP0(String newvalue)
  {
    fieldE01CFACP0.setString(newvalue);
  }

  /**
  * Get value of field E01CFACP0 as a String.
  */
  public String getE01CFACP0()
  {
    return fieldE01CFACP0.getString();
  }

  /**
  * Set field D01CFACP0 using a String value.
  */
  public void setD01CFACP0(String newvalue)
  {
    fieldD01CFACP0.setString(newvalue);
  }

  /**
  * Get value of field D01CFACP0 as a String.
  */
  public String getD01CFACP0()
  {
    return fieldD01CFACP0.getString();
  }

  /**
  * Set field E01CFAST4 using a String value.
  */
  public void setE01CFAST4(String newvalue)
  {
    fieldE01CFAST4.setString(newvalue);
  }

  /**
  * Get value of field E01CFAST4 as a String.
  */
  public String getE01CFAST4()
  {
    return fieldE01CFAST4.getString();
  }

  /**
  * Set field E01CFACE6 using a String value.
  */
  public void setE01CFACE6(String newvalue)
  {
    fieldE01CFACE6.setString(newvalue);
  }

  /**
  * Get value of field E01CFACE6 as a String.
  */
  public String getE01CFACE6()
  {
    return fieldE01CFACE6.getString();
  }

  /**
  * Set field D01CFACE6 using a String value.
  */
  public void setD01CFACE6(String newvalue)
  {
    fieldD01CFACE6.setString(newvalue);
  }

  /**
  * Get value of field D01CFACE6 as a String.
  */
  public String getD01CFACE6()
  {
    return fieldD01CFACE6.getString();
  }

  /**
  * Set field E01CFACP1 using a String value.
  */
  public void setE01CFACP1(String newvalue)
  {
    fieldE01CFACP1.setString(newvalue);
  }

  /**
  * Get value of field E01CFACP1 as a String.
  */
  public String getE01CFACP1()
  {
    return fieldE01CFACP1.getString();
  }

  /**
  * Set field D01CFACP1 using a String value.
  */
  public void setD01CFACP1(String newvalue)
  {
    fieldD01CFACP1.setString(newvalue);
  }

  /**
  * Get value of field D01CFACP1 as a String.
  */
  public String getD01CFACP1()
  {
    return fieldD01CFACP1.getString();
  }

  /**
  * Set field E01CFAST5 using a String value.
  */
  public void setE01CFAST5(String newvalue)
  {
    fieldE01CFAST5.setString(newvalue);
  }

  /**
  * Get value of field E01CFAST5 as a String.
  */
  public String getE01CFAST5()
  {
    return fieldE01CFAST5.getString();
  }

  /**
  * Set field E01CFACP2 using a String value.
  */
  public void setE01CFACP2(String newvalue)
  {
    fieldE01CFACP2.setString(newvalue);
  }

  /**
  * Get value of field E01CFACP2 as a String.
  */
  public String getE01CFACP2()
  {
    return fieldE01CFACP2.getString();
  }

  /**
  * Set field D01CFACP2 using a String value.
  */
  public void setD01CFACP2(String newvalue)
  {
    fieldD01CFACP2.setString(newvalue);
  }

  /**
  * Get value of field D01CFACP2 as a String.
  */
  public String getD01CFACP2()
  {
    return fieldD01CFACP2.getString();
  }

  /**
  * Set field E01CFAST6 using a String value.
  */
  public void setE01CFAST6(String newvalue)
  {
    fieldE01CFAST6.setString(newvalue);
  }

  /**
  * Get value of field E01CFAST6 as a String.
  */
  public String getE01CFAST6()
  {
    return fieldE01CFAST6.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
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
