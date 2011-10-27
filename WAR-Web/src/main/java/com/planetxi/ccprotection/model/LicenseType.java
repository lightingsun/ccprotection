/**
 * 
 */
package com.planetxi.ccprotection.model;

/**
 * @author User
 * 
 */
public enum LicenseType {

    CopyLeft("Copy Left"), CcNc("Creative Common: Non-Commercial"), CcNcNd("Creative Common: Non-Commercial and No Derivative Works"), CopyRight("Copy Right");

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
