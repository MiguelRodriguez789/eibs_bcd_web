package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECD0020DS physical file definition.
* 
* File level identifier is 1130611112843.
* Record format level identifier is 4FF7D11472FF6.
*/

public class ECD0020DSMessage extends MessageRecord
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
                                     "E01CRITYPE",
                                     "E01CRIVEND",
                                     "E01CRIDESC",
                                     "E01CRICRIP",
                                     "E01CRICHEQ",
                                     "E01CRILONG",
                                     "E01CRIBEFO",
                                     "E01CRICHEA",
                                     "E01CRIFECH",
                                     "E01CRIHORA"
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
                                   "E01CRITYPE",
                                   "E01CRIVEND",
                                   "E01CRIDESC",
                                   "E01CRICRIP",
                                   "E01CRICHEQ",
                                   "E01CRILONG",
                                   "E01CRIBEFO",
                                   "E01CRICHEA",
                                   "E01CRIFECH",
                                   "E01CRIHORA"
                                 };
  final static String fid = "1130611112843";
  final static String rid = "4FF7D11472FF6";
  final static String fmtname = "ECD0020DS";
  final int FIELDCOUNT = 19;
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
  private CharacterField fieldE01CRITYPE = null;
  private CharacterField fieldE01CRIVEND = null;
  private CharacterField fieldE01CRIDESC = null;
  private CharacterField fieldE01CRICRIP = null;
  private CharacterField fieldE01CRICHEQ = null;
  private CharacterField fieldE01CRILONG = null;
  private CharacterField fieldE01CRIBEFO = null;
  private CharacterField fieldE01CRICHEA = null;
  private DecimalField fieldE01CRIFECH = null;
  private CharacterField fieldE01CRIHORA = null;

  /**
  * Constructor for ECD0020DSMessage.
  */
  public ECD0020DSMessage()
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
    recordsize = 222;
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
    fields[9] = fieldE01CRITYPE =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01CRITYPE");
    fields[10] = fieldE01CRIVEND =
    new CharacterField(message, HEADERSIZE + 44, 1, "E01CRIVEND");
    fields[11] = fieldE01CRIDESC =
    new CharacterField(message, HEADERSIZE + 45, 45, "E01CRIDESC");
    fields[12] = fieldE01CRICRIP =
    new CharacterField(message, HEADERSIZE + 90, 32, "E01CRICRIP");
    fields[13] = fieldE01CRICHEQ =
    new CharacterField(message, HEADERSIZE + 122, 16, "E01CRICHEQ");
    fields[14] = fieldE01CRILONG =
    new CharacterField(message, HEADERSIZE + 138, 1, "E01CRILONG");
    fields[15] = fieldE01CRIBEFO =
    new CharacterField(message, HEADERSIZE + 139, 32, "E01CRIBEFO");
    fields[16] = fieldE01CRICHEA =
    new CharacterField(message, HEADERSIZE + 171, 16, "E01CRICHEA");
    fields[17] = fieldE01CRIFECH =
    new DecimalField(message, HEADERSIZE + 187, 9, 0, "E01CRIFECH");
    fields[18] = fieldE01CRIHORA =
    new CharacterField(message, HEADERSIZE + 196, 26, "E01CRIHORA");

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
  * Set field E01CRITYPE using a String value.
  */
  public void setE01CRITYPE(String newvalue)
  {
    fieldE01CRITYPE.setString(newvalue);
  }

  /**
  * Get value of field E01CRITYPE as a String.
  */
  public String getE01CRITYPE()
  {
    return fieldE01CRITYPE.getString();
  }

  /**
  * Set field E01CRIVEND using a String value.
  */
  public void setE01CRIVEND(String newvalue)
  {
    fieldE01CRIVEND.setString(newvalue);
  }

  /**
  * Get value of field E01CRIVEND as a String.
  */
  public String getE01CRIVEND()
  {
    return fieldE01CRIVEND.getString();
  }

  /**
  * Set field E01CRIDESC using a String value.
  */
  public void setE01CRIDESC(String newvalue)
  {
    fieldE01CRIDESC.setString(newvalue);
  }

  /**
  * Get value of field E01CRIDESC as a String.
  */
  public String getE01CRIDESC()
  {
    return fieldE01CRIDESC.getString();
  }

  /**
  * Set field E01CRICRIP using a String value.
  */
  public void setE01CRICRIP(String newvalue)
  {
    fieldE01CRICRIP.setString(newvalue);
  }

  /**
  * Get value of field E01CRICRIP as a String.
  */
  public String getE01CRICRIP()
  {
    return fieldE01CRICRIP.getString();
  }

  /**
  * Set field E01CRICHEQ using a String value.
  */
  public void setE01CRICHEQ(String newvalue)
  {
    fieldE01CRICHEQ.setString(newvalue);
  }

  /**
  * Get value of field E01CRICHEQ as a String.
  */
  public String getE01CRICHEQ()
  {
    return fieldE01CRICHEQ.getString();
  }

  /**
  * Set field E01CRILONG using a String value.
  */
  public void setE01CRILONG(String newvalue)
  {
    fieldE01CRILONG.setString(newvalue);
  }

  /**
  * Get value of field E01CRILONG as a String.
  */
  public String getE01CRILONG()
  {
    return fieldE01CRILONG.getString();
  }

  /**
  * Set field E01CRIBEFO using a String value.
  */
  public void setE01CRIBEFO(String newvalue)
  {
    fieldE01CRIBEFO.setString(newvalue);
  }

  /**
  * Get value of field E01CRIBEFO as a String.
  */
  public String getE01CRIBEFO()
  {
    return fieldE01CRIBEFO.getString();
  }

  /**
  * Set field E01CRICHEA using a String value.
  */
  public void setE01CRICHEA(String newvalue)
  {
    fieldE01CRICHEA.setString(newvalue);
  }

  /**
  * Get value of field E01CRICHEA as a String.
  */
  public String getE01CRICHEA()
  {
    return fieldE01CRICHEA.getString();
  }

  /**
  * Set field E01CRIFECH using a String value.
  */
  public void setE01CRIFECH(String newvalue)
  {
    fieldE01CRIFECH.setString(newvalue);
  }

  /**
  * Get value of field E01CRIFECH as a String.
  */
  public String getE01CRIFECH()
  {
    return fieldE01CRIFECH.getString();
  }

  /**
  * Set numeric field E01CRIFECH using a BigDecimal value.
  */
  public void setE01CRIFECH(BigDecimal newvalue)
  {
    fieldE01CRIFECH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRIFECH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRIFECH()
  {
    return fieldE01CRIFECH.getBigDecimal();
  }

  /**
  * Set field E01CRIHORA using a String value.
  */
  public void setE01CRIHORA(String newvalue)
  {
    fieldE01CRIHORA.setString(newvalue);
  }

  /**
  * Get value of field E01CRIHORA as a String.
  */
  public String getE01CRIHORA()
  {
    return fieldE01CRIHORA.getString();
  }

}