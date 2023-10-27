/*
 * Created on Nov 17, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.plugins;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.datapro.generic.tool.Util;

/**
 * @author fhernandez
 */
public class SessionNonceProvider  {
	
	private static byte[] seed;
    private static Random rng;
    private final int nonceValiditySeconds = 3000;
    private Map nonces;
    //private final ExpiredNonceRemover remover;
    
    public SessionNonceProvider() {
		this.nonces = Collections.synchronizedMap(new HashMap());
        //this.remover = new ExpiredNonceRemover(nonces, nonceValiditySeconds);
    }
    
    private static void createSeed() throws NoSuchAlgorithmException, IOException {
		// Create a secure random number generator
    	if (seed == null) {
        	SecureRandom seedGenerator = SecureRandom.getInstance("SHA1PRNG");

    		// Get 1024 random bits
    		byte[] bytes = new byte[1024 / 8];
    		seedGenerator.nextBytes(bytes);
    		int seedByteCount = 8;
    		seed = seedGenerator.generateSeed(seedByteCount);
		}
    }
    
    private static Number randomNumber() {
        // lock on the class to protect lazy init
    	if (rng == null) {
			try {
				synchronized (SessionNonceProvider.class) {
					createSeed();
					rng = AuthorizationManager.newRandom();
					if (rng instanceof SecureRandom) {
						((SecureRandom)rng).setSeed(seed);
					} else {
						rng.setSeed(new DataInputStream(
							new ByteArrayInputStream(seed)).readLong());
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
        }
        return new Integer(rng.nextInt());
    }
	
    public boolean getNonceValidity(Number value, int nonceValiditySeconds) {
        Nonce n = (Nonce) nonces.get(value);
        if (n == null) {
            return false;
        } else if (isExpired(n.getIssued(), nonceValiditySeconds)) {
        	return false;
        } else {
            return true;
        }
    }
    
    public boolean getNonceValidity(String value, int nonceValiditySeconds) {
        return getNonceValidity(new Integer(Util.parseInt(value)), nonceValiditySeconds);
    }
    
    public boolean getNonceValidity(String value) {
    	return getNonceValidity(value, nonceValiditySeconds);
    }

    public boolean isExpired(Date issued, int nonceValiditySeconds) {
        long dif = (System.currentTimeMillis() - issued.getTime()) / 1000;
        return dif > nonceValiditySeconds;
    }
	
    public Number createNonce() {
    	Number id = randomNumber();
        Date now = new Date();
        Nonce n = new Nonce(id, now);
        nonces.put(n.getUid(), n);
        return n.getUid();
    }

}
