import java.security.PrivateKey;
import java.security.PublicKey;

import junit.framework.Assert;

import org.junit.Test;

import bingo.sso.server.crypto.Signature;

/**
 * This file created at 2010-10-27.
 *
 * Copyright (c) 2002-2010 Bingosoft, Inc. All rights reserved.
 */

/**
 * <code>{@link SignatureKey}</code>
 *
 * TODO : document me
 *
 * @author yohn
 */
public class SignatureKey {
	
	@Test
	public void generate(){
		String keyPairs[] = Signature.generateBase64KeyPair();
		System.out.println(keyPairs[0]);
		
		System.out.println("=============public key =============");
		
		System.out.println(keyPairs[1]);
	}
	
	@Test
	public void verify(){
		String keyPairs[] = new String[]{"MIIBtjCCASsGByqGSM44BAEwggEeAoGBANQAf+r8Htwrp9kFGFIfGJvOo21Dy5b8wjtCLdHd6TyFkVw0j9cvc2UHPOn7B350XzYu4PUcRawWpzF3xC79tviSP3wkeMvoOlf1q6NuAJfTn0gP9rXfq/M+SopMOFLwaZoQUlprL6nnV8zCaoTQWQiHMcVUXpqh4NynMlsgg9pzAhUAlo10LS2NqkgvGJYiyEfesE8/jYECgYBza72Ngn8gjOnp8wGNqBejJCex8/EqNY3ya3DxQdMXD30J97aDznYvWEDqnaX5fa95MTZPXCfXJlASCbLHyeV6YT79k16rGqCibXQB8eh+Ugpht7cvZGiU2avsKVGLreoJba+wue5t1RVxnLSsRsbs4U/pGh1TxfZPkPD3efB1fAOBhAACgYAHE7nyONSyZGMwFuMB7ZKHdL62/jF8OaDoaNWSmH3uL9y2ipbJvhZb3PqqrV9ZcHNouOQbPgM4Gx2+2/u+EiSaCEr49zljCwnXRAum0CgisI13CP09ZBOiBs+XEyaDYuHv44S3oVjy/RpxD8rw8cDfzZX6eRXfBHySS8lkNXNzrA==","MIIBSwIBADCCASsGByqGSM44BAEwggEeAoGBANQAf+r8Htwrp9kFGFIfGJvOo21Dy5b8wjtCLdHd6TyFkVw0j9cvc2UHPOn7B350XzYu4PUcRawWpzF3xC79tviSP3wkeMvoOlf1q6NuAJfTn0gP9rXfq/M+SopMOFLwaZoQUlprL6nnV8zCaoTQWQiHMcVUXpqh4NynMlsgg9pzAhUAlo10LS2NqkgvGJYiyEfesE8/jYECgYBza72Ngn8gjOnp8wGNqBejJCex8/EqNY3ya3DxQdMXD30J97aDznYvWEDqnaX5fa95MTZPXCfXJlASCbLHyeV6YT79k16rGqCibXQB8eh+Ugpht7cvZGiU2avsKVGLreoJba+wue5t1RVxnLSsRsbs4U/pGh1TxfZPkPD3efB1fAQXAhUAikdnvMJXCkRueJkxQolm2nwHlAo="};
		
		PrivateKey privateKey = Signature.decodePrivateKey(keyPairs[1].replaceAll(" ", "")
				.replaceAll("\\t", ""));
		
		PublicKey publicKey = Signature.decodePublicKey(keyPairs[0].replaceAll(" ", "")
				.replaceAll("\\t", ""));
		
		String accountSig = Signature.sign(privateKey,"test_account");
		
		boolean isVerify = Signature.verify(publicKey, "test_account",
				accountSig);
		Assert.assertTrue(isVerify);
	}

}
