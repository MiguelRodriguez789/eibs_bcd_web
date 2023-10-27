/*
 * Created on Nov 17, 2014
 */
package datapro.eibs.plugins;

/**
 * @author fhernandez
 */
public final class AuthorizationKey implements Comparable {
	
	private final long time;
    private final int nonce;
    
    public AuthorizationKey(long time, int nonce) {
    	this.time = time;
    	this.nonce = nonce;
    }
    
    public AuthorizationKey(long time) {
    	this.time = time;
    	this.nonce = (int) (time & 0x00000000FFFFFFFFL);
    }
    
    public AuthorizationKey(String time, String nonce) {
    	this.time = Long.parseLong(time);
    	this.nonce = Integer.parseInt(nonce);
    }

	public long getTime() {
		return time;
	}

	public int getNonce() {
		return nonce;
	}

	public int compareTo(Object o) {
		AuthorizationKey otherKey = (AuthorizationKey) o;
		long thisTime = this.time;
		return (thisTime < otherKey.getTime() ? -1 : (thisTime == otherKey .getTime() 
				? (this.getNonce() < otherKey.getNonce() ? -1 : 
					(this.getNonce() == otherKey.getNonce() ? 0 : 1)) : 1));
	}

	public boolean equals(Object o) {
		if (o == null) {
			return false;
		}
        if (this == o) {
            return true;
        }
        if (o instanceof AuthorizationKey) {
			AuthorizationKey otherKey = (AuthorizationKey) o;
			if (this.getTime() == otherKey.getTime()
				&& this.getNonce() == otherKey.getNonce()) {
				return true;
			}
		}
        return false;
	}

	public int hashCode() {
		//return 31 * nonce;
		return nonce;
	}

	public String toString() {
		return ""+time+"_"+nonce;
	}
	
}
