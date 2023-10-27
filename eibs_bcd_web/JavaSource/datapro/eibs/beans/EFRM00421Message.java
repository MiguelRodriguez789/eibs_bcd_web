package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFRM00421 physical file definition.
* 
* File level identifier is 1170202115323.
* Record format level identifier is 5E5405DA74503.
*/

public class EFRM00421Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "E21PLPNPR",
                                     "EFITYP",
                                     "EFIDEC",
                                     "EFIAM1",
                                     "EFIAM2",
                                     "EFIAM3",
                                     "EFIVAA",
                                     "EFIVAR",
                                     "EFIPAI",
                                     "H21FLGMAS"
                                   };
  final static String tnames[] = {
                                   "*numPropuesta",
                                   "tipoEstadoFinanc",
                                   "descripcionCuenta",
                                   "montoPeriodo1",
                                   "montoPeriodo2",
                                   "montoPeriodo3",
                                   "variacionAbsoluta",
                                   "variacionRelativa",
                                   "participIntegral",
                                   "*flgMas"
                                 };
  final static String fid = "1170202115323";
  final static String rid = "5E5405DA74503";
  final static String fmtname = "EFRM00421";
  final int FIELDCOUNT = 10;
  private static Hashtable tlookup = new Hashtable();
  private DecimalField fieldE21PLPNPR = null;
  private CharacterField fieldEFITYP = null;
  private CharacterField fieldEFIDEC = null;
  private CharacterField fieldEFIAM1 = null;
  private CharacterField fieldEFIAM2 = null;
  private CharacterField fieldEFIAM3 = null;
  private CharacterField fieldEFIVAA = null;
  private CharacterField fieldEFIVAR = null;
  private CharacterField fieldEFIPAI = null;
  private CharacterField fieldH21FLGMAS = null;

  /**
  * Constructor for EFRM00421Message.
  */
  public EFRM00421Message()
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
    recordsize = 244;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldE21PLPNPR =
    new DecimalField(message, HEADERSIZE + 0, 13, 0, "*numPropuesta");
    fields[1] = fieldEFITYP =
    new CharacterField(message, HEADERSIZE + 13, 20, "tipoEstadoFinanc");
    fields[2] = fieldEFIDEC =
    new CharacterField(message, HEADERSIZE + 33, 60, "descripcionCuenta");
    fields[3] = fieldEFIAM1 =
    new CharacterField(message, HEADERSIZE + 93, 25, "montoPeriodo1");
    fields[4] = fieldEFIAM2 =
    new CharacterField(message, HEADERSIZE + 118, 25, "montoPeriodo2");
    fields[5] = fieldEFIAM3 =
    new CharacterField(message, HEADERSIZE + 143, 25, "montoPeriodo3");
    fields[6] = fieldEFIVAA =
    new CharacterField(message, HEADERSIZE + 168, 25, "variacionAbsoluta");
    fields[7] = fieldEFIVAR =
    new CharacterField(message, HEADERSIZE + 193, 25, "variacionRelativa");
    fields[8] = fieldEFIPAI =
    new CharacterField(message, HEADERSIZE + 218, 25, "participIntegral");
    fields[9] = fieldH21FLGMAS =
    new CharacterField(message, HEADERSIZE + 243, 1, "*flgMas");

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
  * Set field E21PLPNPR using a String value.
  */
  public void setE21PLPNPR(String newvalue)
  {
    fieldE21PLPNPR.setString(newvalue);
  }

  /**
  * Get value of field E21PLPNPR as a String.
  */
  public String getE21PLPNPR()
  {
    return fieldE21PLPNPR.getString();
  }

  /**
  * Set numeric field E21PLPNPR using a BigDecimal value.
  */
  public void setE21PLPNPR(BigDecimal newvalue)
  {
    fieldE21PLPNPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E21PLPNPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE21PLPNPR()
  {
    return fieldE21PLPNPR.getBigDecimal();
  }

  /**
  * Set field EFITYP using a String value.
  */
  public void setEFITYP(String newvalue)
  {
    fieldEFITYP.setString(newvalue);
  }

  /**
  * Get value of field EFITYP as a String.
  */
  public String getEFITYP()
  {
    return fieldEFITYP.getString();
  }

  /**
  * Set field EFIDEC using a String value.
  */
  public void setEFIDEC(String newvalue)
  {
    fieldEFIDEC.setString(newvalue);
  }

  /**
  * Get value of field EFIDEC as a String.
  */
  public String getEFIDEC()
  {
    return fieldEFIDEC.getString();
  }

  /**
  * Set field EFIAM1 using a String value.
  */
  public void setEFIAM1(String newvalue)
  {
    fieldEFIAM1.setString(newvalue);
  }

  /**
  * Get value of field EFIAM1 as a String.
  */
  public String getEFIAM1()
  {
    return fieldEFIAM1.getString();
  }

  /**
  * Set field EFIAM2 using a String value.
  */
  public void setEFIAM2(String newvalue)
  {
    fieldEFIAM2.setString(newvalue);
  }

  /**
  * Get value of field EFIAM2 as a String.
  */
  public String getEFIAM2()
  {
    return fieldEFIAM2.getString();
  }

  /**
  * Set field EFIAM3 using a String value.
  */
  public void setEFIAM3(String newvalue)
  {
    fieldEFIAM3.setString(newvalue);
  }

  /**
  * Get value of field EFIAM3 as a String.
  */
  public String getEFIAM3()
  {
    return fieldEFIAM3.getString();
  }

  /**
  * Set field EFIVAA using a String value.
  */
  public void setEFIVAA(String newvalue)
  {
    fieldEFIVAA.setString(newvalue);
  }

  /**
  * Get value of field EFIVAA as a String.
  */
  public String getEFIVAA()
  {
    return fieldEFIVAA.getString();
  }

  /**
  * Set field EFIVAR using a String value.
  */
  public void setEFIVAR(String newvalue)
  {
    fieldEFIVAR.setString(newvalue);
  }

  /**
  * Get value of field EFIVAR as a String.
  */
  public String getEFIVAR()
  {
    return fieldEFIVAR.getString();
  }

  /**
  * Set field EFIPAI using a String value.
  */
  public void setEFIPAI(String newvalue)
  {
    fieldEFIPAI.setString(newvalue);
  }

  /**
  * Get value of field EFIPAI as a String.
  */
  public String getEFIPAI()
  {
    return fieldEFIPAI.getString();
  }

  /**
  * Set field H21FLGMAS using a String value.
  */
  public void setH21FLGMAS(String newvalue)
  {
    fieldH21FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H21FLGMAS as a String.
  */
  public String getH21FLGMAS()
  {
    return fieldH21FLGMAS.getString();
  }

}