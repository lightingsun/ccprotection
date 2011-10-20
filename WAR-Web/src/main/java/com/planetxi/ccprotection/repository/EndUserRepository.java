package com.planetxi.ccprotection.repository;

import com.planetxi.ccprotection.model.EndUser;

public interface EndUserRepository {

    EndUser findByUsername(String username);

    Integer insert(EndUser endUser);

    void update(EndUser endUser);

}
