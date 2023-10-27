package datapro.eibs.beans;

import java.math.BigDecimal;

/**
 * Insert the type's description here.
 * Creation date: (3/26/2013 3:38:05 PM)
 * @author: fhernandez
 */
public class JBStatementHeader {
	private String bank;
	private String branch;
	private String currency;
	private String accountNumber;
	private String description;
	private BigDecimal debits;
	private BigDecimal credits;
	private BigDecimal startingBalance;
	private BigDecimal calculatedBalance;
	private BigDecimal availableBalance;
	
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BigDecimal getDebits() {
		return debits;
	}
	public void setDebits(BigDecimal debits) {
		this.debits = debits;
	}
	public BigDecimal getCredits() {
		return credits;
	}
	public void setCredits(BigDecimal credits) {
		this.credits = credits;
	}
	public BigDecimal getStartingBalance() {
		return startingBalance;
	}
	public void setStartingBalance(BigDecimal startingBalance) {
		this.startingBalance = startingBalance;
	}
	public BigDecimal getCalculatedBalance() {
		return calculatedBalance;
	}
	public void setCalculatedBalance(BigDecimal calculatedBalance) {
		this.calculatedBalance = calculatedBalance;
	}
	public BigDecimal getAvailableBalance() {
		return availableBalance;
	}
	public void setAvailableBalance(BigDecimal availableBalance) {
		this.availableBalance = availableBalance;
	}
	public BigDecimal getSumTotal() {
		return debits == null ? 
			(credits == null ? new BigDecimal("0.00") : credits) : 
			(credits == null ? debits : debits.subtract(credits));
	}
}
