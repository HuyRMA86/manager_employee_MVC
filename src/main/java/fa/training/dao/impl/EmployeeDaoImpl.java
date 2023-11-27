package fa.training.dao.impl;

import fa.training.dao.EmployeeDao;
import fa.training.dto.AddEmployee;
import fa.training.dto.SearchParam;
import fa.training.entities.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Employee fillByPhone(String phone) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "From Employee e Where e.phone = :phone";
        Query<Employee> query = session.createQuery(hql);
        query.setParameter("phone", phone);
        return query.uniqueResult();
    }

    @Override
    public boolean createEmployee(Employee employee) {
        Session session = sessionFactory.getCurrentSession();
        return session.save(employee) != null;
    }

    @Override
    public List<Employee> getAllEmployee() {
        Session session = sessionFactory.getCurrentSession();
        String hql = "From Employee";
        Query<Employee> query = session.createQuery(hql);
        return query.getResultList();
    }

    @Override
    public Employee getOneEmployee(int id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "From Employee e Where e.id = :id";
        Query<Employee> query = session.createQuery(hql);
        query.setParameter("id", id);
        return query.uniqueResult();
    }


    @Override
    public List<Employee> getEmployeeWithPaging(int page, int pageSize) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Employee> query = builder.createQuery(Employee.class);
        Root<Employee> root = query.from(Employee.class);
        query = query.select(root);
        query = query.orderBy(builder.asc(root.get("id")));
        javax.persistence.Query q = session.createQuery(query);

        q.setFirstResult((page - 1) * pageSize);
        q.setMaxResults(pageSize);

        List<Employee> employees = q.getResultList();
        return employees;
    }

    @Override
    public List<Employee> getListEmployee(int page, int pageSize, String hql) {
        Session session = sessionFactory.getCurrentSession();
        Query<Employee> query = session.createQuery(hql);
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        List<Employee> employees = query.getResultList();
        return employees;
    }
}

