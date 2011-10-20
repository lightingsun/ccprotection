/**
 * 
 */
package com.planetxi.ccprotection.repository;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.planetxi.ccprotection.model.Signature;

/**
 * @author User
 * 
 */
@Repository("signatureRepository")
public class SignatureRepositoryImpl implements SignatureRepository {

    private HibernateTemplate hibernateTemplate;

    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.hibernateTemplate = new HibernateTemplate(sessionFactory);
    }

    public Integer insert(Signature signature) {
        return (Integer) hibernateTemplate.save(signature);

    }

    @SuppressWarnings("unchecked")
    @Override
    public Signature findByUsernameAndRefererUrl(String username, String refererUrl) {
        List<Signature> signatures = hibernateTemplate.find("from Signature where refererUrl = ? and endUser.username = ?", refererUrl, username);
        try {
            return signatures.get(0);
        } catch (Exception ex) {
            return null;
        }
    }

}
