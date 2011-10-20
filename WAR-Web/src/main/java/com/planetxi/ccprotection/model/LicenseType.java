/**
 * 
 */
package com.planetxi.ccprotection.model;

/**
 * @author User
 * 
 */
public enum LicenseType {

    CopyRight("Copy Right"), CcNc("Creative Common: Non-Commercial"), CcNcNd("Creative Common: Non-Commercial and No Derivative Works");

    private String description;

    private LicenseType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public LicenseType[] getValues() {
        return LicenseType.values();
    }
}
