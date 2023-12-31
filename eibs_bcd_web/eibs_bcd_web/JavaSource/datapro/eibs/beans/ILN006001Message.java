package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ILN006001 physical file definition.
* 
* File level identifier is 1030214173541.
* Record format level identifier is 343FB09EB80F6.
*/

public class ILN006001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "LN61USER",
                                     "LN61TYPE",
                                     "LN61LNECUN",
                                     "LN61LNENUM",
                                     "LN61LNETYL",
                                     "LN61LNECCY",
                                     "LN61LNEAMN",
                                     "LN61LNEREA",
                                     "LN61LNEAMU",
                                     "LN61LNEOFA",
                                     "LN61COLAMT",
                                     "LN61LNEOCM",
                                     "LN61LNERE1",
                                     "LN61LNERE2",
                                     "LN61LNERE3",
                                     "LN61LNEPUR",
                                     "LN61LNEOP1",
                                     "LN61LNEOP2",
                                     "LN61LNEOP3",
                                     "LN61LNEMT1",
                                     "LN61LNEMT2",
                                     "LN61LNEMT3",
                                     "LN61AVAILA",
                                     "LN61RATE"
                                   };
  final static String tnames[] = {
                                   "LN61USER",
                                   "LN61TYPE",
                                   "LN61LNECUN",
                                   "LN61LNENUM",
                                   "LN61LNETYL",
                                   "LN61LNECCY",
                                   "LN61LNEAMN",
                                   "LN61LNEREA",
                                   "LN61LNEAMU",
                                   "LN61LNEOFA",
                                   "LN61COLAMT",
                                   "LN61LNEOCM",
                                   "LN61LNERE1",
                                   "LN61LNERE2",
                                   "LN61LNERE3",
                                   "LN61LNEPUR",
                                   "LN61LNEOP1",
                                   "LN61LNEOP2",
                                   "LN61LNEOP3",
                                   "LN61LNEMT1",
                                   "LN61LNEMT2",
                                   "LN61LNEMT3",
                                   "LN61AVAILA",
                                   "LN61RATE"
                                 };
  final static String fid = "1030214173541";
  final static String rid = "343FB09EB80F6";
  final static String fmtname = "ILN006001";
  final int FIELDCOUNT = 24;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldLN61USER = null;
  private CharacterField fieldLN61TYPE = null;
  private DecimalField fieldLN61LNECUN = null;
  private DecimalField fieldLN61LNENUM = null;
  private CharacterField fieldLN61LNETYL = null;
  private CharacterField fieldLN61LNECCY = null;
  private DecimalField fieldLN61LNEAMN = null;
  private DecimalField fieldLN61LNEREA = null;
  private DecimalField fieldLN61LNEAMU = null;
  private DecimalField fieldLN61LNEOFA = null;
  private DecimalField fieldLN61COLAMT = null;
  private DecimalField fieldLN61LNEOCM = null;
  private DecimalField fieldLN61LNERE1 = null;
  private DecimalField fieldLN61LNERE2 = null;
  private DecimalField fieldLN61LNERE3 = null;
  private CharacterField fieldLN61LNEPUR = null;
  private DecimalField fieldLN61LNEOP1 = null;
  private DecimalField fieldLN61LNEOP2 = null;
  private DecimalField fieldLN61LNEOP3 = null;
  private DecimalField fieldLN61LNEMT1 = null;
  private DecimalField fieldLN61LNEMT2 = null;
  private DecimalField fieldLN61LNEMT3 = null;
  private DecimalField fieldLN61AVAILA = null;
  private DecimalField fieldLN61RATE = null;

  /**
  * Constructor for ILN006001Message.
  */
  public ILN006001Message()
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
    recordsize = 228;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldLN61USER =
    new CharacterField(message, HEADERSIZE + 0, 10, "LN61USER");
    fields[1] = fieldLN61TYPE =
    new CharacterField(message, HEADERSIZE + 10, 4, "LN61TYPE");
    fields[2] = fieldLN61LNECUN =
    new DecimalField(message, HEADERSIZE + 14, 10, 0, "LN61LNECUN");
    fields[3] = fieldLN61LNENUM =
    new DecimalField(message, HEADERSIZE + 24, 5, 0, "LN61LNENUM");
    fields[4] = fieldLN61LNETYL =
    new CharacterField(message, HEADERSIZE + 29, 4, "LN61LNETYL");
    fields[5] = fieldLN61LNECCY =
    new CharacterField(message, HEADERSIZE + 33, 3, "LN61LNECCY");
    fields[6] = fieldLN61LNEAMN =
    new DecimalField(message, HEADERSIZE + 36, 17, 2, "LN61LNEAMN");
    fields[7] = fieldLN61LNEREA =
    new DecimalField(message, HEADERSIZE + 53, 17, 2, "LN61LNEREA");
    fields[8] = fieldLN61LNEAMU =
    new DecimalField(message, HEADERSIZE + 70, 17, 2, "LN61LNEAMU");
    fields[9] = fieldLN61LNEOFA =
    new DecimalField(message, HEADERSIZE + 87, 17, 2, "LN61LNEOFA");
    fields[10] = fieldLN61COLAMT =
    new DecimalField(message, HEADERSIZE + 104, 17, 2, "LN61COLAMT");
    fields[11] = fieldLN61LNEOCM =
    new DecimalField(message, HEADERSIZE + 121, 17, 2, "LN61LNEOCM");
    fields[12] = fieldLN61LNERE1 =
    new DecimalField(message, HEADERSIZE + 138, 3, 0, "LN61LNERE1");
    fields[13] = fieldLN61LNERE2 =
    new DecimalField(message, HEADERSIZE + 141, 3, 0, "LN61LNERE2");
    fields[14] = fieldLN61LNERE3 =
    new DecimalField(message, HEADERSIZE + 144, 3, 0, "LN61LNERE3");
    fields[15] = fieldLN61LNEPUR =
    new CharacterField(message, HEADERSIZE + 147, 35, "LN61LNEPUR");
    fields[16] = fieldLN61LNEOP1 =
    new DecimalField(message, HEADERSIZE + 182, 3, 0, "LN61LNEOP1");
    fields[17] = fieldLN61LNEOP2 =
    new DecimalField(message, HEADERSIZE + 185, 3, 0, "LN61LNEOP2");
    fields[18] = fieldLN61LNEOP3 =
    new DecimalField(message, HEADERSIZE + 188, 3, 0, "LN61LNEOP3");
    fields[19] = fieldLN61LNEMT1 =
    new DecimalField(message, HEADERSIZE + 191, 3, 0, "LN61LNEMT1");
    fields[20] = fieldLN61LNEMT2 =
    new DecimalField(message, HEADERSIZE + 194, 3, 0, "LN61LNEMT2");
    fields[21] = fieldLN61LNEMT3 =
    new DecimalField(message, HEADERSIZE + 197, 3, 0, "LN61LNEMT3");
    fields[22] = fieldLN61AVAILA =
    new DecimalField(message, HEADERSIZE + 200, 17, 2, "LN61AVAILA");
    fields[23] = fieldLN61RATE =
    new DecimalField(message, HEADERSIZE + 217, 11, 6, "LN61RATE");

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
  * Set field LN61USER using a String value.
  */
  public void setLN61USER(String newvalue)
  {
    fieldLN61USER.setString(newvalue);
  }

  /**
  * Get value of field LN61USER as a String.
  */
  public String getLN61USER()
  {
    return fieldLN61USER.getString();
  }

  /**
  * Set field LN61TYPE using a String value.
  */
  public void setLN61TYPE(String newvalue)
  {
    fieldLN61TYPE.setString(newvalue);
  }

  /**
  * Get value of field LN61TYPE as a String.
  */
  public String getLN61TYPE()
  {
    return fieldLN61TYPE.getString();
  }

  /**
  * Set field LN61LNECUN using a String value.
  */
  public void setLN61LNECUN(String newvalue)
  {
    fieldLN61LNECUN.setString(newvalue);
  }

  /**
  * Get value of field LN61LNECUN as a String.
  */
  public String getLN61LNECUN()
  {
    return fieldLN61LNECUN.getString();
  }

  /**
  * Set numeric field LN61LNECUN using a BigDecimal value.
  */
  public void setLN61LNECUN(BigDecimal newvalue)
  {
    fieldLN61LNECUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNECUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNECUN()
  {
    return fieldLN61LNECUN.getBigDecimal();
  }

  /**
  * Set field LN61LNENUM using a String value.
  */
  public void setLN61LNENUM(String newvalue)
  {
    fieldLN61LNENUM.setString(newvalue);
  }

  /**
  * Get value of field LN61LNENUM as a String.
  */
  public String getLN61LNENUM()
  {
    return fieldLN61LNENUM.getString();
  }

  /**
  * Set numeric field LN61LNENUM using a BigDecimal value.
  */
  public void setLN61LNENUM(BigDecimal newvalue)
  {
    fieldLN61LNENUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNENUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNENUM()
  {
    return fieldLN61LNENUM.getBigDecimal();
  }

  /**
  * Set field LN61LNETYL using a String value.
  */
  public void setLN61LNETYL(String newvalue)
  {
    fieldLN61LNETYL.setString(newvalue);
  }

  /**
  * Get value of field LN61LNETYL as a String.
  */
  public String getLN61LNETYL()
  {
    return fieldLN61LNETYL.getString();
  }

  /**
  * Set field LN61LNECCY using a String value.
  */
  public void setLN61LNECCY(String newvalue)
  {
    fieldLN61LNECCY.setString(newvalue);
  }

  /**
  * Get value of field LN61LNECCY as a String.
  */
  public String getLN61LNECCY()
  {
    return fieldLN61LNECCY.getString();
  }

  /**
  * Set field LN61LNEAMN using a String value.
  */
  public void setLN61LNEAMN(String newvalue)
  {
    fieldLN61LNEAMN.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEAMN as a String.
  */
  public String getLN61LNEAMN()
  {
    return fieldLN61LNEAMN.getString();
  }

  /**
  * Set numeric field LN61LNEAMN using a BigDecimal value.
  */
  public void setLN61LNEAMN(BigDecimal newvalue)
  {
    fieldLN61LNEAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEAMN()
  {
    return fieldLN61LNEAMN.getBigDecimal();
  }

  /**
  * Set field LN61LNEREA using a String value.
  */
  public void setLN61LNEREA(String newvalue)
  {
    fieldLN61LNEREA.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEREA as a String.
  */
  public String getLN61LNEREA()
  {
    return fieldLN61LNEREA.getString();
  }

  /**
  * Set numeric field LN61LNEREA using a BigDecimal value.
  */
  public void setLN61LNEREA(BigDecimal newvalue)
  {
    fieldLN61LNEREA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEREA as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEREA()
  {
    return fieldLN61LNEREA.getBigDecimal();
  }

  /**
  * Set field LN61LNEAMU using a String value.
  */
  public void setLN61LNEAMU(String newvalue)
  {
    fieldLN61LNEAMU.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEAMU as a String.
  */
  public String getLN61LNEAMU()
  {
    return fieldLN61LNEAMU.getString();
  }

  /**
  * Set numeric field LN61LNEAMU using a BigDecimal value.
  */
  public void setLN61LNEAMU(BigDecimal newvalue)
  {
    fieldLN61LNEAMU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEAMU as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEAMU()
  {
    return fieldLN61LNEAMU.getBigDecimal();
  }

  /**
  * Set field LN61LNEOFA using a String value.
  */
  public void setLN61LNEOFA(String newvalue)
  {
    fieldLN61LNEOFA.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEOFA as a String.
  */
  public String getLN61LNEOFA()
  {
    return fieldLN61LNEOFA.getString();
  }

  /**
  * Set numeric field LN61LNEOFA using a BigDecimal value.
  */
  public void setLN61LNEOFA(BigDecimal newvalue)
  {
    fieldLN61LNEOFA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEOFA as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEOFA()
  {
    return fieldLN61LNEOFA.getBigDecimal();
  }

  /**
  * Set field LN61COLAMT using a String value.
  */
  public void setLN61COLAMT(String newvalue)
  {
    fieldLN61COLAMT.setString(newvalue);
  }

  /**
  * Get value of field LN61COLAMT as a String.
  */
  public String getLN61COLAMT()
  {
    return fieldLN61COLAMT.getString();
  }

  /**
  * Set numeric field LN61COLAMT using a BigDecimal value.
  */
  public void setLN61COLAMT(BigDecimal newvalue)
  {
    fieldLN61COLAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61COLAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61COLAMT()
  {
    return fieldLN61COLAMT.getBigDecimal();
  }

  /**
  * Set field LN61LNEOCM using a String value.
  */
  public void setLN61LNEOCM(String newvalue)
  {
    fieldLN61LNEOCM.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEOCM as a String.
  */
  public String getLN61LNEOCM()
  {
    return fieldLN61LNEOCM.getString();
  }

  /**
  * Set numeric field LN61LNEOCM using a BigDecimal value.
  */
  public void setLN61LNEOCM(BigDecimal newvalue)
  {
    fieldLN61LNEOCM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEOCM as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEOCM()
  {
    return fieldLN61LNEOCM.getBigDecimal();
  }

  /**
  * Set field LN61LNERE1 using a String value.
  */
  public void setLN61LNERE1(String newvalue)
  {
    fieldLN61LNERE1.setString(newvalue);
  }

  /**
  * Get value of field LN61LNERE1 as a String.
  */
  public String getLN61LNERE1()
  {
    return fieldLN61LNERE1.getString();
  }

  /**
  * Set numeric field LN61LNERE1 using a BigDecimal value.
  */
  public void setLN61LNERE1(BigDecimal newvalue)
  {
    fieldLN61LNERE1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNERE1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNERE1()
  {
    return fieldLN61LNERE1.getBigDecimal();
  }

  /**
  * Set field LN61LNERE2 using a String value.
  */
  public void setLN61LNERE2(String newvalue)
  {
    fieldLN61LNERE2.setString(newvalue);
  }

  /**
  * Get value of field LN61LNERE2 as a String.
  */
  public String getLN61LNERE2()
  {
    return fieldLN61LNERE2.getString();
  }

  /**
  * Set numeric field LN61LNERE2 using a BigDecimal value.
  */
  public void setLN61LNERE2(BigDecimal newvalue)
  {
    fieldLN61LNERE2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNERE2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNERE2()
  {
    return fieldLN61LNERE2.getBigDecimal();
  }

  /**
  * Set field LN61LNERE3 using a String value.
  */
  public void setLN61LNERE3(String newvalue)
  {
    fieldLN61LNERE3.setString(newvalue);
  }

  /**
  * Get value of field LN61LNERE3 as a String.
  */
  public String getLN61LNERE3()
  {
    return fieldLN61LNERE3.getString();
  }

  /**
  * Set numeric field LN61LNERE3 using a BigDecimal value.
  */
  public void setLN61LNERE3(BigDecimal newvalue)
  {
    fieldLN61LNERE3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNERE3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNERE3()
  {
    return fieldLN61LNERE3.getBigDecimal();
  }

  /**
  * Set field LN61LNEPUR using a String value.
  */
  public void setLN61LNEPUR(String newvalue)
  {
    fieldLN61LNEPUR.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEPUR as a String.
  */
  public String getLN61LNEPUR()
  {
    return fieldLN61LNEPUR.getString();
  }

  /**
  * Set field LN61LNEOP1 using a String value.
  */
  public void setLN61LNEOP1(String newvalue)
  {
    fieldLN61LNEOP1.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEOP1 as a String.
  */
  public String getLN61LNEOP1()
  {
    return fieldLN61LNEOP1.getString();
  }

  /**
  * Set numeric field LN61LNEOP1 using a BigDecimal value.
  */
  public void setLN61LNEOP1(BigDecimal newvalue)
  {
    fieldLN61LNEOP1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEOP1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEOP1()
  {
    return fieldLN61LNEOP1.getBigDecimal();
  }

  /**
  * Set field LN61LNEOP2 using a String value.
  */
  public void setLN61LNEOP2(String newvalue)
  {
    fieldLN61LNEOP2.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEOP2 as a String.
  */
  public String getLN61LNEOP2()
  {
    return fieldLN61LNEOP2.getString();
  }

  /**
  * Set numeric field LN61LNEOP2 using a BigDecimal value.
  */
  public void setLN61LNEOP2(BigDecimal newvalue)
  {
    fieldLN61LNEOP2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEOP2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEOP2()
  {
    return fieldLN61LNEOP2.getBigDecimal();
  }

  /**
  * Set field LN61LNEOP3 using a String value.
  */
  public void setLN61LNEOP3(String newvalue)
  {
    fieldLN61LNEOP3.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEOP3 as a String.
  */
  public String getLN61LNEOP3()
  {
    return fieldLN61LNEOP3.getString();
  }

  /**
  * Set numeric field LN61LNEOP3 using a BigDecimal value.
  */
  public void setLN61LNEOP3(BigDecimal newvalue)
  {
    fieldLN61LNEOP3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEOP3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEOP3()
  {
    return fieldLN61LNEOP3.getBigDecimal();
  }

  /**
  * Set field LN61LNEMT1 using a String value.
  */
  public void setLN61LNEMT1(String newvalue)
  {
    fieldLN61LNEMT1.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEMT1 as a String.
  */
  public String getLN61LNEMT1()
  {
    return fieldLN61LNEMT1.getString();
  }

  /**
  * Set numeric field LN61LNEMT1 using a BigDecimal value.
  */
  public void setLN61LNEMT1(BigDecimal newvalue)
  {
    fieldLN61LNEMT1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEMT1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEMT1()
  {
    return fieldLN61LNEMT1.getBigDecimal();
  }

  /**
  * Set field LN61LNEMT2 using a String value.
  */
  public void setLN61LNEMT2(String newvalue)
  {
    fieldLN61LNEMT2.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEMT2 as a String.
  */
  public String getLN61LNEMT2()
  {
    return fieldLN61LNEMT2.getString();
  }

  /**
  * Set numeric field LN61LNEMT2 using a BigDecimal value.
  */
  public void setLN61LNEMT2(BigDecimal newvalue)
  {
    fieldLN61LNEMT2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEMT2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEMT2()
  {
    return fieldLN61LNEMT2.getBigDecimal();
  }

  /**
  * Set field LN61LNEMT3 using a String value.
  */
  public void setLN61LNEMT3(String newvalue)
  {
    fieldLN61LNEMT3.setString(newvalue);
  }

  /**
  * Get value of field LN61LNEMT3 as a String.
  */
  public String getLN61LNEMT3()
  {
    return fieldLN61LNEMT3.getString();
  }

  /**
  * Set numeric field LN61LNEMT3 using a BigDecimal value.
  */
  public void setLN61LNEMT3(BigDecimal newvalue)
  {
    fieldLN61LNEMT3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61LNEMT3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61LNEMT3()
  {
    return fieldLN61LNEMT3.getBigDecimal();
  }

  /**
  * Set field LN61AVAILA using a String value.
  */
  public void setLN61AVAILA(String newvalue)
  {
    fieldLN61AVAILA.setString(newvalue);
  }

  /**
  * Get value of field LN61AVAILA as a String.
  */
  public String getLN61AVAILA()
  {
    return fieldLN61AVAILA.getString();
  }

  /**
  * Set numeric field LN61AVAILA using a BigDecimal value.
  */
  public void setLN61AVAILA(BigDecimal newvalue)
  {
    fieldLN61AVAILA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61AVAILA as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61AVAILA()
  {
    return fieldLN61AVAILA.getBigDecimal();
  }

  /**
  * Set field LN61RATE using a String value.
  */
  public void setLN61RATE(String newvalue)
  {
    fieldLN61RATE.setString(newvalue);
  }

  /**
  * Get value of field LN61RATE as a String.
  */
  public String getLN61RATE()
  {
    return fieldLN61RATE.getString();
  }

  /**
  * Set numeric field LN61RATE using a BigDecimal value.
  */
  public void setLN61RATE(BigDecimal newvalue)
  {
    fieldLN61RATE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LN61RATE as a BigDecimal.
  */
  public BigDecimal getBigDecimalLN61RATE()
  {
    return fieldLN61RATE.getBigDecimal();
  }

}
