package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDP075301 physical file definition.
* 
* File level identifier is 1130611113115.
* Record format level identifier is 31C0438CEAE4C.
*/

public class EDP075301Message extends MessageRecord
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
                                     "E01DPURUT",
                                     "E01DPUDRU",
                                     "E01DPUGRG",
                                     "E01DPUDGR",
                                     "E01DPUUSL",
                                     "E01DPUNUS",
                                     "E01DPUFG1",
                                     "E01DPUFG2",
                                     "E01DPUFG3",
                                     "E01DPUFG4",
                                     "E01DPUCN1",
                                     "E01DPUDN1",
                                     "E01DPUCN2",
                                     "E01DPUDN2",
                                     "E01DPUCN3",
                                     "E01DPUDN3",
                                     "E01DPUCN4",
                                     "E01DPUDN4",
                                     "E01RECPOS",
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
                                   "E01DPURUT",
                                   "E01DPUDRU",
                                   "E01DPUGRG",
                                   "E01DPUDGR",
                                   "E01DPUUSL",
                                   "E01DPUNUS",
                                   "E01DPUFG1",
                                   "E01DPUFG2",
                                   "E01DPUFG3",
                                   "E01DPUFG4",
                                   "E01DPUCN1",
                                   "E01DPUDN1",
                                   "E01DPUCN2",
                                   "E01DPUDN2",
                                   "E01DPUCN3",
                                   "E01DPUDN3",
                                   "E01DPUCN4",
                                   "E01DPUDN4",
                                   "E01RECPOS",
                                   "E01OPECDE"
                                 };
  final static String fid = "1130611113115";
  final static String rid = "31C0438CEAE4C";
  final static String fmtname = "EDP075301";
  final int FIELDCOUNT = 30;
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
  private CharacterField fieldE01DPURUT = null;
  private CharacterField fieldE01DPUDRU = null;
  private CharacterField fieldE01DPUGRG = null;
  private CharacterField fieldE01DPUDGR = null;
  private CharacterField fieldE01DPUUSL = null;
  private CharacterField fieldE01DPUNUS = null;
  private CharacterField fieldE01DPUFG1 = null;
  private CharacterField fieldE01DPUFG2 = null;
  private CharacterField fieldE01DPUFG3 = null;
  private CharacterField fieldE01DPUFG4 = null;
  private CharacterField fieldE01DPUCN1 = null;
  private CharacterField fieldE01DPUDN1 = null;
  private CharacterField fieldE01DPUCN2 = null;
  private CharacterField fieldE01DPUDN2 = null;
  private CharacterField fieldE01DPUCN3 = null;
  private CharacterField fieldE01DPUDN3 = null;
  private CharacterField fieldE01DPUCN4 = null;
  private CharacterField fieldE01DPUDN4 = null;
  private DecimalField fieldE01RECPOS = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for EDP075301Message.
  */
  public EDP075301Message()
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
    recordsize = 405;
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
    fields[10] = fieldE01DPURUT =
    new CharacterField(message, HEADERSIZE + 43, 4, "E01DPURUT");
    fields[11] = fieldE01DPUDRU =
    new CharacterField(message, HEADERSIZE + 47, 45, "E01DPUDRU");
    fields[12] = fieldE01DPUGRG =
    new CharacterField(message, HEADERSIZE + 92, 4, "E01DPUGRG");
    fields[13] = fieldE01DPUDGR =
    new CharacterField(message, HEADERSIZE + 96, 45, "E01DPUDGR");
    fields[14] = fieldE01DPUUSL =
    new CharacterField(message, HEADERSIZE + 141, 10, "E01DPUUSL");
    fields[15] = fieldE01DPUNUS =
    new CharacterField(message, HEADERSIZE + 151, 45, "E01DPUNUS");
    fields[16] = fieldE01DPUFG1 =
    new CharacterField(message, HEADERSIZE + 196, 1, "E01DPUFG1");
    fields[17] = fieldE01DPUFG2 =
    new CharacterField(message, HEADERSIZE + 197, 1, "E01DPUFG2");
    fields[18] = fieldE01DPUFG3 =
    new CharacterField(message, HEADERSIZE + 198, 1, "E01DPUFG3");
    fields[19] = fieldE01DPUFG4 =
    new CharacterField(message, HEADERSIZE + 199, 1, "E01DPUFG4");
    fields[20] = fieldE01DPUCN1 =
    new CharacterField(message, HEADERSIZE + 200, 4, "E01DPUCN1");
    fields[21] = fieldE01DPUDN1 =
    new CharacterField(message, HEADERSIZE + 204, 45, "E01DPUDN1");
    fields[22] = fieldE01DPUCN2 =
    new CharacterField(message, HEADERSIZE + 249, 4, "E01DPUCN2");
    fields[23] = fieldE01DPUDN2 =
    new CharacterField(message, HEADERSIZE + 253, 45, "E01DPUDN2");
    fields[24] = fieldE01DPUCN3 =
    new CharacterField(message, HEADERSIZE + 298, 4, "E01DPUCN3");
    fields[25] = fieldE01DPUDN3 =
    new CharacterField(message, HEADERSIZE + 302, 45, "E01DPUDN3");
    fields[26] = fieldE01DPUCN4 =
    new CharacterField(message, HEADERSIZE + 347, 4, "E01DPUCN4");
    fields[27] = fieldE01DPUDN4 =
    new CharacterField(message, HEADERSIZE + 351, 45, "E01DPUDN4");
    fields[28] = fieldE01RECPOS =
    new DecimalField(message, HEADERSIZE + 396, 8, 0, "E01RECPOS");
    fields[29] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 404, 1, "E01OPECDE");

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
  * Set field E01DPURUT using a String value.
  */
  public void setE01DPURUT(String newvalue)
  {
    fieldE01DPURUT.setString(newvalue);
  }

  /**
  * Get value of field E01DPURUT as a String.
  */
  public String getE01DPURUT()
  {
    return fieldE01DPURUT.getString();
  }

  /**
  * Set field E01DPUDRU using a String value.
  */
  public void setE01DPUDRU(String newvalue)
  {
    fieldE01DPUDRU.setString(newvalue);
  }

  /**
  * Get value of field E01DPUDRU as a String.
  */
  public String getE01DPUDRU()
  {
    return fieldE01DPUDRU.getString();
  }

  /**
  * Set field E01DPUGRG using a String value.
  */
  public void setE01DPUGRG(String newvalue)
  {
    fieldE01DPUGRG.setString(newvalue);
  }

  /**
  * Get value of field E01DPUGRG as a String.
  */
  public String getE01DPUGRG()
  {
    return fieldE01DPUGRG.getString();
  }

  /**
  * Set field E01DPUDGR using a String value.
  */
  public void setE01DPUDGR(String newvalue)
  {
    fieldE01DPUDGR.setString(newvalue);
  }

  /**
  * Get value of field E01DPUDGR as a String.
  */
  public String getE01DPUDGR()
  {
    return fieldE01DPUDGR.getString();
  }

  /**
  * Set field E01DPUUSL using a String value.
  */
  public void setE01DPUUSL(String newvalue)
  {
    fieldE01DPUUSL.setString(newvalue);
  }

  /**
  * Get value of field E01DPUUSL as a String.
  */
  public String getE01DPUUSL()
  {
    return fieldE01DPUUSL.getString();
  }

  /**
  * Set field E01DPUNUS using a String value.
  */
  public void setE01DPUNUS(String newvalue)
  {
    fieldE01DPUNUS.setString(newvalue);
  }

  /**
  * Get value of field E01DPUNUS as a String.
  */
  public String getE01DPUNUS()
  {
    return fieldE01DPUNUS.getString();
  }

  /**
  * Set field E01DPUFG1 using a String value.
  */
  public void setE01DPUFG1(String newvalue)
  {
    fieldE01DPUFG1.setString(newvalue);
  }

  /**
  * Get value of field E01DPUFG1 as a String.
  */
  public String getE01DPUFG1()
  {
    return fieldE01DPUFG1.getString();
  }

  /**
  * Set field E01DPUFG2 using a String value.
  */
  public void setE01DPUFG2(String newvalue)
  {
    fieldE01DPUFG2.setString(newvalue);
  }

  /**
  * Get value of field E01DPUFG2 as a String.
  */
  public String getE01DPUFG2()
  {
    return fieldE01DPUFG2.getString();
  }

  /**
  * Set field E01DPUFG3 using a String value.
  */
  public void setE01DPUFG3(String newvalue)
  {
    fieldE01DPUFG3.setString(newvalue);
  }

  /**
  * Get value of field E01DPUFG3 as a String.
  */
  public String getE01DPUFG3()
  {
    return fieldE01DPUFG3.getString();
  }

  /**
  * Set field E01DPUFG4 using a String value.
  */
  public void setE01DPUFG4(String newvalue)
  {
    fieldE01DPUFG4.setString(newvalue);
  }

  /**
  * Get value of field E01DPUFG4 as a String.
  */
  public String getE01DPUFG4()
  {
    return fieldE01DPUFG4.getString();
  }

  /**
  * Set field E01DPUCN1 using a String value.
  */
  public void setE01DPUCN1(String newvalue)
  {
    fieldE01DPUCN1.setString(newvalue);
  }

  /**
  * Get value of field E01DPUCN1 as a String.
  */
  public String getE01DPUCN1()
  {
    return fieldE01DPUCN1.getString();
  }

  /**
  * Set field E01DPUDN1 using a String value.
  */
  public void setE01DPUDN1(String newvalue)
  {
    fieldE01DPUDN1.setString(newvalue);
  }

  /**
  * Get value of field E01DPUDN1 as a String.
  */
  public String getE01DPUDN1()
  {
    return fieldE01DPUDN1.getString();
  }

  /**
  * Set field E01DPUCN2 using a String value.
  */
  public void setE01DPUCN2(String newvalue)
  {
    fieldE01DPUCN2.setString(newvalue);
  }

  /**
  * Get value of field E01DPUCN2 as a String.
  */
  public String getE01DPUCN2()
  {
    return fieldE01DPUCN2.getString();
  }

  /**
  * Set field E01DPUDN2 using a String value.
  */
  public void setE01DPUDN2(String newvalue)
  {
    fieldE01DPUDN2.setString(newvalue);
  }

  /**
  * Get value of field E01DPUDN2 as a String.
  */
  public String getE01DPUDN2()
  {
    return fieldE01DPUDN2.getString();
  }

  /**
  * Set field E01DPUCN3 using a String value.
  */
  public void setE01DPUCN3(String newvalue)
  {
    fieldE01DPUCN3.setString(newvalue);
  }

  /**
  * Get value of field E01DPUCN3 as a String.
  */
  public String getE01DPUCN3()
  {
    return fieldE01DPUCN3.getString();
  }

  /**
  * Set field E01DPUDN3 using a String value.
  */
  public void setE01DPUDN3(String newvalue)
  {
    fieldE01DPUDN3.setString(newvalue);
  }

  /**
  * Get value of field E01DPUDN3 as a String.
  */
  public String getE01DPUDN3()
  {
    return fieldE01DPUDN3.getString();
  }

  /**
  * Set field E01DPUCN4 using a String value.
  */
  public void setE01DPUCN4(String newvalue)
  {
    fieldE01DPUCN4.setString(newvalue);
  }

  /**
  * Get value of field E01DPUCN4 as a String.
  */
  public String getE01DPUCN4()
  {
    return fieldE01DPUCN4.getString();
  }

  /**
  * Set field E01DPUDN4 using a String value.
  */
  public void setE01DPUDN4(String newvalue)
  {
    fieldE01DPUDN4.setString(newvalue);
  }

  /**
  * Get value of field E01DPUDN4 as a String.
  */
  public String getE01DPUDN4()
  {
    return fieldE01DPUDN4.getString();
  }

  /**
  * Set field E01RECPOS using a String value.
  */
  public void setE01RECPOS(String newvalue)
  {
    fieldE01RECPOS.setString(newvalue);
  }

  /**
  * Get value of field E01RECPOS as a String.
  */
  public String getE01RECPOS()
  {
    return fieldE01RECPOS.getString();
  }

  /**
  * Set numeric field E01RECPOS using a BigDecimal value.
  */
  public void setE01RECPOS(BigDecimal newvalue)
  {
    fieldE01RECPOS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RECPOS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RECPOS()
  {
    return fieldE01RECPOS.getBigDecimal();
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
