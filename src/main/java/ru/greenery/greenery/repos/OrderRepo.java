package ru.greenery.greenery.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.greenery.greenery.entity.Order;

public interface OrderRepo extends JpaRepository<Order,Long> {



}
