package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECSM00207 physical file definition.
* 
* File level identifier is 1180621235218.
* Record format level identifier is 40EB91E2B0D1D.
*/

public class ECSM00207Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H07USERID",
                                     "H07PROGRM",
                                     "H07TIMSYS",
                                     "H07SCRCOD",
                                     "H07OPECOD",
                                     "H07FLGMAS",
                                     "H07FLGWK1",
                                     "H07FLGWK2",
                                     "H07FLGWK3",
                                     "E07BENBNK",
                                     "E07BENNUM",
                                     "E07BENTIP",
                                     "D07BENTIP",
                                     "E07BENCOM",
                                     "D07BENCOM",
                                     "E07BENRAC",
                                     "E07BENTIC",
                                     "E07BENLGT",
                                     "E07BENTID",
                                     "E07BENIDN",
                                     "E07BENNA1",
                                     "E07BENNA2",
                                     "E07BENNA3",
                                     "E07BENNA4",
                                     "E07BENNAM",
                                     "E07BENSOL",
                                     "E07BENSTS",
                                     "E07BENCYY",
                                     "E07BENCMM",
                                     "E07BENCDD",
                                     "E07BENCTT",
                                     "E07BENCMU",
                                     "E07BENLYY",
                                     "E07BENLMM",
                                     "E07BENLDD",
                                     "E07BENLTT",
                                     "E07BENLMU",
                                     "E07NUMREC",
                                     "E07INDOPE"
                                   };
  final static String tnames[] = {
                                   "H07USERID",
                                   "H07PROGRM",
                                   "H07TIMSYS",
                                   "H07SCRCOD",
                                   "H07OPECOD",
                                   "H07FLGMAS",
                                   "H07FLGWK1",
                                   "H07FLGWK2",
                                   "H07FLGWK3",
                                   "E07BENBNK",
                                   "E07BENNUM",
                                   "E07BENTIP",
                                   "D07BENTIP",
                                   "E07BENCOM",
                                   "D07BENCOM",
                                   "E07BENRAC",
                                   "E07BENTIC",
                                   "E07BENLGT",
                                   "E07BENTID",
                                   "E07BENIDN",
                                   "E07BENNA1",
                                   "E07BENNA2",
                                   "E07BENNA3",
                                   "E07BENNA4",
                                   "E07BENNAM",
                                   "E07BENSOL",
                                   "E07BENSTS",
                                   "E07BENCYY",
                                   "E07BENCMM",
                                   "E07BENCDD",
                                   "E07BENCTT",
                                   "E07BENCMU",
                                   "E07BENLYY",
                                   "E07BENLMM",
                                   "E07BENLDD",
                                   "E07BENLTT",
                                   "E07BENLMU",
                                   "E07NUMREC",
                                   "E07INDOPE"
                                 };
  final static String fid = "1180621235218";
  final static String rid = "40EB91E2B0D1D";
  final static String fmtname = "ECSM00207";
  final int FIELDCOUNT = 39;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH07USERID = null;
  private CharacterField fieldH07PROGRM = null;
  private CharacterField fieldH07TIMSYS = null;
  private CharacterField fieldH07SCRCOD = null;
  private CharacterField fieldH07OPECOD = null;
  private CharacterField fieldH07FLGMAS = null;
  private CharacterField fieldH07FLGWK1 = null;
  private CharacterField fieldH07FLGWK2 = null;
  private CharacterField fieldH07FLGWK3 = null;
  private CharacterField fieldE07BENBNK = null;
  private DecimalField fieldE07BENNUM = null;
  private CharacterField fieldE07BENTIP = null;
  private CharacterField fieldD07BENTIP = null;
  private CharacterField fieldE07BENCOM = null;
  private CharacterField fieldD07BENCOM = null;
  private CharacterField fieldE07BENRAC = null;
  private CharacterField fieldE07BENTIC = null;
  private CharacterField fieldE07BENLGT = null;
  private CharacterField fieldE07BENTID = null;
  private CharacterField fieldE07BENIDN = null;
  private CharacterField fieldE07BENNA1 = null;
  private CharacterField fieldE07BENNA2 = null;
  private CharacterField fieldE07BENNA3 = null;
  private CharacterField fieldE07BENNA4 = null;
  private CharacterField fieldE07BENNAM = null;
  private CharacterField fieldE07BENSOL = null;
  private CharacterField fieldE07BENSTS = null;
  private DecimalField fieldE07BENCYY = null;
  private DecimalField fieldE07BENCMM = null;
  private DecimalField fieldE07BENCDD = null;
  private CharacterField fieldE07BENCTT = null;
  private CharacterField fieldE07BENCMU = null;
  private DecimalField fieldE07BENLYY = null;
  private DecimalField fieldE07BENLMM = null;
  private DecimalField fieldE07BENLDD = null;
  private CharacterField fieldE07BENLTT = null;
  private CharacterField fieldE07BENLMU = null;
  private DecimalField fieldE07NUMREC = null;
  private CharacterField fieldE07INDOPE = null;

  /**
  * Constructor for ECSM00207Message.
  */
  public ECSM00207Message()
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
    recordsize = 560;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH07USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H07USERID");
    fields[1] = fieldH07PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H07PROGRM");
    fields[2] = fieldH07TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H07TIMSYS");
    fields[3] = fieldH07SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H07SCRCOD");
    fields[4] = fieldH07OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H07OPECOD");
    fields[5] = fieldH07FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H07FLGMAS");
    fields[6] = fieldH07FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H07FLGWK1");
    fields[7] = fieldH07FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H07FLGWK2");
    fields[8] = fieldH07FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H07FLGWK3");
    fields[9] = fieldE07BENBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E07BENBNK");
    fields[10] = fieldE07BENNUM =
    new DecimalField(message, HEADERSIZE + 44, 13, 0, "E07BENNUM");
    fields[11] = fieldE07BENTIP =
    new CharacterField(message, HEADERSIZE + 57, 1, "E07BENTIP");
    fields[12] = fieldD07BENTIP =
    new CharacterField(message, HEADERSIZE + 58, 60, "D07BENTIP");
    fields[13] = fieldE07BENCOM =
    new CharacterField(message, HEADERSIZE + 118, 4, "E07BENCOM");
    fields[14] = fieldD07BENCOM =
    new CharacterField(message, HEADERSIZE + 122, 45, "D07BENCOM");
    fields[15] = fieldE07BENRAC =
    new CharacterField(message, HEADERSIZE + 167, 17, "E07BENRAC");
    fields[16] = fieldE07BENTIC =
    new CharacterField(message, HEADERSIZE + 184, 1, "E07BENTIC");
    fields[17] = fieldE07BENLGT =
    new CharacterField(message, HEADERSIZE + 185, 1, "E07BENLGT");
    fields[18] = fieldE07BENTID =
    new CharacterField(message, HEADERSIZE + 186, 4, "E07BENTID");
    fields[19] = fieldE07BENIDN =
    new CharacterField(message, HEADERSIZE + 190, 25, "E07BENIDN");
    fields[20] = fieldE07BENNA1 =
    new CharacterField(message, HEADERSIZE + 215, 45, "E07BENNA1");
    fields[21] = fieldE07BENNA2 =
    new CharacterField(message, HEADERSIZE + 260, 45, "E07BENNA2");
    fields[22] = fieldE07BENNA3 =
    new CharacterField(message, HEADERSIZE + 305, 45, "E07BENNA3");
    fields[23] = fieldE07BENNA4 =
    new CharacterField(message, HEADERSIZE + 350, 45, "E07BENNA4");
    fields[24] = fieldE07BENNAM =
    new CharacterField(message, HEADERSIZE + 395, 60, "E07BENNAM");
    fields[25] = fieldE07BENSOL =
    new CharacterField(message, HEADERSIZE + 455, 1, "E07BENSOL");
    fields[26] = fieldE07BENSTS =
    new CharacterField(message, HEADERSIZE + 456, 1, "E07BENSTS");
    fields[27] = fieldE07BENCYY =
    new DecimalField(message, HEADERSIZE + 457, 5, 0, "E07BENCYY");
    fields[28] = fieldE07BENCMM =
    new DecimalField(message, HEADERSIZE + 462, 3, 0, "E07BENCMM");
    fields[29] = fieldE07BENCDD =
    new DecimalField(message, HEADERSIZE + 465, 3, 0, "E07BENCDD");
    fields[30] = fieldE07BENCTT =
    new CharacterField(message, HEADERSIZE + 468, 26, "E07BENCTT");
    fields[31] = fieldE07BENCMU =
    new CharacterField(message, HEADERSIZE + 494, 10, "E07BENCMU");
    fields[32] = fieldE07BENLYY =
    new DecimalField(message, HEADERSIZE + 504, 5, 0, "E07BENLYY");
    fields[33] = fieldE07BENLMM =
    new DecimalField(message, HEADERSIZE + 509, 3, 0, "E07BENLMM");
    fields[34] = fieldE07BENLDD =
    new DecimalField(message, HEADERSIZE + 512, 3, 0, "E07BENLDD");
    fields[35] = fieldE07BENLTT =
    new CharacterField(message, HEADERSIZE + 515, 26, "E07BENLTT");
    fields[36] = fieldE07BENLMU =
    new CharacterField(message, HEADERSIZE + 541, 10, "E07BENLMU");
    fields[37] = fieldE07NUMREC =
    new DecimalField(message, HEADERSIZE + 551, 8, 0, "E07NUMREC");
    fields[38] = fieldE07INDOPE =
    new CharacterField(message, HEADERSIZE + 559, 1, "E07INDOPE");

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
  * Set field H07USERID using a String value.
  */
  public void setH07USERID(String newvalue)
  {
    fieldH07USERID.setString(newvalue);
  }

  /**
  * Get value of field H07USERID as a String.
  */
  public String getH07USERID()
  {
    return fieldH07USERID.getString();
  }

  /**
  * Set field H07PROGRM using a String value.
  */
  public void setH07PROGRM(String newvalue)
  {
    fieldH07PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H07PROGRM as a String.
  */
  public String getH07PROGRM()
  {
    return fieldH07PROGRM.getString();
  }

  /**
  * Set field H07TIMSYS using a String value.
  */
  public void setH07TIMSYS(String newvalue)
  {
    fieldH07TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H07TIMSYS as a String.
  */
  public String getH07TIMSYS()
  {
    return fieldH07TIMSYS.getString();
  }

  /**
  * Set field H07SCRCOD using a String value.
  */
  public void setH07SCRCOD(String newvalue)
  {
    fieldH07SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H07SCRCOD as a String.
  */
  public String getH07SCRCOD()
  {
    return fieldH07SCRCOD.getString();
  }

  /**
  * Set field H07OPECOD using a String value.
  */
  public void setH07OPECOD(String newvalue)
  {
    fieldH07OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H07OPECOD as a String.
  */
  public String getH07OPECOD()
  {
    return fieldH07OPECOD.getString();
  }

  /**
  * Set field H07FLGMAS using a String value.
  */
  public void setH07FLGMAS(String newvalue)
  {
    fieldH07FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H07FLGMAS as a String.
  */
  public String getH07FLGMAS()
  {
    return fieldH07FLGMAS.getString();
  }

  /**
  * Set field H07FLGWK1 using a String value.
  */
  public void setH07FLGWK1(String newvalue)
  {
    fieldH07FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H07FLGWK1 as a String.
  */
  public String getH07FLGWK1()
  {
    return fieldH07FLGWK1.getString();
  }

  /**
  * Set field H07FLGWK2 using a String value.
  */
  public void setH07FLGWK2(String newvalue)
  {
    fieldH07FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H07FLGWK2 as a String.
  */
  public String getH07FLGWK2()
  {
    return fieldH07FLGWK2.getString();
  }

  /**
  * Set field H07FLGWK3 using a String value.
  */
  public void setH07FLGWK3(String newvalue)
  {
    fieldH07FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H07FLGWK3 as a String.
  */
  public String getH07FLGWK3()
  {
    return fieldH07FLGWK3.getString();
  }

  /**
  * Set field E07BENBNK using a String value.
  */
  public void setE07BENBNK(String newvalue)
  {
    fieldE07BENBNK.setString(newvalue);
  }

  /**
  * Get value of field E07BENBNK as a String.
  */
  public String getE07BENBNK()
  {
    return fieldE07BENBNK.getString();
  }

  /**
  * Set field E07BENNUM using a String value.
  */
  public void setE07BENNUM(String newvalue)
  {
    fieldE07BENNUM.setString(newvalue);
  }

  /**
  * Get value of field E07BENNUM as a String.
  */
  public String getE07BENNUM()
  {
    return fieldE07BENNUM.getString();
  }

  /**
  * Set numeric field E07BENNUM using a BigDecimal value.
  */
  public void setE07BENNUM(BigDecimal newvalue)
  {
    fieldE07BENNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07BENNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07BENNUM()
  {
    return fieldE07BENNUM.getBigDecimal();
  }

  /**
  * Set field E07BENTIP using a String value.
  */
  public void setE07BENTIP(String newvalue)
  {
    fieldE07BENTIP.setString(newvalue);
  }

  /**
  * Get value of field E07BENTIP as a String.
  */
  public String getE07BENTIP()
  {
    return fieldE07BENTIP.getString();
  }

  /**
  * Set field D07BENTIP using a String value.
  */
  public void setD07BENTIP(String newvalue)
  {
    fieldD07BENTIP.setString(newvalue);
  }

  /**
  * Get value of field D07BENTIP as a String.
  */
  public String getD07BENTIP()
  {
    return fieldD07BENTIP.getString();
  }

  /**
  * Set field E07BENCOM using a String value.
  */
  public void setE07BENCOM(String newvalue)
  {
    fieldE07BENCOM.setString(newvalue);
  }

  /**
  * Get value of field E07BENCOM as a String.
  */
  public String getE07BENCOM()
  {
    return fieldE07BENCOM.getString();
  }

  /**
  * Set field D07BENCOM using a String value.
  */
  public void setD07BENCOM(String newvalue)
  {
    fieldD07BENCOM.setString(newvalue);
  }

  /**
  * Get value of field D07BENCOM as a String.
  */
  public String getD07BENCOM()
  {
    return fieldD07BENCOM.getString();
  }

  /**
  * Set field E07BENRAC using a String value.
  */
  public void setE07BENRAC(String newvalue)
  {
    fieldE07BENRAC.setString(newvalue);
  }

  /**
  * Get value of field E07BENRAC as a String.
  */
  public String getE07BENRAC()
  {
    return fieldE07BENRAC.getString();
  }

  /**
  * Set field E07BENTIC using a String value.
  */
  public void setE07BENTIC(String newvalue)
  {
    fieldE07BENTIC.setString(newvalue);
  }

  /**
  * Get value of field E07BENTIC as a String.
  */
  public String getE07BENTIC()
  {
    return fieldE07BENTIC.getString();
  }

  /**
  * Set field E07BENLGT using a String value.
  */
  public void setE07BENLGT(String newvalue)
  {
    fieldE07BENLGT.setString(newvalue);
  }

  /**
  * Get value of field E07BENLGT as a String.
  */
  public String getE07BENLGT()
  {
    return fieldE07BENLGT.getString();
  }

  /**
  * Set field E07BENTID using a String value.
  */
  public void setE07BENTID(String newvalue)
  {
    fieldE07BENTID.setString(newvalue);
  }

  /**
  * Get value of field E07BENTID as a String.
  */
  public String getE07BENTID()
  {
    return fieldE07BENTID.getString();
  }

  /**
  * Set field E07BENIDN using a String value.
  */
  public void setE07BENIDN(String newvalue)
  {
    fieldE07BENIDN.setString(newvalue);
  }

  /**
  * Get value of field E07BENIDN as a String.
  */
  public String getE07BENIDN()
  {
    return fieldE07BENIDN.getString();
  }

  /**
  * Set field E07BENNA1 using a String value.
  */
  public void setE07BENNA1(String newvalue)
  {
    fieldE07BENNA1.setString(newvalue);
  }

  /**
  * Get value of field E07BENNA1 as a String.
  */
  public String getE07BENNA1()
  {
    return fieldE07BENNA1.getString();
  }

  /**
  * Set field E07BENNA2 using a String value.
  */
  public void setE07BENNA2(String newvalue)
  {
    fieldE07BENNA2.setString(newvalue);
  }

  /**
  * Get value of field E07BENNA2 as a String.
  */
  public String getE07BENNA2()
  {
    return fieldE07BENNA2.getString();
  }

  /**
  * Set field E07BENNA3 using a String value.
  */
  public void setE07BENNA3(String newvalue)
  {
    fieldE07BENNA3.setString(newvalue);
  }

  /**
  * Get value of field E07BENNA3 as a String.
  */
  public String getE07BENNA3()
  {
    return fieldE07BENNA3.getString();
  }

  /**
  * Set field E07BENNA4 using a String value.
  */
  public void setE07BENNA4(String newvalue)
  {
    fieldE07BENNA4.setString(newvalue);
  }

  /**
  * Get value of field E07BENNA4 as a String.
  */
  public String getE07BENNA4()
  {
    return fieldE07BENNA4.getString();
  }

  /**
  * Set field E07BENNAM using a String value.
  */
  public void setE07BENNAM(String newvalue)
  {
    fieldE07BENNAM.setString(newvalue);
  }

  /**
  * Get value of field E07BENNAM as a String.
  */
  public String getE07BENNAM()
  {
    return fieldE07BENNAM.getString();
  }

  /**
  * Set field E07BENSOL using a String value.
  */
  public void setE07BENSOL(String newvalue)
  {
    fieldE07BENSOL.setString(newvalue);
  }

  /**
  * Get value of field E07BENSOL as a String.
  */
  public String getE07BENSOL()
  {
    return fieldE07BENSOL.getString();
  }

  /**
  * Set field E07BENSTS using a String value.
  */
  public void setE07BENSTS(String newvalue)
  {
    fieldE07BENSTS.setString(newvalue);
  }

  /**
  * Get value of field E07BENSTS as a String.
  */
  public String getE07BENSTS()
  {
    return fieldE07BENSTS.getString();
  }

  /**
  * Set field E07BENCYY using a String value.
  */
  public void setE07BENCYY(String newvalue)
  {
    fieldE07BENCYY.setString(newvalue);
  }

  /**
  * Get value of field E07BENCYY as a String.
  */
  public String getE07BENCYY()
  {
    return fieldE07BENCYY.getString();
  }

  /**
  * Set numeric field E07BENCYY using a BigDecimal value.
  */
  public void setE07BENCYY(BigDecimal newvalue)
  {
    fieldE07BENCYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07BENCYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07BENCYY()
  {
    return fieldE07BENCYY.getBigDecimal();
  }

  /**
  * Set field E07BENCMM using a String value.
  */
  public void setE07BENCMM(String newvalue)
  {
    fieldE07BENCMM.setString(newvalue);
  }

  /**
  * Get value of field E07BENCMM as a String.
  */
  public String getE07BENCMM()
  {
    return fieldE07BENCMM.getString();
  }

  /**
  * Set numeric field E07BENCMM using a BigDecimal value.
  */
  public void setE07BENCMM(BigDecimal newvalue)
  {
    fieldE07BENCMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07BENCMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07BENCMM()
  {
    return fieldE07BENCMM.getBigDecimal();
  }

  /**
  * Set field E07BENCDD using a String value.
  */
  public void setE07BENCDD(String newvalue)
  {
    fieldE07BENCDD.setString(newvalue);
  }

  /**
  * Get value of field E07BENCDD as a String.
  */
  public String getE07BENCDD()
  {
    return fieldE07BENCDD.getString();
  }

  /**
  * Set numeric field E07BENCDD using a BigDecimal value.
  */
  public void setE07BENCDD(BigDecimal newvalue)
  {
    fieldE07BENCDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07BENCDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07BENCDD()
  {
    return fieldE07BENCDD.getBigDecimal();
  }

  /**
  * Set field E07BENCTT using a String value.
  */
  public void setE07BENCTT(String newvalue)
  {
    fieldE07BENCTT.setString(newvalue);
  }

  /**
  * Get value of field E07BENCTT as a String.
  */
  public String getE07BENCTT()
  {
    return fieldE07BENCTT.getString();
  }

  /**
  * Set field E07BENCMU using a String value.
  */
  public void setE07BENCMU(String newvalue)
  {
    fieldE07BENCMU.setString(newvalue);
  }

  /**
  * Get value of field E07BENCMU as a String.
  */
  public String getE07BENCMU()
  {
    return fieldE07BENCMU.getString();
  }

  /**
  * Set field E07BENLYY using a String value.
  */
  public void setE07BENLYY(String newvalue)
  {
    fieldE07BENLYY.setString(newvalue);
  }

  /**
  * Get value of field E07BENLYY as a String.
  */
  public String getE07BENLYY()
  {
    return fieldE07BENLYY.getString();
  }

  /**
  * Set numeric field E07BENLYY using a BigDecimal value.
  */
  public void setE07BENLYY(BigDecimal newvalue)
  {
    fieldE07BENLYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07BENLYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07BENLYY()
  {
    return fieldE07BENLYY.getBigDecimal();
  }

  /**
  * Set field E07BENLMM using a String value.
  */
  public void setE07BENLMM(String newvalue)
  {
    fieldE07BENLMM.setString(newvalue);
  }

  /**
  * Get value of field E07BENLMM as a String.
  */
  public String getE07BENLMM()
  {
    return fieldE07BENLMM.getString();
  }

  /**
  * Set numeric field E07BENLMM using a BigDecimal value.
  */
  public void setE07BENLMM(BigDecimal newvalue)
  {
    fieldE07BENLMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07BENLMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07BENLMM()
  {
    return fieldE07BENLMM.getBigDecimal();
  }

  /**
  * Set field E07BENLDD using a String value.
  */
  public void setE07BENLDD(String newvalue)
  {
    fieldE07BENLDD.setString(newvalue);
  }

  /**
  * Get value of field E07BENLDD as a String.
  */
  public String getE07BENLDD()
  {
    return fieldE07BENLDD.getString();
  }

  /**
  * Set numeric field E07BENLDD using a BigDecimal value.
  */
  public void setE07BENLDD(BigDecimal newvalue)
  {
    fieldE07BENLDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07BENLDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07BENLDD()
  {
    return fieldE07BENLDD.getBigDecimal();
  }

  /**
  * Set field E07BENLTT using a String value.
  */
  public void setE07BENLTT(String newvalue)
  {
    fieldE07BENLTT.setString(newvalue);
  }

  /**
  * Get value of field E07BENLTT as a String.
  */
  public String getE07BENLTT()
  {
    return fieldE07BENLTT.getString();
  }

  /**
  * Set field E07BENLMU using a String value.
  */
  public void setE07BENLMU(String newvalue)
  {
    fieldE07BENLMU.setString(newvalue);
  }

  /**
  * Get value of field E07BENLMU as a String.
  */
  public String getE07BENLMU()
  {
    return fieldE07BENLMU.getString();
  }

  /**
  * Set field E07NUMREC using a String value.
  */
  public void setE07NUMREC(String newvalue)
  {
    fieldE07NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E07NUMREC as a String.
  */
  public String getE07NUMREC()
  {
    return fieldE07NUMREC.getString();
  }

  /**
  * Set numeric field E07NUMREC using a BigDecimal value.
  */
  public void setE07NUMREC(BigDecimal newvalue)
  {
    fieldE07NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07NUMREC()
  {
    return fieldE07NUMREC.getBigDecimal();
  }

  /**
  * Set field E07INDOPE using a String value.
  */
  public void setE07INDOPE(String newvalue)
  {
    fieldE07INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E07INDOPE as a String.
  */
  public String getE07INDOPE()
  {
    return fieldE07INDOPE.getString();
  }

}
