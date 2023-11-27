package fa.training.dao;

import fa.training.entities.Account;

public interface AccountDao {

    boolean save(Account account);
    boolean fillByEmail(String email, String password);
    Account getAccount(String email);

    Account getOneAccount (int id);
}
