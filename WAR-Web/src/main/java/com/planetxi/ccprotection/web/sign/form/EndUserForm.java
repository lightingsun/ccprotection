/**
 * 
 */
package com.planetxi.ccprotection.web.sign.form;

import org.springframework.web.multipart.MultipartFile;

import com.planetxi.ccprotection.model.EndUser;

/**
 * @author User
 * 
 */
public class EndUserForm extends EndUser {

    private MultipartFile signatureImageFile;

    private String confirmPassword;

    private String confirmEmail;

    private String refererUrl;

    public MultipartFile getSignatureImageFile() {
        return signatureImageFile;
    }

    public void setSignatureImageFile(MultipartFile signatureImageFile) {
        this.signatureImageFile = signatureImageFile;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getConfirmEmail() {
        return confirmEmail;
    }

    public void setConfirmEmail(String confirmEmail) {
        this.confirmEmail = confirmEmail;
    }

    public String getRefererUrl() {
        return refererUrl;
    }

    public void setRefererUrl(String refererUrl) {
        this.refererUrl = refererUrl;
    }

}
