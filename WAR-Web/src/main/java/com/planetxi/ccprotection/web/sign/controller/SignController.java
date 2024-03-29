/**
 * 
 */
package com.planetxi.ccprotection.web.sign.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.planetxi.ccprotection.manager.SnapshotManager;
import com.planetxi.ccprotection.model.EndUser;
import com.planetxi.ccprotection.model.Signature;
import com.planetxi.ccprotection.repository.EndUserRepository;
import com.planetxi.ccprotection.repository.SignatureRepository;
import com.planetxi.ccprotection.validator.SignFormValidator;
import com.planetxi.ccprotection.web.sign.form.EndUserForm;
import com.planetxi.ccprotection.web.sign.form.SignForm;

/**
 * @author User
 * 
 */
@Controller
@SessionAttributes("signForm")
public class SignController {

    private static Logger logger = LoggerFactory.getLogger(SignController.class);

    @Autowired
    private SignatureRepository signatureRepository;

    @Autowired
    private EndUserRepository endUserRepository;

    @Autowired
    private SignFormValidator signFormValidator;

    @Autowired
    private SnapshotManager snapshotManager;

    @ModelAttribute("signForm")
    public SignForm createsignForm() {
        return new SignForm();
    }

    @RequestMapping("/sign/{username}")
    public String sign(@PathVariable("username") String username, @ModelAttribute("signForm") SignForm signForm, HttpServletRequest request, Model model) {

        if (username != null) {
            EndUser endUser = endUserRepository.findByUsername(username);

            if (endUser != null) {
                String refererUrl = request.getHeader("referer");
                Signature signature = signatureRepository.findByUsernameAndRefererUrl(username, refererUrl);

                if (signature == null) {
                    signForm.setRefererUrl(refererUrl);
                    signForm.setUsername(username);
                    return "signing/form";
                } else {
                    model.addAttribute(signature);
                    return "signature/viewDetail";
                }
            }
        }

        EndUserForm endUserForm = new EndUserForm();
        endUserForm.setUsername(username);
        endUserForm.setRefererUrl(request.getHeader("referer"));
        model.addAttribute("endUserForm", endUserForm);
        return "register/form";

    }

    @RequestMapping("/sign/verify")
    public String verifySigning(@ModelAttribute("signForm") SignForm signForm, HttpServletRequest request, Model model) {

        signFormValidator.validate(signForm);
        
        

        EndUser endUser = endUserRepository.findByUsername(signForm.getUsername());
        if (endUser != null && endUser.getPassword().equals(signForm.getPassword())) {
            // Valid login create signature
            
            Signature signature = new Signature();
            signature.setEndUser(endUser);
            signature.setRefererUrl(signForm.getRefererUrl());
            signature.setSignedDate(new Date());
            signatureRepository.insert(signature);
            
            // Snapshot or download HTML content and store into signature
            snapshotManager.snapshot(signature);
        }

        return "signing/success";
    }
}
