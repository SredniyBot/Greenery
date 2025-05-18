package ru.greenery.greenery.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.greenery.greenery.entity.User;

public interface UserRepo extends JpaRepository<User,Long> {

    User findByEmail(String email);
    User findByActivationCode(String activationCode);
    User findByRestoreCode(String activationCode);

}
