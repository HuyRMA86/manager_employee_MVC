package fa.training.service.impl;

import fa.training.dao.AccountDao;
import fa.training.entities.Account;
import fa.training.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;

    @Override
    public boolean saveAccount(Account account) {
        boolean result = false;
        if(accountDao.getAccount(account.getEmail()) == null) {
            result = accountDao.save(account);
        }
        return result;
    }

    @Override
    public boolean fillByEmail(String email, String password) {
        return accountDao.fillByEmail(email, password);
    }

    @Override
    public Account getAccount(String email) {
        return accountDao.getAccount(email);
    }

    @Override
    public Account getOneAccount(int id) {
        return accountDao.getOneAccount(id);
    }
}
