package fa.training.service;

import fa.training.entities.Account;

public interface AccountService {

    boolean saveAccount(Account account);
    boolean fillByEmail(String email, String password);

    Account getAccount(String email);

    Account getOneAccount(int id);
}
