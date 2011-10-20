/**
 * 
 */
package com.planetxi.ccprotection.web.sign.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.planetxi.ccprotection.constant.Constant;
import com.planetxi.ccprotection.model.EndUser;
import com.planetxi.ccprotection.repository.EndUserRepository;
import com.planetxi.ccprotection.repository.SignatureRepository;
import com.planetxi.ccprotection.validator.EndUserFormValidator;
import com.planetxi.ccprotection.web.sign.form.EndUserForm;

/**
 * @author User
 * 
 */
@Controller
@SessionAttributes("endUserForm")
public class RegisterController {

    private static Logger logger = LoggerFactory.getLogger(RegisterController.class);

    @Autowired
    private EndUserRepository endUserRepository;

    @Autowired
    private EndUserFormValidator endUserFormValidator;

    @Autowired
    private SignatureRepository signatureRepository;

    @ModelAttribute("endUserForm")
    public EndUserForm createEndUserForm() {
        return new EndUserForm();
    }

    @RequestMapping(value = "/register/confirm", method = RequestMethod.POST)
    public String confirm(@ModelAttribute("endUserForm") EndUserForm endUserForm, Model model) {

        endUserFormValidator.validate(endUserForm);

        return "register/confirm";
    }

    @RequestMapping(value = "/register/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("endUserForm") EndUserForm endUserForm, Model model) {

        endUserFormValidator.validate(endUserForm);

        // Save endUser to table
        EndUser endUser = new EndUser();

        try {
            BeanUtils.copyProperties(endUserForm, endUser, new String[] { "confirmPassword", "confirmEmail", "refererUrl", "signatureImageData" });
        } catch (Exception ex) {
            logger.error(ex.getMessage(), ex);
        }

        endUser.setId(endUserRepository.insert(endUser));

        return "register/createSignature";
    }

    @RequestMapping(value = "/register/submitSignature", method = RequestMethod.POST)
    public String submitSignature(@ModelAttribute("endUserForm") EndUserForm endUserForm, Model model) {

        EndUser endUser = endUserRepository.findByUsername(endUserForm.getUsername());

        try {
            endUser.setSignatureImageData(endUserForm.getSignatureImageFile().getBytes());
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }

        endUserRepository.update(endUser);

        model.addAttribute("signatureCode", String.format(Constant.SIGNATURE_BASE_URL, endUserForm.getUsername()));

        return "register/success";
    }
}
