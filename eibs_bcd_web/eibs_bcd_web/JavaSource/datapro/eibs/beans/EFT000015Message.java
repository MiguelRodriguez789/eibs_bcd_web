package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFT000015 physical file definition.
* 
* File level identifier is 1130611113158.
* Record format level identifier is 3984F43E3C7E3.
*/

public class EFT000015Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H15USERID",
                                     "H15PROGRM",
                                     "H15TIMSYS",
                                     "H15SCRCOD",
                                     "H15OPECOD",
                                     "H15FLGMAS",
                                     "H15FLGWK1",
                                     "H15FLGWK2",
                                     "H15FLGWK3",
                                     "E15ACCNUM",
                                     "E15CUSCUN",
                                     "E15CUSNA1",
                                     "E15CUSNA2",
                                     "E15CUSNA3",
                                     "E15CUSNA4",
                                     "E15CUSCTY",
                                     "E15CUSSTE",
                                     "E15CUSCTR",
                                     "E15CUSZPC",
                                     "E15CUSPOB",
                                     "E15CUSIDN",
                                     "E15CUSTID",
                                     "E15CUSPID",
                                     "E15CUSLGT",
                                     "E15CUSFL1",
                                     "E15CUSOFC",
                                     "E15CUSBUC",
                                     "E15CUSINC",
                                     "E15CUSHPN",
                                     "E15CUSPHN",
                                     "E15CUSPH1",
                                     "E15OPNDT1",
                                     "E15OPNDT2",
                                     "E15OPNDT3",
                                     "E15BRNNUM",
                                     "E15CCYCDE",
                                     "E15PROCDE",
                                     "E15TYPCDE",
                                     "E15OPNAMT",
                                     "E15LETOAM",
                                     "E15ATMCAR",
                                     "E15STATUS",
                                     "E15DSCOFC",
                                     "E15DSCBUC",
                                     "E15DSCINC",
                                     "E15BANKNM",
                                     "E15BRNNME",
                                     "E15BRNADR",
                                     "E15BRNCIT",
                                     "E15BRNPHN",
                                     "E15CNTBID",
                                     "E15CNTRD1",
                                     "E15CNTRD2",
                                     "E15CNTRD3",
                                     "E15DSCPRO",
                                     "E15DSCTYP",
                                     "E15DSCCCY"
                                   };
  final static String tnames[] = {
                                   "H15USERID",
                                   "H15PROGRM",
                                   "H15TIMSYS",
                                   "H15SCRCOD",
                                   "H15OPECOD",
                                   "H15FLGMAS",
                                   "H15FLGWK1",
                                   "H15FLGWK2",
                                   "H15FLGWK3",
                                   "E15ACCNUM",
                                   "E15CUSCUN",
                                   "E15CUSNA1",
                                   "E15CUSNA2",
                                   "E15CUSNA3",
                                   "E15CUSNA4",
                                   "E15CUSCTY",
                                   "E15CUSSTE",
                                   "E15CUSCTR",
                                   "E15CUSZPC",
                                   "E15CUSPOB",
                                   "E15CUSIDN",
                                   "E15CUSTID",
                                   "E15CUSPID",
                                   "E15CUSLGT",
                                   "E15CUSFL1",
                                   "E15CUSOFC",
                                   "E15CUSBUC",
                                   "E15CUSINC",
                                   "E15CUSHPN",
                                   "E15CUSPHN",
                                   "E15CUSPH1",
                                   "E15OPNDT1",
                                   "E15OPNDT2",
                                   "E15OPNDT3",
                                   "E15BRNNUM",
                                   "E15CCYCDE",
                                   "E15PROCDE",
                                   "E15TYPCDE",
                                   "E15OPNAMT",
                                   "E15LETOAM",
                                   "E15ATMCAR",
                                   "E15STATUS",
                                   "E15DSCOFC",
                                   "E15DSCBUC",
                                   "E15DSCINC",
                                   "E15BANKNM",
                                   "E15BRNNME",
                                   "E15BRNADR",
                                   "E15BRNCIT",
                                   "E15BRNPHN",
                                   "E15CNTBID",
                                   "E15CNTRD1",
                                   "E15CNTRD2",
                                   "E15CNTRD3",
                                   "E15DSCPRO",
                                   "E15DSCTYP",
                                   "E15DSCCCY"
                                 };
  final static String fid = "1130611113158";
  final static String rid = "3984F43E3C7E3";
  final static String fmtname = "EFT000015";
  final int FIELDCOUNT = 57;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH15USERID = null;
  private CharacterField fieldH15PROGRM = null;
  private CharacterField fieldH15TIMSYS = null;
  private CharacterField fieldH15SCRCOD = null;
  private CharacterField fieldH15OPECOD = null;
  private CharacterField fieldH15FLGMAS = null;
  private CharacterField fieldH15FLGWK1 = null;
  private CharacterField fieldH15FLGWK2 = null;
  private CharacterField fieldH15FLGWK3 = null;
  private DecimalField fieldE15ACCNUM = null;
  private DecimalField fieldE15CUSCUN = null;
  private CharacterField fieldE15CUSNA1 = null;
  private CharacterField fieldE15CUSNA2 = null;
  private CharacterField fieldE15CUSNA3 = null;
  private CharacterField fieldE15CUSNA4 = null;
  private CharacterField fieldE15CUSCTY = null;
  private CharacterField fieldE15CUSSTE = null;
  private CharacterField fieldE15CUSCTR = null;
  private CharacterField fieldE15CUSZPC = null;
  private CharacterField fieldE15CUSPOB = null;
  private CharacterField fieldE15CUSIDN = null;
  private CharacterField fieldE15CUSTID = null;
  private CharacterField fieldE15CUSPID = null;
  private CharacterField fieldE15CUSLGT = null;
  private CharacterField fieldE15CUSFL1 = null;
  private CharacterField fieldE15CUSOFC = null;
  private CharacterField fieldE15CUSBUC = null;
  private CharacterField fieldE15CUSINC = null;
  private DecimalField fieldE15CUSHPN = null;
  private DecimalField fieldE15CUSPHN = null;
  private DecimalField fieldE15CUSPH1 = null;
  private DecimalField fieldE15OPNDT1 = null;
  private DecimalField fieldE15OPNDT2 = null;
  private DecimalField fieldE15OPNDT3 = null;
  private DecimalField fieldE15BRNNUM = null;
  private CharacterField fieldE15CCYCDE = null;
  private CharacterField fieldE15PROCDE = null;
  private CharacterField fieldE15TYPCDE = null;
  private DecimalField fieldE15OPNAMT = null;
  private CharacterField fieldE15LETOAM = null;
  private CharacterField fieldE15ATMCAR = null;
  private CharacterField fieldE15STATUS = null;
  private CharacterField fieldE15DSCOFC = null;
  private CharacterField fieldE15DSCBUC = null;
  private CharacterField fieldE15DSCINC = null;
  private CharacterField fieldE15BANKNM = null;
  private CharacterField fieldE15BRNNME = null;
  private CharacterField fieldE15BRNADR = null;
  private CharacterField fieldE15BRNCIT = null;
  private DecimalField fieldE15BRNPHN = null;
  private CharacterField fieldE15CNTBID = null;
  private DecimalField fieldE15CNTRD1 = null;
  private DecimalField fieldE15CNTRD2 = null;
  private DecimalField fieldE15CNTRD3 = null;
  private CharacterField fieldE15DSCPRO = null;
  private CharacterField fieldE15DSCTYP = null;
  private CharacterField fieldE15DSCCCY = null;

  /**
  * Constructor for EFT000015Message.
  */
  public EFT000015Message()
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
    recordsize = 1261;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH15USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H15USERID");
    fields[1] = fieldH15PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H15PROGRM");
    fields[2] = fieldH15TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H15TIMSYS");
    fields[3] = fieldH15SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H15SCRCOD");
    fields[4] = fieldH15OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H15OPECOD");
    fields[5] = fieldH15FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H15FLGMAS");
    fields[6] = fieldH15FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H15FLGWK1");
    fields[7] = fieldH15FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H15FLGWK2");
    fields[8] = fieldH15FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H15FLGWK3");
    fields[9] = fieldE15ACCNUM =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E15ACCNUM");
    fields[10] = fieldE15CUSCUN =
    new DecimalField(message, HEADERSIZE + 55, 10, 0, "E15CUSCUN");
    fields[11] = fieldE15CUSNA1 =
    new CharacterField(message, HEADERSIZE + 65, 60, "E15CUSNA1");
    fields[12] = fieldE15CUSNA2 =
    new CharacterField(message, HEADERSIZE + 125, 60, "E15CUSNA2");
    fields[13] = fieldE15CUSNA3 =
    new CharacterField(message, HEADERSIZE + 185, 60, "E15CUSNA3");
    fields[14] = fieldE15CUSNA4 =
    new CharacterField(message, HEADERSIZE + 245, 60, "E15CUSNA4");
    fields[15] = fieldE15CUSCTY =
    new CharacterField(message, HEADERSIZE + 305, 35, "E15CUSCTY");
    fields[16] = fieldE15CUSSTE =
    new CharacterField(message, HEADERSIZE + 340, 4, "E15CUSSTE");
    fields[17] = fieldE15CUSCTR =
    new CharacterField(message, HEADERSIZE + 344, 35, "E15CUSCTR");
    fields[18] = fieldE15CUSZPC =
    new CharacterField(message, HEADERSIZE + 379, 15, "E15CUSZPC");
    fields[19] = fieldE15CUSPOB =
    new CharacterField(message, HEADERSIZE + 394, 10, "E15CUSPOB");
    fields[20] = fieldE15CUSIDN =
    new CharacterField(message, HEADERSIZE + 404, 25, "E15CUSIDN");
    fields[21] = fieldE15CUSTID =
    new CharacterField(message, HEADERSIZE + 429, 4, "E15CUSTID");
    fields[22] = fieldE15CUSPID =
    new CharacterField(message, HEADERSIZE + 433, 4, "E15CUSPID");
    fields[23] = fieldE15CUSLGT =
    new CharacterField(message, HEADERSIZE + 437, 1, "E15CUSLGT");
    fields[24] = fieldE15CUSFL1 =
    new CharacterField(message, HEADERSIZE + 438, 1, "E15CUSFL1");
    fields[25] = fieldE15CUSOFC =
    new CharacterField(message, HEADERSIZE + 439, 4, "E15CUSOFC");
    fields[26] = fieldE15CUSBUC =
    new CharacterField(message, HEADERSIZE + 443, 4, "E15CUSBUC");
    fields[27] = fieldE15CUSINC =
    new CharacterField(message, HEADERSIZE + 447, 4, "E15CUSINC");
    fields[28] = fieldE15CUSHPN =
    new DecimalField(message, HEADERSIZE + 451, 16, 0, "E15CUSHPN");
    fields[29] = fieldE15CUSPHN =
    new DecimalField(message, HEADERSIZE + 467, 16, 0, "E15CUSPHN");
    fields[30] = fieldE15CUSPH1 =
    new DecimalField(message, HEADERSIZE + 483, 16, 0, "E15CUSPH1");
    fields[31] = fieldE15OPNDT1 =
    new DecimalField(message, HEADERSIZE + 499, 3, 0, "E15OPNDT1");
    fields[32] = fieldE15OPNDT2 =
    new DecimalField(message, HEADERSIZE + 502, 3, 0, "E15OPNDT2");
    fields[33] = fieldE15OPNDT3 =
    new DecimalField(message, HEADERSIZE + 505, 5, 0, "E15OPNDT3");
    fields[34] = fieldE15BRNNUM =
    new DecimalField(message, HEADERSIZE + 510, 5, 0, "E15BRNNUM");
    fields[35] = fieldE15CCYCDE =
    new CharacterField(message, HEADERSIZE + 515, 3, "E15CCYCDE");
    fields[36] = fieldE15PROCDE =
    new CharacterField(message, HEADERSIZE + 518, 4, "E15PROCDE");
    fields[37] = fieldE15TYPCDE =
    new CharacterField(message, HEADERSIZE + 522, 4, "E15TYPCDE");
    fields[38] = fieldE15OPNAMT =
    new DecimalField(message, HEADERSIZE + 526, 17, 2, "E15OPNAMT");
    fields[39] = fieldE15LETOAM =
    new CharacterField(message, HEADERSIZE + 543, 160, "E15LETOAM");
    fields[40] = fieldE15ATMCAR =
    new CharacterField(message, HEADERSIZE + 703, 1, "E15ATMCAR");
    fields[41] = fieldE15STATUS =
    new CharacterField(message, HEADERSIZE + 704, 45, "E15STATUS");
    fields[42] = fieldE15DSCOFC =
    new CharacterField(message, HEADERSIZE + 749, 45, "E15DSCOFC");
    fields[43] = fieldE15DSCBUC =
    new CharacterField(message, HEADERSIZE + 794, 45, "E15DSCBUC");
    fields[44] = fieldE15DSCINC =
    new CharacterField(message, HEADERSIZE + 839, 45, "E15DSCINC");
    fields[45] = fieldE15BANKNM =
    new CharacterField(message, HEADERSIZE + 884, 45, "E15BANKNM");
    fields[46] = fieldE15BRNNME =
    new CharacterField(message, HEADERSIZE + 929, 45, "E15BRNNME");
    fields[47] = fieldE15BRNADR =
    new CharacterField(message, HEADERSIZE + 974, 45, "E15BRNADR");
    fields[48] = fieldE15BRNCIT =
    new CharacterField(message, HEADERSIZE + 1019, 45, "E15BRNCIT");
    fields[49] = fieldE15BRNPHN =
    new DecimalField(message, HEADERSIZE + 1064, 16, 0, "E15BRNPHN");
    fields[50] = fieldE15CNTBID =
    new CharacterField(message, HEADERSIZE + 1080, 35, "E15CNTBID");
    fields[51] = fieldE15CNTRD1 =
    new DecimalField(message, HEADERSIZE + 1115, 3, 0, "E15CNTRD1");
    fields[52] = fieldE15CNTRD2 =
    new DecimalField(message, HEADERSIZE + 1118, 3, 0, "E15CNTRD2");
    fields[53] = fieldE15CNTRD3 =
    new DecimalField(message, HEADERSIZE + 1121, 5, 0, "E15CNTRD3");
    fields[54] = fieldE15DSCPRO =
    new CharacterField(message, HEADERSIZE + 1126, 45, "E15DSCPRO");
    fields[55] = fieldE15DSCTYP =
    new CharacterField(message, HEADERSIZE + 1171, 45, "E15DSCTYP");
    fields[56] = fieldE15DSCCCY =
    new CharacterField(message, HEADERSIZE + 1216, 45, "E15DSCCCY");

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
  * Set field H15USERID using a String value.
  */
  public void setH15USERID(String newvalue)
  {
    fieldH15USERID.setString(newvalue);
  }

  /**
  * Get value of field H15USERID as a String.
  */
  public String getH15USERID()
  {
    return fieldH15USERID.getString();
  }

  /**
  * Set field H15PROGRM using a String value.
  */
  public void setH15PROGRM(String newvalue)
  {
    fieldH15PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H15PROGRM as a String.
  */
  public String getH15PROGRM()
  {
    return fieldH15PROGRM.getString();
  }

  /**
  * Set field H15TIMSYS using a String value.
  */
  public void setH15TIMSYS(String newvalue)
  {
    fieldH15TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H15TIMSYS as a String.
  */
  public String getH15TIMSYS()
  {
    return fieldH15TIMSYS.getString();
  }

  /**
  * Set field H15SCRCOD using a String value.
  */
  public void setH15SCRCOD(String newvalue)
  {
    fieldH15SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H15SCRCOD as a String.
  */
  public String getH15SCRCOD()
  {
    return fieldH15SCRCOD.getString();
  }

  /**
  * Set field H15OPECOD using a String value.
  */
  public void setH15OPECOD(String newvalue)
  {
    fieldH15OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H15OPECOD as a String.
  */
  public String getH15OPECOD()
  {
    return fieldH15OPECOD.getString();
  }

  /**
  * Set field H15FLGMAS using a String value.
  */
  public void setH15FLGMAS(String newvalue)
  {
    fieldH15FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H15FLGMAS as a String.
  */
  public String getH15FLGMAS()
  {
    return fieldH15FLGMAS.getString();
  }

  /**
  * Set field H15FLGWK1 using a String value.
  */
  public void setH15FLGWK1(String newvalue)
  {
    fieldH15FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H15FLGWK1 as a String.
  */
  public String getH15FLGWK1()
  {
    return fieldH15FLGWK1.getString();
  }

  /**
  * Set field H15FLGWK2 using a String value.
  */
  public void setH15FLGWK2(String newvalue)
  {
    fieldH15FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H15FLGWK2 as a String.
  */
  public String getH15FLGWK2()
  {
    return fieldH15FLGWK2.getString();
  }

  /**
  * Set field H15FLGWK3 using a String value.
  */
  public void setH15FLGWK3(String newvalue)
  {
    fieldH15FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H15FLGWK3 as a String.
  */
  public String getH15FLGWK3()
  {
    return fieldH15FLGWK3.getString();
  }

  /**
  * Set field E15ACCNUM using a String value.
  */
  public void setE15ACCNUM(String newvalue)
  {
    fieldE15ACCNUM.setString(newvalue);
  }

  /**
  * Get value of field E15ACCNUM as a String.
  */
  public String getE15ACCNUM()
  {
    return fieldE15ACCNUM.getString();
  }

  /**
  * Set numeric field E15ACCNUM using a BigDecimal value.
  */
  public void setE15ACCNUM(BigDecimal newvalue)
  {
    fieldE15ACCNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15ACCNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15ACCNUM()
  {
    return fieldE15ACCNUM.getBigDecimal();
  }

  /**
  * Set field E15CUSCUN using a String value.
  */
  public void setE15CUSCUN(String newvalue)
  {
    fieldE15CUSCUN.setString(newvalue);
  }

  /**
  * Get value of field E15CUSCUN as a String.
  */
  public String getE15CUSCUN()
  {
    return fieldE15CUSCUN.getString();
  }

  /**
  * Set numeric field E15CUSCUN using a BigDecimal value.
  */
  public void setE15CUSCUN(BigDecimal newvalue)
  {
    fieldE15CUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15CUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15CUSCUN()
  {
    return fieldE15CUSCUN.getBigDecimal();
  }

  /**
  * Set field E15CUSNA1 using a String value.
  */
  public void setE15CUSNA1(String newvalue)
  {
    fieldE15CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E15CUSNA1 as a String.
  */
  public String getE15CUSNA1()
  {
    return fieldE15CUSNA1.getString();
  }

  /**
  * Set field E15CUSNA2 using a String value.
  */
  public void setE15CUSNA2(String newvalue)
  {
    fieldE15CUSNA2.setString(newvalue);
  }

  /**
  * Get value of field E15CUSNA2 as a String.
  */
  public String getE15CUSNA2()
  {
    return fieldE15CUSNA2.getString();
  }

  /**
  * Set field E15CUSNA3 using a String value.
  */
  public void setE15CUSNA3(String newvalue)
  {
    fieldE15CUSNA3.setString(newvalue);
  }

  /**
  * Get value of field E15CUSNA3 as a String.
  */
  public String getE15CUSNA3()
  {
    return fieldE15CUSNA3.getString();
  }

  /**
  * Set field E15CUSNA4 using a String value.
  */
  public void setE15CUSNA4(String newvalue)
  {
    fieldE15CUSNA4.setString(newvalue);
  }

  /**
  * Get value of field E15CUSNA4 as a String.
  */
  public String getE15CUSNA4()
  {
    return fieldE15CUSNA4.getString();
  }

  /**
  * Set field E15CUSCTY using a String value.
  */
  public void setE15CUSCTY(String newvalue)
  {
    fieldE15CUSCTY.setString(newvalue);
  }

  /**
  * Get value of field E15CUSCTY as a String.
  */
  public String getE15CUSCTY()
  {
    return fieldE15CUSCTY.getString();
  }

  /**
  * Set field E15CUSSTE using a String value.
  */
  public void setE15CUSSTE(String newvalue)
  {
    fieldE15CUSSTE.setString(newvalue);
  }

  /**
  * Get value of field E15CUSSTE as a String.
  */
  public String getE15CUSSTE()
  {
    return fieldE15CUSSTE.getString();
  }

  /**
  * Set field E15CUSCTR using a String value.
  */
  public void setE15CUSCTR(String newvalue)
  {
    fieldE15CUSCTR.setString(newvalue);
  }

  /**
  * Get value of field E15CUSCTR as a String.
  */
  public String getE15CUSCTR()
  {
    return fieldE15CUSCTR.getString();
  }

  /**
  * Set field E15CUSZPC using a String value.
  */
  public void setE15CUSZPC(String newvalue)
  {
    fieldE15CUSZPC.setString(newvalue);
  }

  /**
  * Get value of field E15CUSZPC as a String.
  */
  public String getE15CUSZPC()
  {
    return fieldE15CUSZPC.getString();
  }

  /**
  * Set field E15CUSPOB using a String value.
  */
  public void setE15CUSPOB(String newvalue)
  {
    fieldE15CUSPOB.setString(newvalue);
  }

  /**
  * Get value of field E15CUSPOB as a String.
  */
  public String getE15CUSPOB()
  {
    return fieldE15CUSPOB.getString();
  }

  /**
  * Set field E15CUSIDN using a String value.
  */
  public void setE15CUSIDN(String newvalue)
  {
    fieldE15CUSIDN.setString(newvalue);
  }

  /**
  * Get value of field E15CUSIDN as a String.
  */
  public String getE15CUSIDN()
  {
    return fieldE15CUSIDN.getString();
  }

  /**
  * Set field E15CUSTID using a String value.
  */
  public void setE15CUSTID(String newvalue)
  {
    fieldE15CUSTID.setString(newvalue);
  }

  /**
  * Get value of field E15CUSTID as a String.
  */
  public String getE15CUSTID()
  {
    return fieldE15CUSTID.getString();
  }

  /**
  * Set field E15CUSPID using a String value.
  */
  public void setE15CUSPID(String newvalue)
  {
    fieldE15CUSPID.setString(newvalue);
  }

  /**
  * Get value of field E15CUSPID as a String.
  */
  public String getE15CUSPID()
  {
    return fieldE15CUSPID.getString();
  }

  /**
  * Set field E15CUSLGT using a String value.
  */
  public void setE15CUSLGT(String newvalue)
  {
    fieldE15CUSLGT.setString(newvalue);
  }

  /**
  * Get value of field E15CUSLGT as a String.
  */
  public String getE15CUSLGT()
  {
    return fieldE15CUSLGT.getString();
  }

  /**
  * Set field E15CUSFL1 using a String value.
  */
  public void setE15CUSFL1(String newvalue)
  {
    fieldE15CUSFL1.setString(newvalue);
  }

  /**
  * Get value of field E15CUSFL1 as a String.
  */
  public String getE15CUSFL1()
  {
    return fieldE15CUSFL1.getString();
  }

  /**
  * Set field E15CUSOFC using a String value.
  */
  public void setE15CUSOFC(String newvalue)
  {
    fieldE15CUSOFC.setString(newvalue);
  }

  /**
  * Get value of field E15CUSOFC as a String.
  */
  public String getE15CUSOFC()
  {
    return fieldE15CUSOFC.getString();
  }

  /**
  * Set field E15CUSBUC using a String value.
  */
  public void setE15CUSBUC(String newvalue)
  {
    fieldE15CUSBUC.setString(newvalue);
  }

  /**
  * Get value of field E15CUSBUC as a String.
  */
  public String getE15CUSBUC()
  {
    return fieldE15CUSBUC.getString();
  }

  /**
  * Set field E15CUSINC using a String value.
  */
  public void setE15CUSINC(String newvalue)
  {
    fieldE15CUSINC.setString(newvalue);
  }

  /**
  * Get value of field E15CUSINC as a String.
  */
  public String getE15CUSINC()
  {
    return fieldE15CUSINC.getString();
  }

  /**
  * Set field E15CUSHPN using a String value.
  */
  public void setE15CUSHPN(String newvalue)
  {
    fieldE15CUSHPN.setString(newvalue);
  }

  /**
  * Get value of field E15CUSHPN as a String.
  */
  public String getE15CUSHPN()
  {
    return fieldE15CUSHPN.getString();
  }

  /**
  * Set numeric field E15CUSHPN using a BigDecimal value.
  */
  public void setE15CUSHPN(BigDecimal newvalue)
  {
    fieldE15CUSHPN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15CUSHPN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15CUSHPN()
  {
    return fieldE15CUSHPN.getBigDecimal();
  }

  /**
  * Set field E15CUSPHN using a String value.
  */
  public void setE15CUSPHN(String newvalue)
  {
    fieldE15CUSPHN.setString(newvalue);
  }

  /**
  * Get value of field E15CUSPHN as a String.
  */
  public String getE15CUSPHN()
  {
    return fieldE15CUSPHN.getString();
  }

  /**
  * Set numeric field E15CUSPHN using a BigDecimal value.
  */
  public void setE15CUSPHN(BigDecimal newvalue)
  {
    fieldE15CUSPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15CUSPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15CUSPHN()
  {
    return fieldE15CUSPHN.getBigDecimal();
  }

  /**
  * Set field E15CUSPH1 using a String value.
  */
  public void setE15CUSPH1(String newvalue)
  {
    fieldE15CUSPH1.setString(newvalue);
  }

  /**
  * Get value of field E15CUSPH1 as a String.
  */
  public String getE15CUSPH1()
  {
    return fieldE15CUSPH1.getString();
  }

  /**
  * Set numeric field E15CUSPH1 using a BigDecimal value.
  */
  public void setE15CUSPH1(BigDecimal newvalue)
  {
    fieldE15CUSPH1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15CUSPH1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15CUSPH1()
  {
    return fieldE15CUSPH1.getBigDecimal();
  }

  /**
  * Set field E15OPNDT1 using a String value.
  */
  public void setE15OPNDT1(String newvalue)
  {
    fieldE15OPNDT1.setString(newvalue);
  }

  /**
  * Get value of field E15OPNDT1 as a String.
  */
  public String getE15OPNDT1()
  {
    return fieldE15OPNDT1.getString();
  }

  /**
  * Set numeric field E15OPNDT1 using a BigDecimal value.
  */
  public void setE15OPNDT1(BigDecimal newvalue)
  {
    fieldE15OPNDT1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15OPNDT1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15OPNDT1()
  {
    return fieldE15OPNDT1.getBigDecimal();
  }

  /**
  * Set field E15OPNDT2 using a String value.
  */
  public void setE15OPNDT2(String newvalue)
  {
    fieldE15OPNDT2.setString(newvalue);
  }

  /**
  * Get value of field E15OPNDT2 as a String.
  */
  public String getE15OPNDT2()
  {
    return fieldE15OPNDT2.getString();
  }

  /**
  * Set numeric field E15OPNDT2 using a BigDecimal value.
  */
  public void setE15OPNDT2(BigDecimal newvalue)
  {
    fieldE15OPNDT2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15OPNDT2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15OPNDT2()
  {
    return fieldE15OPNDT2.getBigDecimal();
  }

  /**
  * Set field E15OPNDT3 using a String value.
  */
  public void setE15OPNDT3(String newvalue)
  {
    fieldE15OPNDT3.setString(newvalue);
  }

  /**
  * Get value of field E15OPNDT3 as a String.
  */
  public String getE15OPNDT3()
  {
    return fieldE15OPNDT3.getString();
  }

  /**
  * Set numeric field E15OPNDT3 using a BigDecimal value.
  */
  public void setE15OPNDT3(BigDecimal newvalue)
  {
    fieldE15OPNDT3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15OPNDT3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15OPNDT3()
  {
    return fieldE15OPNDT3.getBigDecimal();
  }

  /**
  * Set field E15BRNNUM using a String value.
  */
  public void setE15BRNNUM(String newvalue)
  {
    fieldE15BRNNUM.setString(newvalue);
  }

  /**
  * Get value of field E15BRNNUM as a String.
  */
  public String getE15BRNNUM()
  {
    return fieldE15BRNNUM.getString();
  }

  /**
  * Set numeric field E15BRNNUM using a BigDecimal value.
  */
  public void setE15BRNNUM(BigDecimal newvalue)
  {
    fieldE15BRNNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15BRNNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15BRNNUM()
  {
    return fieldE15BRNNUM.getBigDecimal();
  }

  /**
  * Set field E15CCYCDE using a String value.
  */
  public void setE15CCYCDE(String newvalue)
  {
    fieldE15CCYCDE.setString(newvalue);
  }

  /**
  * Get value of field E15CCYCDE as a String.
  */
  public String getE15CCYCDE()
  {
    return fieldE15CCYCDE.getString();
  }

  /**
  * Set field E15PROCDE using a String value.
  */
  public void setE15PROCDE(String newvalue)
  {
    fieldE15PROCDE.setString(newvalue);
  }

  /**
  * Get value of field E15PROCDE as a String.
  */
  public String getE15PROCDE()
  {
    return fieldE15PROCDE.getString();
  }

  /**
  * Set field E15TYPCDE using a String value.
  */
  public void setE15TYPCDE(String newvalue)
  {
    fieldE15TYPCDE.setString(newvalue);
  }

  /**
  * Get value of field E15TYPCDE as a String.
  */
  public String getE15TYPCDE()
  {
    return fieldE15TYPCDE.getString();
  }

  /**
  * Set field E15OPNAMT using a String value.
  */
  public void setE15OPNAMT(String newvalue)
  {
    fieldE15OPNAMT.setString(newvalue);
  }

  /**
  * Get value of field E15OPNAMT as a String.
  */
  public String getE15OPNAMT()
  {
    return fieldE15OPNAMT.getString();
  }

  /**
  * Set numeric field E15OPNAMT using a BigDecimal value.
  */
  public void setE15OPNAMT(BigDecimal newvalue)
  {
    fieldE15OPNAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15OPNAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15OPNAMT()
  {
    return fieldE15OPNAMT.getBigDecimal();
  }

  /**
  * Set field E15LETOAM using a String value.
  */
  public void setE15LETOAM(String newvalue)
  {
    fieldE15LETOAM.setString(newvalue);
  }

  /**
  * Get value of field E15LETOAM as a String.
  */
  public String getE15LETOAM()
  {
    return fieldE15LETOAM.getString();
  }

  /**
  * Set field E15ATMCAR using a String value.
  */
  public void setE15ATMCAR(String newvalue)
  {
    fieldE15ATMCAR.setString(newvalue);
  }

  /**
  * Get value of field E15ATMCAR as a String.
  */
  public String getE15ATMCAR()
  {
    return fieldE15ATMCAR.getString();
  }

  /**
  * Set field E15STATUS using a String value.
  */
  public void setE15STATUS(String newvalue)
  {
    fieldE15STATUS.setString(newvalue);
  }

  /**
  * Get value of field E15STATUS as a String.
  */
  public String getE15STATUS()
  {
    return fieldE15STATUS.getString();
  }

  /**
  * Set field E15DSCOFC using a String value.
  */
  public void setE15DSCOFC(String newvalue)
  {
    fieldE15DSCOFC.setString(newvalue);
  }

  /**
  * Get value of field E15DSCOFC as a String.
  */
  public String getE15DSCOFC()
  {
    return fieldE15DSCOFC.getString();
  }

  /**
  * Set field E15DSCBUC using a String value.
  */
  public void setE15DSCBUC(String newvalue)
  {
    fieldE15DSCBUC.setString(newvalue);
  }

  /**
  * Get value of field E15DSCBUC as a String.
  */
  public String getE15DSCBUC()
  {
    return fieldE15DSCBUC.getString();
  }

  /**
  * Set field E15DSCINC using a String value.
  */
  public void setE15DSCINC(String newvalue)
  {
    fieldE15DSCINC.setString(newvalue);
  }

  /**
  * Get value of field E15DSCINC as a String.
  */
  public String getE15DSCINC()
  {
    return fieldE15DSCINC.getString();
  }

  /**
  * Set field E15BANKNM using a String value.
  */
  public void setE15BANKNM(String newvalue)
  {
    fieldE15BANKNM.setString(newvalue);
  }

  /**
  * Get value of field E15BANKNM as a String.
  */
  public String getE15BANKNM()
  {
    return fieldE15BANKNM.getString();
  }

  /**
  * Set field E15BRNNME using a String value.
  */
  public void setE15BRNNME(String newvalue)
  {
    fieldE15BRNNME.setString(newvalue);
  }

  /**
  * Get value of field E15BRNNME as a String.
  */
  public String getE15BRNNME()
  {
    return fieldE15BRNNME.getString();
  }

  /**
  * Set field E15BRNADR using a String value.
  */
  public void setE15BRNADR(String newvalue)
  {
    fieldE15BRNADR.setString(newvalue);
  }

  /**
  * Get value of field E15BRNADR as a String.
  */
  public String getE15BRNADR()
  {
    return fieldE15BRNADR.getString();
  }

  /**
  * Set field E15BRNCIT using a String value.
  */
  public void setE15BRNCIT(String newvalue)
  {
    fieldE15BRNCIT.setString(newvalue);
  }

  /**
  * Get value of field E15BRNCIT as a String.
  */
  public String getE15BRNCIT()
  {
    return fieldE15BRNCIT.getString();
  }

  /**
  * Set field E15BRNPHN using a String value.
  */
  public void setE15BRNPHN(String newvalue)
  {
    fieldE15BRNPHN.setString(newvalue);
  }

  /**
  * Get value of field E15BRNPHN as a String.
  */
  public String getE15BRNPHN()
  {
    return fieldE15BRNPHN.getString();
  }

  /**
  * Set numeric field E15BRNPHN using a BigDecimal value.
  */
  public void setE15BRNPHN(BigDecimal newvalue)
  {
    fieldE15BRNPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15BRNPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15BRNPHN()
  {
    return fieldE15BRNPHN.getBigDecimal();
  }

  /**
  * Set field E15CNTBID using a String value.
  */
  public void setE15CNTBID(String newvalue)
  {
    fieldE15CNTBID.setString(newvalue);
  }

  /**
  * Get value of field E15CNTBID as a String.
  */
  public String getE15CNTBID()
  {
    return fieldE15CNTBID.getString();
  }

  /**
  * Set field E15CNTRD1 using a String value.
  */
  public void setE15CNTRD1(String newvalue)
  {
    fieldE15CNTRD1.setString(newvalue);
  }

  /**
  * Get value of field E15CNTRD1 as a String.
  */
  public String getE15CNTRD1()
  {
    return fieldE15CNTRD1.getString();
  }

  /**
  * Set numeric field E15CNTRD1 using a BigDecimal value.
  */
  public void setE15CNTRD1(BigDecimal newvalue)
  {
    fieldE15CNTRD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15CNTRD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15CNTRD1()
  {
    return fieldE15CNTRD1.getBigDecimal();
  }

  /**
  * Set field E15CNTRD2 using a String value.
  */
  public void setE15CNTRD2(String newvalue)
  {
    fieldE15CNTRD2.setString(newvalue);
  }

  /**
  * Get value of field E15CNTRD2 as a String.
  */
  public String getE15CNTRD2()
  {
    return fieldE15CNTRD2.getString();
  }

  /**
  * Set numeric field E15CNTRD2 using a BigDecimal value.
  */
  public void setE15CNTRD2(BigDecimal newvalue)
  {
    fieldE15CNTRD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15CNTRD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15CNTRD2()
  {
    return fieldE15CNTRD2.getBigDecimal();
  }

  /**
  * Set field E15CNTRD3 using a String value.
  */
  public void setE15CNTRD3(String newvalue)
  {
    fieldE15CNTRD3.setString(newvalue);
  }

  /**
  * Get value of field E15CNTRD3 as a String.
  */
  public String getE15CNTRD3()
  {
    return fieldE15CNTRD3.getString();
  }

  /**
  * Set numeric field E15CNTRD3 using a BigDecimal value.
  */
  public void setE15CNTRD3(BigDecimal newvalue)
  {
    fieldE15CNTRD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15CNTRD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15CNTRD3()
  {
    return fieldE15CNTRD3.getBigDecimal();
  }

  /**
  * Set field E15DSCPRO using a String value.
  */
  public void setE15DSCPRO(String newvalue)
  {
    fieldE15DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E15DSCPRO as a String.
  */
  public String getE15DSCPRO()
  {
    return fieldE15DSCPRO.getString();
  }

  /**
  * Set field E15DSCTYP using a String value.
  */
  public void setE15DSCTYP(String newvalue)
  {
    fieldE15DSCTYP.setString(newvalue);
  }

  /**
  * Get value of field E15DSCTYP as a String.
  */
  public String getE15DSCTYP()
  {
    return fieldE15DSCTYP.getString();
  }

  /**
  * Set field E15DSCCCY using a String value.
  */
  public void setE15DSCCCY(String newvalue)
  {
    fieldE15DSCCCY.setString(newvalue);
  }

  /**
  * Get value of field E15DSCCCY as a String.
  */
  public String getE15DSCCCY()
  {
    return fieldE15DSCCCY.getString();
  }

}