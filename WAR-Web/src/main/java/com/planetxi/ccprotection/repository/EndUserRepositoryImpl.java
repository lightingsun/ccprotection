/**
 * 
 */
package com.planetxi.ccprotection.repository;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.planetxi.ccprotection.model.EndUser;

/**
 * @author User
 * 
 */
@Repository("endUserRepository")
public class EndUserRepositoryImpl implements EndUserRepository {

    private HibernateTemplate hibernateTemplate;

    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.hibernateTemplate = new HibernateTemplate(sessionFactory);
    }

    @SuppressWarnings("unchecked")
    @Override
    public EndUser findByUsername(String username) {
        List<EndUser> endUsers = hibernateTemplate.find("from EndUser where username = ?", username);
        try {
            return endUsers.get(0);
        } catch (RuntimeException ex) {
            return null;
        }
    }

    @Override
    public Integer insert(EndUser endUser) {
        return (Integer) hibernateTemplate.save(endUser);
    }

    @Override
    public void update(EndUser endUser) {
        hibernateTemplate.update(endUser);
    }
}
