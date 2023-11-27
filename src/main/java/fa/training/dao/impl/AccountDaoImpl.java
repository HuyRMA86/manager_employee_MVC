package fa.training.dao.impl;

import fa.training.dao.AccountDao;
import fa.training.entities.Account;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDaoImpl implements AccountDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean save(Account account) {
        Session session = sessionFactory.getCurrentSession();
        return session.save(account) != null;
    }

    @Override
    public boolean fillByEmail(String email, String password) {

        Session session = sessionFactory.getCurrentSession();
        String hql = "From Account a Where a.email = :email and a.password = :password";
        Query<Account> query = session.createQuery(hql);
        query.setParameter("email", email);
        query.setParameter("password", password);
        return query.uniqueResult() != null;
    }

    @Override
    public Account getAccount(String email) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "From Account a Where a.email = :email";
        Query<Account> query = session.createQuery(hql);
        query.setParameter("email", email);
        return query.uniqueResult();
    }

    @Override
    public Account getOneAccount(int id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "select a From Account a Join a.employee e Where e.id = :id";
        Query<Account> query = session.createQuery(hql);
        query.setParameter("id", id);
        return query.uniqueResult();
    }
}
