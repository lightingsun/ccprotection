/**
 * 
 */
package com.planetxi.ccprotection.web.sign.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.planetxi.ccprotection.model.EndUser;
import com.planetxi.ccprotection.model.Signature;
import com.planetxi.ccprotection.repository.EndUserRepository;
import com.planetxi.ccprotection.repository.SignatureRepository;

/**
 * @author User
 * 
 */
@Controller
public class SignatureController {

    private static Logger logger = LoggerFactory.getLogger(SignatureController.class);

    @Autowired
    private SignatureRepository signatureRepository;

    @Autowired
    private EndUserRepository endUserRepository;

    /**
     * 
     * @param username
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/signature")
    public String signSignature(@RequestParam(required = true) String username, HttpServletRequest request, Model model) {

        Signature signature = getSignature(request, username);

        if (signature != null) {
            model.addAttribute("signature", signature);
        }else{
            model.addAttribute("username", username);
        }

        return "signature/view";
    }

    /**
     * 
     * @param username
     * @param request
     * @param response
     * @param model
     */
    @RequestMapping("/signature/image")
    public void viewSignatureImage(@RequestParam(required = true) String username, HttpServletRequest request, HttpServletResponse response, Model model) {

        EndUser endUser = endUserRepository.findByUsername(username);
        
        byte[] imageData = endUser.getSignatureImageData();
        ByteArrayInputStream bin = new ByteArrayInputStream(imageData);

        try {
            OutputStream outputStream = response.getOutputStream();
            IOUtils.copy(bin, outputStream);
        } catch (IOException ex) {
            logger.error(ex.getMessage(), ex);
        }
    }

    private Signature getSignature(HttpServletRequest request, String username) {

        String refererUrl = request.getHeader("Referer");
        if (refererUrl == null) {
            return null;
        }

        return signatureRepository.findByUsernameAndRefererUrl(username, refererUrl);
    }
}
