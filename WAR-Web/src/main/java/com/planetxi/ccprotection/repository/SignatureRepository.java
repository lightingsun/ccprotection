package com.planetxi.ccprotection.repository;

import com.planetxi.ccprotection.model.Signature;

public interface SignatureRepository {

    Signature findByUsernameAndRefererUrl(String username, String refererUrl);

    Integer insert(Signature signature);

}
